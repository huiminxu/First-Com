package net.yozo.core.interceptor;

import net.yozo.web.action.UploadController;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class WebInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object handler) throws Exception {
		// TODO Auto-generated method stub
		if (handler != null && handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			if (handlerMethod.getBean() != null
					&& handlerMethod.getBean() instanceof UploadController) {

			}
			((UploadController) handlerMethod.getBean()).setServlet(request,
					response);
		}
		return true;
	}
}
