package com.course.evaluation.servlet;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.po.Page;
import com.course.evaluation.po.User;
import com.course.evaluation.service.CourseService;
import com.course.evaluation.service.EvaluationService;
import com.course.evaluation.service.UserService;
import com.course.evaluation.util.PageUtil;
import com.course.evaluation.vo.EvaluationVo;

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
@WebServlet(name = "ReviewPageServlet")
public class ReviewPageServlet extends HttpServlet {
    private CourseService courseService = new CourseService();
    private EvaluationService evaluationService = new EvaluationService();
    private UserService userService = new UserService();

    protected void allInfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //String currentPageStr = request.getParameter("currentPage");
        String courseIdStr = request.getParameter("id");
        int courseId = Integer.parseInt(courseIdStr);
        Course course = courseService.findById(courseId);
        List<EvaluationVo> evaluationList;
        evaluationList = evaluationService.findAllEvaluationByCourseId(courseId);
        request.setAttribute("course", course);
        request.setAttribute("evaluationList", evaluationList);
        for (EvaluationVo evaluation:evaluationList){
            System.out.println("evaluation id:"+evaluation.getId());
            System.out.println("evaluation content:"+evaluation.getContent());
        }
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
