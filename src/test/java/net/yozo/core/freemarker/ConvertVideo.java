package net.yozo.core.freemarker;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.io.FileUtils;

import java.io.File;
import java.io.IOException;
public class ConvertVideo {

    public static void main(String args[]) throws IOException {
        try{
            tet();
        }catch(Exception e){
            System.out.print("asdasdasdasdasd");

        }

        /*String a="http://192.168.0.121:81/storeData/ymshop/admin/video/20170620/木版画.mp4";
        String r= StringUtils.substringBeforeLast(a,"/");
        System.out.println(r);*/
        /*File file = new File("C:\\upload\\ymshop\\admin\\video\\20170620\\238\\m3u8");
        try{
            if(file.exists())
            {
                FileUtils.deleteDirectory(file);
                file.mkdir();
            }
            else
                file.mkdirs();
        }catch(Exception e){
            e.printStackTrace();
        }*/
        /*try {
            File afile = new File("C:\\upload\\ymshop\\admin\\video\\20170620\\木版画.mp4");
            if (afile.renameTo(new File("C:\\upload\\ymshop\\admin\\video\\20170620\\238\\" + afile.getName()))) {
                System.out.println("File is moved successful!");
            } else {
                System.out.println("File is failed to move!");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }*/
    }

    private static void tet() throws IOException{

            int a=5/0;

    }
}


