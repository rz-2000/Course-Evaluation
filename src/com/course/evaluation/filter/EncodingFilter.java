package com.course.evaluation.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet Filter implementation class EncodingFilter
 */
public class EncodingFilter implements Filter {

    /**
     * Default constructor.
     */
    public EncodingFilter() {
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
        HttpServletRequest req = (HttpServletRequest)request;
        HttpServletResponse res = (HttpServletResponse) response;

        String url = req.getRequestURI();
        System.out.println("url:" +url);

        if(url.indexOf(".css")>0||url.indexOf(".js")>0||url.indexOf(".png")>0||url.indexOf(".jpg")>0||url.indexOf(".svg")>0
        ||url.indexOf(".woff")>0||url.indexOf(".ttf")>0||url.indexOf(".ico")>0) {
            chain.doFilter(request, response);
            return;
        }
        response.setContentType("text/html;text/html; charset=UTF-8");
        request.setCharacterEncoding("utf-8");
        if (req.getMethod().equals("GET")) {
            EncodeRequest encodeRequest = new EncodeRequest(req);
            chain.doFilter(encodeRequest, response);
        } else {
            chain.doFilter(request, response);
        }
    }

    /**
     * @see Filter#init(FilterConfig)
     */
    @Override
    public void init(FilterConfig fConfig) throws ServletException {
        // TODO Auto-generated method stub
    }

}
