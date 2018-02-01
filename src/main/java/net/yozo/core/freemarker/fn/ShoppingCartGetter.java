package net.yozo.core.freemarker.fn;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import net.yozo.core.FrontContainer;
import net.yozo.web.util.RequestHolder;

import java.util.List;

/**
 * 获取购物车
 * @author joey
 */
public class ShoppingCartGetter implements TemplateMethodModelEx {
    @Override
    public Object exec(List arguments) throws TemplateModelException {
        return RequestHolder.getSession().getAttribute(FrontContainer.myCart);
    }
}
