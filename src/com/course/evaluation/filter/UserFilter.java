package com.course.evaluation.filter;

import com.course.evaluation.po.User;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * Servlet Filter implementation class UserFilter
 * @author 曾哲
 */
public class UserFilter implements Filter {
    private FilterConfig config = null;

    /**
     * Default constructor.
     */
    public UserFilter() {
        // TODO Auto-generated constructor stub
    }

    /**
     * @see Filter#destroy()
     */
    @Override
    public void destroy() {
        // TODO Auto-generated method stub
    }

    /**
     * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        // TODO Auto-generated method stub
        // place your code here

        // pass the request along the filter chain
        /*
         * 如果没有登录——index.jsp 已经登录——放行
         */
        //读取初始化配置
        String indexPath = this.config.getInitParameter("indexPath");
        // 获取session
        HttpServletRequest req = (HttpServletRequest) request;
        HttpSession session = req.getSession();
        // 获取登录对象
        User user = (User) session.getAttribute("user");
        // 获取用户请求地址
        String path = req.getServletPath();
        // 判断用户是否登录
        if (user != null || path.equals(indexPath) || path.endsWith(".css") || path.endsWith(".js")
                || path.endsWith(".gif") || path.endsWith(".jpg") || path.equals("/register.jsp") || path.indexOf("Servlet")>0){
            chain.doFilter(request, response);
        } else {
            req.getRequestDispatcher("/login.jsp").forward(request, response);
        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
        this.config = fConfig;
    }

}
