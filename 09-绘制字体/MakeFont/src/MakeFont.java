import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;


public class MakeFont {
	private String fontFilePath;
	File file = new File("fontData.inc");
	FileWriter fileWriter = null; 
	
    public MakeFont(String fontFile) {
    	this.fontFilePath = fontFile;
    	
    	try {
    		fileWriter = new FileWriter(file.getName(), true);
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public void makeFont() {
    	try {
    		String encoding = "GBK";
    		File file = new File(fontFilePath);
    		if (file.isFile() && file.exists()) {
    			fileWriter.write("systemFont:\n");
    			
    			InputStreamReader read = new InputStreamReader(new FileInputStream(file), encoding);
    			BufferedReader bufferedReader = new BufferedReader(read);
    			String lineText = null;
    			while((lineText = bufferedReader.readLine()) != null) {
    				if (lineText.contains("char")) {
    					writeFontBinary(bufferedReader);
    				}
    				
    			}
    			
    			fileWriter.flush();
    			fileWriter.close();
    		}
    	} catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    private void writeFontBinary(BufferedReader reader) throws IOException {
    	int lineCount = 16;
    	fileWriter.write("db ");
    	
    	while (lineCount > 0) {
    		String lineText = reader.readLine();
    		byte b = 0;
    		for (int i = 0; i < 8; i++) {
    			if (lineText.charAt(i) == '*') {
    				b |= (1 << (8 - i - 1));
    			}
    		}
    		
    		lineCount--;
    		String s=  "0" + Integer.toHexString(b & 0xFF) + "H" ;
    		if (lineCount > 0) {
    			s += " ,";
    		}
    		
    		fileWriter.write(s);
    		
    	}
    	
    	fileWriter.write("\n");
    }
    
    public static void main(String[] args) {
    	MakeFont makeFont = new MakeFont("font.txt");
    	makeFont.makeFont();
    	System.out.println("Make font success!");
    }
}
