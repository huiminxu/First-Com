package net.yozo.web.action.front.vks;

import net.yozo.services.front.vksService.VksService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by Vicks on 2017/8/16.
 */
@Controller
@RequestMapping("vks")
public class VksAction {
    @Autowired
    private VksService vs;


    @RequestMapping(value="test",method = RequestMethod.POST)
    @ResponseBody
    public  String judgeAccount(String phone){
        System.out.println("-------------vvvvv----------");
        System.out.println(phone);
        return vs.insertSmsTest(phone)+"";
    }
}
