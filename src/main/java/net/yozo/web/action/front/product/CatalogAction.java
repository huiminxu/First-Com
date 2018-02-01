package net.yozo.web.action.front.product;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

/**
 * Created by dylan on 15-3-20.
 */
@Controller("frontCatalogAction")
@RequestMapping("/catalog")
@Deprecated
public class CatalogAction {
    @RequestMapping("templateList")
    public String catalog(HttpServletRequest request){
        return "forward:/template/templateList";
    }

    @RequestMapping("attr/{attrID}")
    public String attr(@PathVariable("attrID")String attrID){
        return "forward:/product/productList?attrID="+attrID;
    }
}
