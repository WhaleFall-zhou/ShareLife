import org.junit.Test;

import java.io.*;

public class testa {
    @Test
    public void test() throws IOException {
        File file = new File("C:\\Users\\lenovo\\IdeaProjects\\ShareLife\\src\\main\\webapp\\resource\\md\\demo12.md");
        BufferedReader bufferedReader=new BufferedReader(new FileReader(file));
//        FileInputStream fileInputStream = new FileInputStream(file);
//        int read = fileInputStream.read();
//        System.out.println(read);
        String s;
        StringBuffer stringBuffer = new StringBuffer();
        while((s = bufferedReader.readLine())!=null){
            stringBuffer.append(s+"/n");
        }
        System.out.println(stringBuffer.toString());


    }
    @Test
    public void test2(){
        int rid = (int)(Math.random() * 7 + 100000);
        System.out.println(rid);
    }
}
