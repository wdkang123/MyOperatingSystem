
public class DiskFileSystem {
	private Floppy floppyWriter;
	private int beginSec;
	private int fileHeaderCount = 0;
	private byte[] buffer = new byte[512];
	private int cylinder = 0;
	
    public DiskFileSystem(Floppy disk, int  cylinder, int sec) {
    	this.floppyWriter = disk;
    	this.beginSec = sec;
    	this.cylinder = cylinder;
    }
    
    public void addHeader(FileHeader header) {
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
}
