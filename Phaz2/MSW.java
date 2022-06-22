import java.math.BigInteger;
import java.util.*;
import java.io.*;

public class MSW {
    public static int targetOfJamp = 0;

    public static boolean isRegister(String reg) {
        return (reg.equals("zero") || reg.equals("a0") || reg.equals("a1") || reg.equals("a2") || reg.equals("a3"));
    }

    public static String getCodeReg(String reg) {
        String code = "";
        switch (reg) {
            case "zero":
                code = "00000";
                break;
            case "a0":
                code = "00001";
                break;
            case "a1":
                code = "00010";
                break;
            case "a2":
                code = "00011";
                break;
            case "a3":
                code = "00100";
            default:
                System.out.println(">>> Error, register value doesnt exist!");
                System.exit(0);
                break;
        }
        return code;
    }

    public static boolean isImmediateValid(String imm) {
        boolean valid = false;
        try {
            int im = Integer.parseInt(imm);

            if (im < 0 || im > 65534)
                valid = false;
            else
                valid = true;
        } catch (NumberFormatException nfe) {
            System.out.println(">>> Error, register and/or immediate value doesnt exist!");
            System.exit(0);
        }
        return valid;
    }

    public static String getBinaryFromDec(String Dec) {
        int num = Integer.parseInt(Dec);
        String binarized = Integer.toBinaryString(num);
        int len = binarized.length();
        String sixteenZeroes = "00000000000000000";
        if (len < 16)
            binarized = sixteenZeroes.substring(0, 16 - len).concat(binarized);
        else
            binarized = binarized.substring(len - 16);
        return binarized;
    }

    /*public static String convertBinaryToHexadecimal(String binaryStr) {
        return new BigInteger(binaryStr, 2).toString(16);
    }


     */
    public static String convertBinaryToHexadecimal(String binary) {
        int sum = 0;
        String ans="";
        for(int i=0;i<binary.length();i+=4) {
            sum = 0;
            String tmp = "";
            for (int j = i; j <i + 4; j++) {
                tmp += binary.charAt(j);
            }
            sum = Integer.parseInt(tmp);
            if (sum == 0)
                ans += "0";
            else if (sum == 1)
                ans += "1";
            else if (sum == 10)
                ans += "2";
            else if (sum == 11)
                ans += "3";
            else if (sum == 100)
                ans += "4";
            else if (sum == 101)
                ans += "5";
            else if (sum == 110)
                ans += "6";
            else if (sum == 111)
                ans += "7";
            else if (sum == 1000)
                ans += "8";
            else if (sum == 1001)
                ans += "9";
            else if (sum == 1010)
                ans += "A";
            else if (sum == 1011)
                ans += "B";
            else if (sum == 1100)
                ans += "C";
            else if (sum == 1101)
                ans += "D";
            else if (sum == 1110)
                ans += "E";
            else if (sum == 1111)
                ans += "F";
        }
        return ans;
    }

