package com.course.evaluation.servlet;

import com.course.evaluation.po.User;
import com.course.evaluation.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author 曾哲
 */
public class UserServlet extends HttpServlet {

    private UserService usersService = new UserService();
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void login(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 获取请求参数
        String name = request.getParameter("username");
        String pwd = request.getParameter("password");
        // 登录
        User user = usersService.login(name, pwd);
        // 成功——/index.jsp
        if (user != null) {
            // 将用户信息存放在session中
            HttpSession session = request.getSession();
            session.setAttribute("user", user);
            // 转发
            request.getRequestDispatcher("/IndexServlet?method=allInfo").forward(request, response);
            /*PrintWriter out = response.getWriter();
            out.print("<script>"+"window.location.href = '"+request.getContextPath()+"/IndexServlet?method=allInfo';"+"</script>");*/
        }
        // 失败——/login.jsp
        else {
            PrintWriter out = response.getWriter();
            out.print("<script>" + "alert('用户名或密码错误');" + "window.location.href='" + request.getContextPath()
                    + "/login.jsp';" + "</script>");
        }
    }

    protected void logout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 从session删除用户信息
        HttpSession session = request.getSession();
        session.removeAttribute("user");
        // 跳转到登录页面
        PrintWriter out = response.getWriter();
        out.print(
                "<script>" + "window.parent.location.href='" + request.getContextPath() + "/login.jsp';" + "</script>");
    }

    protected void update(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String realName = request.getParameter("realName");
        String number = request.getParameter("number");
        String major = request.getParameter("major");
        int grade = Integer.parseInt(request.getParameter("grade"));
        switch (grade){
            case 1:grade=2015;break;
            case 2:grade=2016;break;
            case 3:grade=2017;break;
            case 4:grade=2018;break;
            case 5:grade=2019;break;
            default:break;
        }
        Integer sex = Integer.valueOf(request.getParameter("sex"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
//        String profilePhoto = request.getParameter("profilePhoto");

        User user = new User();
        user.setId(id);
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setNumber(number);
        user.setMajor(major);
        user.setGrade(grade);
        user.setSex(sex);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
//        user.setProfilePhoto(profilePhoto);
        int result = usersService.update(id, user);
        PrintWriter out = response.getWriter();
        if (result == 1) {
            HttpSession session = request.getSession();
            session.removeAttribute("user");
            out.print("<script>" + "alert('修改成功,请重新登录');" + "window.parent.location.href='" + request.getContextPath()
                    + "/login.jsp';" + "</script>");
        } else {
            out.print("<script>" + "alert('修改失败');" + "window.location.href='" + request.getContextPath()
                    + "/info.jsp';" + "</script>");
        }
    }

    protected void reg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String realName = request.getParameter("realName");
        String number = request.getParameter("number");
        /*String major = request.getParameter("major");
        Integer grade = Integer.valueOf(request.getParameter("grade"));
        Integer sex = Integer.valueOf(request.getParameter("sex"));
        String phoneNumber = request.getParameter("phoneNumber");
        String email = request.getParameter("email");
        String profilePhoto = request.getParameter("profilePhoto");*/

        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRealName(realName);
        user.setNumber(number);
        /*user.setMajor(major);
        user.setGrade(grade);
        user.setSex(sex);
        user.setPhoneNumber(phoneNumber);
        user.setEmail(email);
        user.setProfilePhoto(profilePhoto);*/
        int result = usersService.reg(user);
        PrintWriter out = response.getWriter();
        if (result == 1) {
            out.print("<script>" + "alert('注册成功');" + "window.location.href='" + request.getContextPath()
                    + "/login.jsp';" + "</script>");
        } else {
            out.print("<script>" + "alert('注册失败');" + "window.location.href='" + request.getContextPath()
                    + "/register.jsp';" + "</script>");
        }
    }
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        System.out.println("method:"+method);
        if ("login".equals(method)) {
            login(request, response);
        } else if ("logout".equals(method)) {
            logout(request, response);
        } else if ("update".equals(method)) {
            update(request, response);
        } else if ("reg".equals(method)) {
            reg(request, response);
        }
    }
}
