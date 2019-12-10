package com.course.evaluation.servlet;
import	java.util.ArrayList;

import com.course.evaluation.po.Course;
import com.course.evaluation.service.CourseService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 曾哲
 */
@WebServlet(name = "CourseServlet")
public class CourseServlet extends HttpServlet {

    private CourseService courseService = new CourseService();

    protected void showCourse(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Course course = new Course();
        String idStr = request.getParameter("id");
        Integer id = Integer.parseInt(idStr);
        course = courseService.findById(id);
        request.setAttribute("course", course);
        request.getRequestDispatcher("reviews-page.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("showCourse".equals(method)){
            showCourse(request, response);
        }
    }
}
