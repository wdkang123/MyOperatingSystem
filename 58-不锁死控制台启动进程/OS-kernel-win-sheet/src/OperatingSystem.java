import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;


public class OperatingSystem {
   
    private Floppy floppyDisk = new Floppy();
    private int  MAX_SECTOR_NUM = 18;
  
    
    private void writeFileToFloppy(String fileName, boolean bootable, int cylinder,int beginSec) {
    	File file = new File(fileName);
    	InputStream in = null;
  
    	
    	try {
    		in = new FileInputStream(file);
    		byte[] buf = new byte[512];
    		if (bootable) {
    			buf[510] = 0x55;
        		buf[511] = (byte) 0xaa;	
    		}
    		
    		Floppy.MAGNETIC_HEAD head = Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0;
    		
    		while (in.read(buf) > 0) {
    			//将内核读入到磁盘第0面，第0柱面，第1个扇区
    			floppyDisk.writeFloppy(head, cylinder, beginSec, buf);
    			
    			System.out.println("Load file " + fileName + " to floppy with cylinder: " + cylinder + " and sector:" + beginSec );
    			if (beginSec >= MAX_SECTOR_NUM) {
    				beginSec = 0;
    				cylinder++;
    			}
    			
    			beginSec++;
    		}
    	} catch(IOException e) {
    		e.printStackTrace();
    		return;
    	}
    }
    
    public OperatingSystem(String s) {
    	writeFileToFloppy(s, true, 0, 1);
    }
    
    
    public void makeFllopy()   {
    	writeFileToFloppy("kernel.bat", false, 1, 1);
    	
    	//test file system
    	//此处容易出错，一旦内核大小超过6柱面1扇区后，下面的代码将会产生问题
    	DiskFileSystem fileSys = new DiskFileSystem(floppyDisk, 6, 1);
    	FileHeader header = new FileHeader();
    	header.setFileName("abc");
    	header.setFileExt("exe");
    	byte[] date = new byte[2];
    	date[0] = 0x11;
    	date[1] = 0x12;
    	header.setFileTime(date);
    	header.setFileDate(date);
    	String s = "abc.exe";
    	
    	byte[] bbuf = new byte[2048];
    	File file = new File("hlt.bat");
    	InputStream in = null;
    	try {
    		in = new FileInputStream(file);
    		long len = file.length();
    		
    		int count = 0;
    		while (count < file.length()) {
    			bbuf[count] = (byte) in.read();
    			count++;
    		}
    		
    		in.close();
    	}catch(IOException e) {
    		e.printStackTrace();
    		return;
    	}
    	
    	header.setFileContent(bbuf);
    	fileSys.addHeader(header);
    	
    	header = new FileHeader();
    	header.setFileName("efg");
    	header.setFileExt("sys");
    	String s1 = "this is content in file efg.sys";
    	header.setFileContent(s1.getBytes());
    	fileSys.addHeader(header);
    	
    	header = new FileHeader();
    	header.setFileName("ijk");
    	header.setFileExt("txt");
    	header.setFileSize(64);
    	fileSys.addHeader(header);
    	
    	fileSys.flashFileHeaders();
    	
    	//test file system
    	
    	floppyDisk.makeFloppy("system.img");
    }
    
  
    
   

    public static void main(String[] args) {
    	CKernelAsmPrecessor kernelPrecessor = new CKernelAsmPrecessor();
    	kernelPrecessor.process();
    	kernelPrecessor.createKernelBinary();
    	
    	CKernelAsmPrecessor appPrecessor = new CKernelAsmPrecessor("hlt.bat", "app_u.asm", "app.asm", "api_call.asm");
    	appPrecessor.process();
    	appPrecessor.createKernelBinary();
    	
    	
    	OperatingSystem op = new OperatingSystem("boot.bat");
    	op.makeFllopy();
    }
}
