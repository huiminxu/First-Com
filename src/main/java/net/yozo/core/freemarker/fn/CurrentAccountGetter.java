package net.yozo.core.freemarker.fn;

import freemarker.template.TemplateMethodModelEx;
import freemarker.template.TemplateModelException;
import net.yozo.web.util.LoginUserHolder;

import java.util.List;

/**
 * 获取当前登录的用户(前端用户)
 * @author joey
 */
public class CurrentAccountGetter implements TemplateMethodModelEx {
    @Override
    public Object exec(List arguments) throws TemplateModelException {
        return LoginUserHolder.getLoginAccount();
    }
}
