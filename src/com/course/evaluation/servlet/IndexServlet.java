package com.course.evaluation.servlet;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.User;
import com.course.evaluation.service.CourseService;

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
@WebServlet(name = "IndexServlet")
public class IndexServlet extends HttpServlet {

    private CourseService courseService = new CourseService();

    protected void allInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        System.out.println("username:"+username);
        List<Course> hotCourseList;
        List<Course> bestCourseList;
        hotCourseList = courseService.findAllOrderByTotal();
        bestCourseList = courseService.findAllOrderByScore();
        request.setAttribute("hotCourseList", hotCourseList);
        request.setAttribute("bestCourseList", bestCourseList);
        request.setAttribute("username",username);
        request.getRequestDispatcher("index.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        System.out.println("method:"+method);
        if ("allInfo".equals(method)){
            allInfo(request, response);
        }
    }
}
