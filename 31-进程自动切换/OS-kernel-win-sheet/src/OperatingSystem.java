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
    	
    	floppyDisk.makeFloppy("system.img");
    }
    
   

    public static void main(String[] args) {
    	CKernelAsmPrecessor kernelPrecessor = new CKernelAsmPrecessor();
    	kernelPrecessor.process();
    	kernelPrecessor.createKernelBinary();
    	
    	OperatingSystem op = new OperatingSystem("boot.bat");
    	op.makeFllopy();
    }
}
