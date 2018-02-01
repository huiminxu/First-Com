package net.yozo.core.wxpay.test;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import net.yozo.core.wxpay.sdk.WXPay;
import net.yozo.core.wxpay.sdk.WXPayUtil;
import net.yozo.services.front.order.bean.Order;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import sun.misc.BASE64Encoder;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class TestWXPayPerformance {
    private static Log log = LogFactory.getLog(TestWXPayPerformance.class);

    private WXPay wxpay;
    private WXPayConfigImpl config;
    private String out_trade_no;
    private String total_fee;

    public TestWXPayPerformance() throws Exception {
        config = WXPayConfigImpl.getInstance();
        wxpay = new WXPay(config);
        total_fee = "1";
        out_trade_no = "201701017496748980290005";
    }

    /**
     * 扫码支付  下单
     */
    public String doUnifiedOrder(Order order) {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("body", order.getTemplateName());
        data.put("out_trade_no", order.getOrderNum());
        data.put("device_info", "");
        data.put("fee_type", "CNY");
        String amount=""+(int)(100*Double.valueOf(order.getAmount()));
        data.put("total_fee", amount);
        data.put("spbill_create_ip", "192.168.1.64");
        data.put("notify_url", "http://www.yomoer.cn/paygate/wxNotify");
        data.put("trade_type", "NATIVE");
        data.put("product_id", "12");
        // data.put("time_expire", "20170112104120");
        String wx =null;
        try {
            Map<String, String> r = wxpay.unifiedOrder(data);
            System.out.println(r);
            if(!r.get("return_code").equals("SUCCESS")){
                log.error("通信失败,错误信息："+r.get("return_msg"));
            }else if(!r.get("result_code").equals("SUCCESS")){
                log.error("业务出错,错误代码："+r.get("err_code"));
            }else{
                log.info("微信下单成功");
                wx=getQRCodeImge2(r.get("code_url"),256,256);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return wx;
    }


    public void doOrderClose() {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("out_trade_no", out_trade_no);
        try {
            Map<String, String> r = wxpay.closeOrder(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//订单查询
    public String doOrderQuery(Order order) {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("out_trade_no", order.getOrderNum());
//        data.put("transaction_id", "4008852001201608221962061594");
        String queryResult="wait";
        try {
            Map<String, String> r = wxpay.orderQuery(data);
            if(!r.get("return_code").equals("SUCCESS")){
                log.error("通信失败,错误信息："+r.get("return_msg"));
            }else if(!r.get("result_code").equals("SUCCESS")){
                log.error("业务出错,错误代码："+r.get("err_code"));
            }else if(!r.get("trade_state").equals("SUCCESS")){
                String tradeStatus=r.get("trade_state");
                //交易状态分别代表了 PAYERROR--支付失败(其他原因，如银行返回失败)； REVOKED—已撤销（刷卡支付）；CLOSED—已关闭
                if(tradeStatus.equals("PAYERROR")||tradeStatus.equals("REVOKED")||tradeStatus.equals("CLOSED")){
                    queryResult="A002";
                    log.info("wx订单支付失败");
                }else{
                //其他交易状态，如NOTPAY—未支付，USERPAYING--用户支付中
                    log.info("wx等待支付");
                }
            }else {
                log.info("wx订单支付成功");
                queryResult="A001";
            }


        } catch (Exception e) {
            e.printStackTrace();
        }
        return queryResult;
    }

    public void doMicropayWithPos() {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("out_trade_no", "1493279484111-1");
        data.put("body", "测试");
        data.put("total_fee", "1");
        data.put("auth_code", "130063802586380514");
        try {
            Map<String, String> r = wxpay.microPayWithPos(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void doOrderReverse() {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("out_trade_no", out_trade_no);
//        data.put("transaction_id", "4008852001201608221962061594");
        try {
            Map<String, String> r = wxpay.reverse(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }



    /**
     * 长链接转短链接
     * 测试成功
     */
    public void doShortUrl() {
        String long_url = "weixin://wxpay/bizpayurl?pr=etxB4DY";
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("long_url", long_url);
        try {
            Map<String, String> r = wxpay.shortUrl(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 退款
     * 已测试
     */
    public void doRefund() {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("out_trade_no", out_trade_no);
        data.put("out_refund_no", out_trade_no);
        data.put("total_fee", total_fee);
        data.put("refund_fee", total_fee);
        data.put("refund_fee_type", "CNY");
        data.put("op_user_id", config.getMchID());

        try {
            Map<String, String> r = wxpay.refund(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 查询退款
     * 已经测试
     */
    public void doRefundQuery() {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("out_refund_no", out_trade_no);
        try {
            Map<String, String> r = wxpay.refundQuery(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 对账单下载
     * 已测试
     */
    public void doDownloadBill() {
        HashMap<String, String> data = new HashMap<String, String>();
        data.put("bill_date", "20161102");
        data.put("bill_type", "ALL");
        try {
            Map<String, String> r = wxpay.downloadBill(data);
            System.out.println(r);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


//    public void doReport() {
//        HashMap<String, String> data = new HashMap<String, String>();
//        data.put("interface_url", "20160822");
//        data.put("bill_type", "ALL");
//    }

    /**
     * 小测试
     */
    public void test001() {
        String xmlStr="<xml><return_code><![CDATA[SUCCESS]]></return_code>\n" +
                "<return_msg><![CDATA[OK]]></return_msg>\n" +
                "<appid><![CDATA[wx273fe72f2db863ed]]></appid>\n" +
                "<mch_id><![CDATA[1228845802]]></mch_id>\n" +
                "<nonce_str><![CDATA[lCXjx3wNx45HfTV2]]></nonce_str>\n" +
                "<sign><![CDATA[68D7573E006F0661FD2A77BA59124E87]]></sign>\n" +
                "<result_code><![CDATA[SUCCESS]]></result_code>\n" +
                "<openid><![CDATA[oZyc_uPx_oed7b4q1yKmj_3M2fTU]]></openid>\n" +
                "<is_subscribe><![CDATA[N]]></is_subscribe>\n" +
                "<trade_type><![CDATA[NATIVE]]></trade_type>\n" +
                "<bank_type><![CDATA[CFT]]></bank_type>\n" +
                "<total_fee>1</total_fee>\n" +
                "<fee_type><![CDATA[CNY]]></fee_type>\n" +
                "<transaction_id><![CDATA[4008852001201608221983528929]]></transaction_id>\n" +
                "<out_trade_no><![CDATA[20160822162018]]></out_trade_no>\n" +
                "<attach><![CDATA[]]></attach>\n" +
                "<time_end><![CDATA[20160822202556]]></time_end>\n" +
                "<trade_state><![CDATA[SUCCESS]]></trade_state>\n" +
                "<cash_fee>1</cash_fee>\n" +
                "</xml>";
        try {
            System.out.println(xmlStr);
            System.out.println("+++++++++++++++++");
            System.out.println(WXPayUtil.isSignatureValid(xmlStr, config.getKey()));
            Map<String, String> hm = WXPayUtil.xmlToMap(xmlStr);
            System.out.println("+++++++++++++++++");
            System.out.println(hm);
            System.out.println(hm.get("attach").length());

        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    public void testUnifiedOrderSpeed() throws Exception {
        TestWXPayPerformance dodo = new TestWXPayPerformance();

        for (int i=0; i<100; ++i) {
            long startTs = System.currentTimeMillis();
            out_trade_no = out_trade_no+i;
            //dodo.doUnifiedOrder();
            long endTs = System.currentTimeMillis();
            System.out.println(String.format("time used to unified order: %ld", endTs-startTs));
            Thread.sleep(2000);
        }

    }

    public void testRefundSpeed() throws Exception {
        TestWXPayPerformance dodo = new TestWXPayPerformance();

        for (int i=0; i<1000; ++i) {
            long startTs = System.currentTimeMillis();
            out_trade_no = out_trade_no+i;
            dodo.doRefund();
            long endTs = System.currentTimeMillis();
            System.out.println(String.format("time used to refund: %ld", endTs-startTs));
            Thread.sleep(2*1000);
        }

    }

    public void testUnifiedOrderSpeedWithMultiThread() throws Exception {
        Runnable task = new Runnable() {
            public void run() {
                try {
                    testUnifiedOrderSpeed();
                }
                catch (Exception ex) {

                }
            }
        };
        int threadNum = 8;
        ArrayList<Thread> threads = new ArrayList<Thread>();
        for (int i=0; i<threadNum; ++i) {
            threads.add(new Thread(task));
        }
        for (int i=0; i<threadNum; ++i) {
            threads.get(i).start();
        }
        for (int i=0; i<threadNum; ++i) {
            threads.get(i).join();
        }

    }

    public void testRefundSpeedWithMultiThread() throws Exception {
        Runnable task = new Runnable() {
            public void run() {
                try {
                    testRefundSpeed();
                }
                catch (Exception ex) {

                }
            }
        };
        int threadNum = 8;
        ArrayList<Thread> threads = new ArrayList<Thread>();
        for (int i=0; i<threadNum; ++i) {
            threads.add(new Thread(task));
        }
        for (int i=0; i<threadNum; ++i) {
            threads.get(i).start();
        }
        for (int i=0; i<threadNum; ++i) {
            threads.get(i).join();
        }

    }

    public void testHelloWorld() throws Exception {
        for (int i=0; i<1000; ++i) {
            System.out.println("hi");
            Thread.sleep(1000);
        }
    }



    public static void main(String[] args) throws Exception {
        System.out.println("--------------->");
        TestWXPayPerformance dodo = new TestWXPayPerformance();

        //dodo.doUnifiedOrder();
        //dodo.doRefund();

        // dodo.doMicropayWithPos();

        // dodo.testUnifiedOrderSpeed();
        // dodo.testUnifiedOrderSpeedWithMultiThread();
        // dodo.testRefundSpeedWithMultiThread();
        // dodo.testRefundSpeed();
        // dodo.testRefundSpeed();
        // dodo.testUnifiedOrderSpeed();
        // dodo.testRefundSpeed();
        // dodo.testHelloWorld();
        System.out.println("<---------------"); // wx2016112510573077
        Thread.sleep(5000);
    }
    //二维码生成方式2，生成的图片在未存储到本地的情况下，直接转换为base64压码
    public String getQRCodeImge2( String contents, int width, int height) {
        String zfb=null;
        if (contents != null && !"".equals(contents)) {
            ByteArrayOutputStream bao = new ByteArrayOutputStream();
            QRCodeWriter writer = new QRCodeWriter();
            BitMatrix m = null;
            try {
                m = writer.encode(contents, BarcodeFormat.QR_CODE, height, width);
            } catch (WriterException e) {
                e.printStackTrace();
            }
            try {
                MatrixToImageWriter.writeToStream(m, "png", bao);
            } catch (IOException e) {
                e.printStackTrace();
            }
            BASE64Encoder encoder = new BASE64Encoder();
            zfb = "data:image/png;base64,"+encoder.encode(bao.toByteArray());
            try {
                bao.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return zfb;
    }
}

