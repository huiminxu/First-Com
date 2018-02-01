package net.yozo.web.action.front;

import net.yozo.core.dao.page.PagerModel;
import net.yozo.core.front.SystemManager;
import net.yozo.services.common.Prize;
import net.yozo.services.front.account.AccountService;
import net.yozo.services.front.designer.DesignerService;
import net.yozo.services.front.designer.bean.Designer;
import net.yozo.services.front.prize.PrizeService;
import net.yozo.web.util.RequestHolder;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 前端首页
 */
@Controller
@RequestMapping("/")
public class IndexAction {
    @Autowired
    protected SystemManager systemManager;
    @Autowired
    protected PrizeService prizeService;
    @Autowired
    protected AccountService accountService;
    @Autowired
    protected DesignerService designerService;
    @RequestMapping({"/","/index"})
    public String index(HttpServletRequest request) {
        Designer d=new Designer();
        d.setTop(4);
        List<Designer> l=designerService.selectIndexDesigner(d);
        designerService.setQQstatus(l);
        request.setAttribute("designers",l);
        request.setAttribute("catalogs", systemManager.getCatalogs());
        request.getSession().setAttribute("defaultCatalog",systemManager.getCatalogs().get(0));
        return "index";
    }

    @RequestMapping({"/","/index1"})
    public String index1() {
        return "index1";
    }

    @RequestMapping("/member")
    public String search(ModelMap model) {
        Prize prize=new Prize();
        List<Prize> prizeList=prizeService.selectList(prize);
        for (Prize p:prizeList) {
            p.setAccount(accountService.selectById(p.getAccount()).getAccount());
        }
        model.addAttribute("prizeList",prizeList);
        model.addAttribute("isMember","y");
        return "/member";
    }


    @RequestMapping("/help/center")
    public String help(){
        return "/helpCenter/helpcenter";
    }
}
