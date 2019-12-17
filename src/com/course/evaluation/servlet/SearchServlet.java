package com.course.evaluation.servlet;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.User;
import com.course.evaluation.service.CourseService;
import com.course.evaluation.service.UserService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author 曾哲
 */
@WebServlet(name = "SearchServlet")
public class SearchServlet extends HttpServlet {
    private CourseService courseService = new CourseService();
    private UserService userService = new UserService();

    protected void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String keywords = request.getParameter("keywords");
        String idStr = request.getParameter("id");
        Integer userId = Integer.parseInt(idStr);
        System.out.println("keywords:"+keywords);
        List<Course> courseList = courseService.search(keywords);
        User user = userService.findById(userId);
        request.setAttribute("courseList", courseList);
        request.setAttribute("user", user);
        request.getRequestDispatcher("search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        System.out.println("method:"+method);
        if ("search".equals(method)){
            search(request, response);
        }
    }
}
