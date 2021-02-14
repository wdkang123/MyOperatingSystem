
public class DiskFileSystem {
	private Floppy floppyWriter;
	private int beginSec;
	private int fileHeaderCount = 0;
	private byte[] buffer = new byte[512];
	private int cylinder = 0;
	
	private short  fileClusterNo = 0;  
    private int  fileContentCylinder = 7;
	private int  fileContentSector = 1;
	
	private static int SECTOR_SIZE = 512;
	private static int CYLINDER_SECTOR = 18;
	
    public DiskFileSystem(Floppy disk, int  cylinder, int sec) {
    	this.floppyWriter = disk;
    	this.beginSec = sec;
    	this.cylinder = cylinder;
    	//change here
    	fileContentCylinder = cylinder + 1;
    }
    
    public void addHeader(FileHeader header) {
    	flashFileContent(header);
    	
    	if (fileHeaderCount >= 16) {
    		flashFileHeaders();
    		fileHeaderCount = 0;
    		buffer = new byte[512];
    		beginSec++;
    	}
    	
    	
    	byte[] headerBuf = header.getHeaderBuffer();
    	for (int i = 0; i < 32; i++) {
    		buffer[fileHeaderCount * 32 + i] = headerBuf[i];
    	}
    	
    	fileHeaderCount++;
    	
    }
    
    public void flashFileHeaders() {
    	floppyWriter.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0 , cylinder, beginSec, buffer);
    }
    
    private void flashFileContent(FileHeader header) {
    	if (header.getFileBuffer() == null) {
    		return;
    	}
    	
    	short sectors = (short) (header.getFileSize() / SECTOR_SIZE + 1);
    	
    	byte[] s = new byte[2];
    	s[1] = (byte)(fileClusterNo >>8 );
    	s[0] = (byte)(fileClusterNo >> 0);
    	header.setFileClusterNo(s);
    	
    	fileClusterNo += sectors;
    	byte[] buffer = header.getFileBuffer(); 
    	int pos = 0;
    	while (sectors > 0) {
    		if (fileContentSector >= CYLINDER_SECTOR) {
    			fileContentSector = 1;
    			fileContentCylinder++;
    		}
    		
    		byte[] buf = new byte[512];
    		for (int i = pos; i < pos + 512; i++) {
    			if (i < buffer.length) {
    				buf[i - pos] = buffer[i];
    			}
    		}
    		
    		pos += 512;
    		
    		if (header.getFileBuffer() != null) {
    			floppyWriter.writeFloppy(Floppy.MAGNETIC_HEAD.MAGNETIC_HEAD_0, fileContentCylinder, fileContentSector, 
    	    		    buf);	
    		}
    	    
    	    fileContentSector++;
    	    sectors--;
    	}
    }
}
