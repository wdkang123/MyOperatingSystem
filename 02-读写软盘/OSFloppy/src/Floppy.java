import java.io.DataOutputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;


public class Floppy {
	enum MAGNETIC_HEAD {
		MAGNETIC_HEAD_0,
		MAGETIC_HEAD_1
	};
	
   
	public int SECTOR_SIZE = 512;
	private int CYLINDER_COUNT = 80; //80个柱面
	private int SECTORS_COUNT = 18;
    private MAGNETIC_HEAD magneticHead = MAGNETIC_HEAD.MAGNETIC_HEAD_0;
    private int current_cylinder = 0;
    private int current_sector = 0;
    
    private HashMap<Integer,ArrayList<ArrayList<byte[]>> > floppy = new HashMap<Integer,ArrayList<ArrayList<byte[]>> >(); //一个磁盘两个面
    
    public Floppy() {

    	initFloppy();
    }
    
    private void initFloppy() {
    	
    	//一个磁盘有两个盘面
    	floppy.put(MAGNETIC_HEAD.MAGNETIC_HEAD_0.ordinal(), initFloppyDisk());
    	floppy.put(MAGNETIC_HEAD.MAGETIC_HEAD_1.ordinal(), initFloppyDisk());
    }
    
    private ArrayList<ArrayList<byte[]>> initFloppyDisk() {
    	ArrayList<ArrayList<byte[]>> floppyDisk = new ArrayList<ArrayList<byte[]>>(); //磁盘的一个面
    	//一个磁盘面有80个柱面
    	for(int i = 0; i < CYLINDER_COUNT; i++) {
    		floppyDisk.add(initCylinder());
    	}
    	
    	return floppyDisk;
    }
  
    private ArrayList<byte[]> initCylinder() {
    	//构造一个柱面，一个柱面有18个扇区
    	ArrayList<byte[]> cylinder = new ArrayList<byte[]> ();
    	for (int i = 0; i < SECTORS_COUNT; i++) {
    		byte[] sector = new byte[SECTOR_SIZE];
    		cylinder.add(sector);
    	}
    	
    	return cylinder;
    }
    
    public void setMagneticHead(MAGNETIC_HEAD head) {
    	magneticHead = head;
    }
    
    public void setCylinder(int cylinder) {
    	if (cylinder < 0) {
    		this.current_cylinder = 0;
    	}
    	else if (cylinder >= 80) {
    		this.current_cylinder = 79;
    	}
    	else {
    		this.current_cylinder = cylinder;
    	}
    }
    
    public void setSector(int sector) {
    	//sector 编号从1到18
    	if (sector < 0) {
    		this.current_sector = 0;
    	}
    	else if (sector > 18) {
    		this.current_sector = 18 - 1;
    	}
    	else {
    		this.current_sector = sector - 1;
    	}
    }
    
    public byte[] readFloppy(MAGNETIC_HEAD head, int cylinder_num, int sector_num) {
    	setMagneticHead(head);
    	setCylinder(cylinder_num);
    	setSector(sector_num);
    	
    	ArrayList<ArrayList<byte[]>> disk = floppy.get(this.magneticHead.ordinal());
    	ArrayList<byte[]> cylinder = disk.get(this.current_cylinder);
 
    	byte[] sector = cylinder.get(this.current_sector);
    	
    	return sector;
    }
    
    public void writeFloppy(MAGNETIC_HEAD head, int cylinder_num, int sector_num, byte[] buf) {
    	setMagneticHead(head);
    	setCylinder(cylinder_num);
    	setSector(sector_num);
    	
    	ArrayList<ArrayList<byte[]>> disk = floppy.get(this.magneticHead.ordinal());
    	ArrayList<byte[]> cylinder = disk.get(this.current_cylinder);
    	
    	byte[] buffer = cylinder.get(this.current_sector);
    	System.arraycopy(buf, 0, buffer, 0, buf.length);
    }
    
    public void makeFloppy(String fileName) {
    	try {
    		/*
    		 * 虚拟软盘是存粹的二进制文件，它的逻辑结构如下：
    		 * 前512*18 字节的内容对应盘面0，柱面0的所有扇区内容
    		 * 接着的512*18字节的内容对应盘面1，柱面0的所有扇区内容
    		 * 再接着的512*18字节的内容对应盘面0，柱面1所有扇区内容
    		 * 再接着512*18字节的内容对应盘面1，柱面1所有扇区内容
    		 * 以此类推
    		 */
			DataOutputStream out = new DataOutputStream(new FileOutputStream(fileName));
			for (int cylinder = 0; cylinder < CYLINDER_COUNT; cylinder++) {
			  for (int head = 0; head <= MAGNETIC_HEAD.MAGETIC_HEAD_1.ordinal(); head++) {
				  for (int sector = 1; sector <= SECTORS_COUNT; sector++) {
						byte[] buf = readFloppy(MAGNETIC_HEAD.values()[head], cylinder, sector);
						
						out.write(buf);
					}
				
			    }
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