    public static String encode(String line[],HashMap hm) {
        String opcode = line[0].toLowerCase();
        String rs = "", rt = "", rd = "", Imm = "", target = "",beqAddress="";
        boolean isRegDis = false;
        String hex = "";
        if(opcode.equals("halt")) {
            System.out.println("Hex Code: " + "0000f000" + "  >>>  " + "Instruction: " + opcode);
            return "0000f000";
        }
        if (!opcode.equals("jamp")) {
            if (isRegister(line[3])) {                                           //R-Type
                isRegDis = true;
                rd = line[1];
                rs = line[2];
                rt = line[3];
            } else {                                                             //I-Type
                if (!opcode.equals("beq") && isImmediateValid(line[3])) {
                    rs = line[1];
                    rt = line[2];
                    Imm = line[3];
                }
            }
            switch (opcode) {
                case "or":
                    if (isRegDis) {
                        hex = "000000" + getCodeReg(rs) + getCodeReg(rt) + getCodeReg(rd) + "00000" + "000001";
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rd + " " + rs + " " + rt);
                    } else {
                        hex = "000001" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    }
                    break;
                case "add":
                    if (isRegDis) {
                        hex = "000000" + getCodeReg(rs) + getCodeReg(rt) + getCodeReg(rd) + "00000" + "000010";
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rd + " " + rs + " " + rt);
                    } else {
                        hex = "000010" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    }
                    break;
                case "mult":
                    if (isRegDis) {
                        hex = "000000" + getCodeReg(rs) + getCodeReg(rt) + getCodeReg(rd) + "00000" + "000011";
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rd + " " + rs + " " + rt);
                    } else {
                        hex = "000011" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    }
                    break;
                case "div":
                    if (isRegDis) {
                        hex = "000000" + getCodeReg(rs) + getCodeReg(rt) + getCodeReg(rd) + "00000" + "000100";
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rd + " " + rs + " " + rt);
                    } else {
                        hex = "000100" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    }
                    break;
                case "store":
                    if (isRegister(line[1]) && isRegister(line[2]) && !isRegDis) {
                        hex = "000101" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    } else {
                        System.out.println("¿STORE?");
                        System.out.println(">>> Error! instruction has invalid arguments, its correct form: STORE REGDest, REGSource");
                        System.exit(0);
                    }
                    break;
                case "load":
                    if (isRegister(line[1]) && isRegister(line[2]) && !isRegDis) {
                        hex = "000110" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    } else {
                        System.out.println("¿LOAD?");
                        System.out.println(">>> Error! instruction has invalid arguments, its correct form: STORE REGDest, REGSource");
                        System.exit(0);
                    }
                    break;
                case "beq":
                    if (isRegister(line[1]) && isRegister(line[2]) && !isRegDis) {
                        rs = line[1];
                        rt = line[2];
                        beqAddress = (String) hm.get(line[3] + ":");
                        hex = "000111" + getCodeReg(rs) + getCodeReg(rt) + beqAddress;
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + line[3]);
                    }
                    break;
                case "and":
                    if (isRegDis) {
                        hex = "000000" + getCodeReg(rs) + getCodeReg(rt) + getCodeReg(rd) + "00000" + "000000";
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rd + " " + rs + " " + rt);
                    }
                    /*else {
                        hex = "001000" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    }
                    */
                    break;
                case "sub":
                    if (isRegDis) {
                        hex = "000000" + getCodeReg(rs) + getCodeReg(rt) + getCodeReg(rd) + "00000" + "000111";
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rd + " " + rs + " " + rt);
                    }
                    /*else {
                        hex = "001001" + getCodeReg(rs) + getCodeReg(rt) + getBinaryFromDec(Imm);
                        hex = convertBinaryToHexadecimal(hex);
                        String temp = "";
                        for (int i = 0; i < 8 - hex.length(); i++)
                            temp += "0";
                        temp += hex;
                        hex = temp;
                        System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + rs + " " + rt + " " + Imm);
                    }
                    */
                    break;
                default:
                    System.out.println(">>> Error! I Give UP!");
                    System.exit(0);
                    break;
            }
        }
        else{                                                                    //J-Type
            target = (String) hm.get(line[1] + ":");
            hex = "110000" + "0000000000" + target;
            hex = convertBinaryToHexadecimal(hex);
            String temp = "";
            for (int i = 0; i < 8 - hex.length(); i++)
                temp += "0";
            temp += hex;
            hex = temp;
            System.out.println("Hex Code: " + hex + "  >>>  " + "Instruction: " + opcode + " " + line[1] + ":");
        }

        return hex;
    }

    public static void processor(String file){
        try{
            File read = new File(file);
            File write = new File("hex.txt");
            FileOutputStream fOUS = new FileOutputStream(write);
            DataOutputStream dOUS = new DataOutputStream(fOUS);
            Scanner input=new Scanner(read);
            HashMap<String,String> hm=new HashMap<>();
            System.out.println("++++++++++++++++++ Start to Assembling! ++++++++++++++++++");
            while(input.hasNextLine()){
                String line[] = input.nextLine().trim().split("\\s|,");
                if(!line[0].equals("") && line[0].charAt(0) !='#') {
                    if(line[0].charAt(line[0].length()-1) == ':'){
                        targetOfJamp += 1;
                        String trg = getBinaryFromDec(Integer.toString(targetOfJamp));
                        hm.put(line[0],trg);
                        System.out.println("Store Label in Hash Map: { " + line[0] + " }");
                    }
                    else
                        dOUS.writeBytes(encode(line,hm)+" ");
                }
            }
            System.out.println("------------------------------------------------------");
            System.out.println("Assembling Successfully Done");
            System.out.println("Have a Nice Day :D");
            System.out.println("------------------------------------------------------");
        }
        catch (FileNotFoundException fNFE){
            System.out.println(">>> Error! Input file does not exist, check the entered name!");
            System.exit(0);
        }
        catch (IOException ioe){
            System.out.println("I/O error!");
            ioe.printStackTrace();
            System.exit(0);
        }
    }

    public static void main(String[]args){
        Scanner input = new Scanner(System.in);
        System.out.println("-----------------------------------------------");
        System.out.println(" MSW 32bits Assembler");
        System.out.println("-----------------------------------------------");
        System.out.println("Enter the file name to be processed:");
        String fileName = input.next();
        processor(fileName);
    }
}