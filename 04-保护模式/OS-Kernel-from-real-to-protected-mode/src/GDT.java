

/*|BYTE7| BYTE6 | BYTE5 | BYTE4 | BYTE3 | BYTE2 | BYTE1 | BYTE0 */
public class GDT {
    byte[] segmentLength_low = new byte[2]; //BYTE1| BYTE0
    
    byte[] baseAddressLow = new byte[3]; //BYTE2 | BYTE3 | BYTE4
    
    byte[] attribute = new byte[2]; // BYTE5 | BYTE6
                                    // BYTE6 的头4个bit 用于segment length, 于是段长度的字长为20bit
    
    byte addressHigh = 0 ; //BYTE7
    
    //实模式下的寻找方式
    //段寄存器 * 16 + 偏移(16bit)
    
}
