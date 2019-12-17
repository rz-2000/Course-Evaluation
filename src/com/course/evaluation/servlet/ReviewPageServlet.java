package com.course.evaluation.servlet;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.po.Page;
import com.course.evaluation.service.CourseService;
import com.course.evaluation.service.EvaluationService;
import com.course.evaluation.util.PageUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * @author 曾哲
 */
@WebServlet(name = "ReviewPageServlet")
public class ReviewPageServlet extends HttpServlet {
    private CourseService courseService = new CourseService();
    private EvaluationService evaluationService = new EvaluationService();

    protected void allInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String currentPageStr = request.getParameter("currentPage");
        String courseIdStr = request.getParameter("id");
        int courseId = Integer.parseInt(courseIdStr);
        Course course = courseService.findById(courseId);
        int currentPage;
        // 如果没有currentPage,默认查询第一页
        if (currentPageStr == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(currentPageStr);
        }
        // 总条数
        int totalCount = evaluationService.count(courseId);
        // 创建一个Page对象 1.每页显示的条数 2.总条数 3.页数
        Page<Evaluation> page = PageUtil.createPage(5, (int) totalCount, currentPage);
        if (currentPage>page.getTotalPage() && currentPage!=1) {
            currentPage=page.getTotalPage();
        }
        page = PageUtil.createPage(5, (int) totalCount, currentPage);
        page = evaluationService.findByPage(page);
        request.setAttribute("course", course);
        // 把page保存到域中
        request.setAttribute("evaluationPage", page);
        // 转发到review-page.jsp
        request.getRequestDispatcher("reviews-page.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String method = request.getParameter("method");
        if ("allInfo".equals(method)){
            allInfo(request, response);
        }
    }
}
