package com.course.evaluation.servlet;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.po.Page;
import com.course.evaluation.po.User;
import com.course.evaluation.service.CourseService;
import com.course.evaluation.service.EvaluationService;
import com.course.evaluation.service.UserService;
import com.course.evaluation.util.PageUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "EvaluationServlet")
public class EvaluationServlet extends HttpServlet {
    private EvaluationService evaluationService = new EvaluationService();
    private CourseService courseService = new CourseService();
    private UserService userService = new UserService();
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Integer userId = Integer.valueOf(request.getParameter("userId"));
        Integer courseId = Integer.valueOf(request.getParameter("courseId"));
        int star = Integer.parseInt(request.getParameter("star"));
        switch (star) {
            case 1:
                star = 1;
                break;
            case 2:
                star = 2;
                break;
            case 3:
                star = 3;
                break;
            case 4:
                star = 4;
                break;
            case 5:
                star = 5;
                break;
            default:
                break;
        }
        String content = request.getParameter("content");
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(new Date());
        Integer learned = Integer.valueOf(request.getParameter("learned"));

        Evaluation eva = new Evaluation();
        eva.setUserId(userId);
        eva.setCourseId(courseId);
        eva.setStar(star);
        eva.setContent(content);
        eva.setTime(time);
        eva.setSupport(0);
        eva.setLearned(learned);

        int result = evaluationService.add(eva) & courseService.updateCourse(courseId, star);
        PrintWriter out = response.getWriter();
        if (result == 1) {
            HttpSession session = request.getSession();
            session.removeAttribute("evaluation");
            out.print("<script>" + "alert('提交成功');" + "window.parent.location.href='" + request.getContextPath()
                    + "/EvaluationServlet?method=showEvaluation&courseId=" + courseId + "';" + "</script>");
        } else {
            out.print("<script>" + "alert('提交失败，请重试');" + "window.location.href='" + request.getContextPath()
                    + "/EvaluationServlet?method=showEvaluation&courseId=" + courseId + "';" + "</script>");
        }

    }


    protected void addSupport(HttpServletRequest request, HttpServletResponse response) throws IOException {
        int id = Integer.valueOf(request.getParameter("id"));
        Evaluation evaluation = evaluationService.findById(id);
        evaluation.setSupport(evaluation.getSupport() + 1);
        int result = evaluationService.addSupport(evaluation) ;
        PrintWriter out = response.getWriter();
        if (result == 1) {
            out.print("<script>" + "alert('提交成功');" + "window.parent.location.href='" + request.getContextPath()
                    + "/EvaluationServlet?method=allInfo&id=" + evaluation.getId()+ "';" + "</script>");
        } else {
            out.print("<script>" + "alert('提交失败，请重试');" + "window.location.href='" + request.getContextPath()
                    + "/EvaluationServlet?method=allInfo&id=" + evaluation.getId() + "';" + "</script>");
        }
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // TODO Auto-generated method stub
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        String method = request.getParameter("method");
        if ("add".equals(method)) {
            add(request, response);
          //  } else if ("allInfo".equals(method)) {
            //  allInfo(request, response);
        } else if ("addSupport".equals(method)) {
            addSupport(request, response);

        }

    }
}

