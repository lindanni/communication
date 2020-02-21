package com.demo.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.registry.infomodel.User;


public class AuthFilter implements Filter{

    @Override
    public void destroy() {
        
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
        FilterChain chain) throws IOException, ServletException {
        HttpServletResponse resp = (HttpServletResponse)response;
        HttpServletRequest req = (HttpServletRequest)request;
        HttpSession session = req.getSession();
        User user = (User)session.getAttribute("user");
        String uri = req.getRequestURI();
        //简单判断缓存中是否有用户
        if(user==null){//没有用户
            //判断用户是否是选择跳到登录界面
            if(uri.endsWith("Tbao_Login.jsp")){
                chain.doFilter(request, response);
            }else{
                resp.sendRedirect(req.getContextPath()+"/Tbao_Login.jsp");
            }    
        }else{//有用户
            chain.doFilter(request, response);
        }
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        
    }

}
