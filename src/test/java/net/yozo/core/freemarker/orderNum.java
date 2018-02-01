package net.yozo.core.freemarker;
;
import net.yozo.core.util.ImageUtils;


import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;


public class orderNum {
    public void getTimeByDate(){

        //转换提日期输出格式
        Date date=new Date();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
        System.out.println(dateFormat.format(date));
    }

    public static void main(String[] args) throws Exception {
        System.out.println("****************************");
        SimpleDateFormat s1 = new SimpleDateFormat("yyyy-MM-dd 23:59:59");
        SimpleDateFormat s2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        Date now=new Date();
        String fromDate = s1.format(now);
        String toDate = s2.format(now);
        long from = s1.parse(fromDate).getTime();
        long to = s2.parse(toDate).getTime();
        int second = (int) ((to - from)/(1000));
        System.out.println(second);
    }
}

