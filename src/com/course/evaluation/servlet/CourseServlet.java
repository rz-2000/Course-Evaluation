package com.course.evaluation.servlet;
import java.nio.charset.StandardCharsets;
import	java.util.ArrayList;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.User;
import com.course.evaluation.service.CourseService;
import com.course.evaluation.vo.CourseVo;

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

    protected void list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String type = request.getParameter("type");
        System.out.println("type:"+type);
        if (type==null || type.equals("")){
            type="专业课";
        }else {
            int typeInt = Integer.parseInt(type);
            switch (typeInt){
                case 1:type="专业课";break;
                case 2:type="公共基础课";break;
                case 3:type="通识课";break;
                default:break;
            }
        }
        List<CourseVo> courseVoList = courseService.courseVoList(type);
        request.setAttribute("courseVoList", courseVoList);
        request.getRequestDispatcher("course-list.jsp").forward(request, response);
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
        } else if ("list".equals(method)){
            list(request, response);
        }
    }
}
