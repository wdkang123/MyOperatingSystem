import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.ArrayList;


public class CKernelAsmPrecessor {
    private BufferedReader fileReader = null;
    StringBuffer fileBuffer = null;
    
    public CKernelAsmPrecessor() {
    	try {
    		File file = new File("kernel.bat");
    		file.delete();
    		
			fileReader = new BufferedReader(new FileReader("ckernel_u.asm"));
			File f = new File("ckernenl_u.asm");
			fileBuffer = new StringBuffer((int)f.length()); 
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void process() {
    	String lineText = null;
    	try {
			while ((lineText = fileReader.readLine()) != null) {
				String line = lineText.toLowerCase();
				if (line.contains("global") || line.contains("extern") || line.contains("section")) {
					continue;
				}
				
				fileBuffer.append(lineText).append("\r\n");
			}
			
			fileReader.close();
			BufferedWriter bw = new BufferedWriter(new FileWriter("ckernel.asm"));
			bw.write(fileBuffer.toString());
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    
    public void createKernelBinary() {
    	handleOutOfRangeError();
    	
    	try {
			Process process = Runtime.getRuntime().exec("/usr/local/bin/nasm -o kernel.bat kernel.asm");
			readProcessOutput(process);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
    }
    
    private void readProcessOutput(Process process) {
    	read(process.getInputStream(), System.out);
    	read(process.getErrorStream(), System.err);
    }
    
    private void read(InputStream inputStream, PrintStream out) {
    	try {
    		BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream));
    		String line;
    		while ((line = reader.readLine()) != null) {
    			out.println(line);
    		}
    	} catch(IOException e) {
    		e.printStackTrace();
    	} finally {
    		try {
    			inputStream.close();
    		} catch(IOException e) {
    			e.printStackTrace();
    		}
    	}
    }
    
    private void handleOutOfRangeError() {
    	try {
			ArrayList<String> jumps = new ArrayList<String>();
			jumps.add("jz");
			jumps.add("jnz");
			jumps.add("jc");
			jumps.add("jne");
			jumps.add("jg ");
			jumps.add("jle");
			jumps.add("jge");
			jumps.add("js");
			jumps.add("je");
			
			
    		fileReader = new BufferedReader(new FileReader("ckernel.asm"));
			File f = new File("ckernenl.asm");
			fileBuffer = new StringBuffer((int)f.length()); 
			String lineText = null;
			
			while ((lineText = fileReader.readLine()) != null) {
				String line = lineText.toLowerCase();
				for(int i = 0; i < jumps.size(); i++) {
					if (line.contains(jumps.get(i))) {
						int pos = line.indexOf(jumps.get(i));
						String strFirst = line.substring(0, pos + jumps.get(i).length());
						String strSecond = line.substring(pos + jumps.get(i).length(), line.length());
						lineText = strFirst + " near " + strSecond;
						break;
					}
				}
				
				fileBuffer.append(lineText).append("\r\n");
			}
			
			fileReader.close();
			BufferedWriter bw = new BufferedWriter(new FileWriter("ckernel.asm"));
			bw.write(fileBuffer.toString());
			bw.close();
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}
