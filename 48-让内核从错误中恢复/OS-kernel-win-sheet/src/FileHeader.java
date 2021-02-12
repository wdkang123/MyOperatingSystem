import java.nio.ByteBuffer;


public class FileHeader {
    private byte[] header = new byte[32];
    
    private byte[] content = null;
    
    private int fileSize = 0;
    
    public void setFileName(String s) {
    	int len = s.length() > 8 ? 8 : s.length();
    	for (int i = 0; i < len; i++) {
    		header[i] = (byte)s.charAt(i);
    	}
    }
    
    public void setFileExt(String s) {
    	int len = s.length() > 3 ? 3 : s.length();
    	for (int i = 0; i < len; i++) {
    		header[8+i] = (byte)s.charAt(i);
    	}
    }
    
    public void setFileType(Byte t) {
    	header[11] = t;
    }
    
    public void setFileTime(byte[] time) {
    	header[22] = time[0];
    	header[23] = time[1];
    }
    
    public void setFileDate(byte[] date) {
    	header[24] = date[0];
    	header[25] = date[1];
    }
    
    public void setFileClusterNo(byte[] no) {
    	header[26] = no[0];
    	header[27] = no[1];
    }
    
    public void setFileSize(int size) {
    	byte[] buf = ByteBuffer.allocate(4).putInt(size).array();
    	for (int i = 0; i < 4; i++) {
    		header[28+i] = buf[3 - i];
    	}
    	
    	fileSize = size;
    }
    
    public int getFileSize() {
    	return fileSize;
    }
    
    public byte[] getHeaderBuffer() {
    	return header;
    }
    
    public void setFileContent(byte[] f) {
    	this.content = f;
    	setFileSize(f.length);
    }
    
    public byte[] getFileBuffer() {
    	return content;
    }
}
