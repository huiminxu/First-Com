package net.yozo.filter;

import net.yozo.core.FrontContainer;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Created by t on 2017/11/16.
 */
public class XMLHttpRequestFilter implements Filter{
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, javax.servlet.FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request =(HttpServletRequest)servletRequest;
        HttpServletResponse response =(HttpServletResponse)servletResponse;
        if (request.getSession().getAttribute(FrontContainer.USER_INFO) == null) {
            if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                HttpServletResponse httpServletResponse = (HttpServletResponse) response;
                httpServletResponse.setStatus(401);
                response.setCharacterEncoding("UTF-8");
                PrintWriter out = response.getWriter();
                out.print("{\"errorCode\":401}");
                out.flush();
                out.close();
            }
        }
        filterChain.doFilter(servletRequest, servletResponse);
}
    public void init(FilterConfig filterConfig) throws ServletException {
        System.out.println("======================XMLHttpRequestFilter================start=============");
    }
    public void destroy() {
        System.out.println("======================XMLHttpRequestFilter================end=============");
    }
}
