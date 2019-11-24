package com.course.evaluation.servlet;

import com.course.evaluation.po.Evaluation;
import com.course.evaluation.service.EvaluationService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;

/**
 * @author 曾哲
 */
@WebServlet(name = "EvaluationServlet")
public class EvaluationServlet extends HttpServlet {
    private EvaluationService evaluationService = new EvaluationService();
    private static final long serialVersionUID = 1L;

    /**
     * @see HttpServlet#HttpServlet()
     */
    public EvaluationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void add(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String evaluation = request.getParameter("evaluation");
        Integer star = Integer.valueOf(request.getParameter("star"));

        Evaluation eva = new Evaluation();
        eva.setContent(evaluation);
        eva.setStar(star);
        int result = evaluationService.add(eva);
        PrintWriter out = response.getWriter();

    }

    protected void chg(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        int id = Integer.parseInt(idStr);
        String evaluation = request.getParameter("evaluation");
      //  Integer star = Integer.valueOf(request.getParameter("star"));

        Evaluation eva = new Evaluation();
        eva.setId(id);
        eva.setContent(evaluation);
       // eva.setStar(star);
        int result = evaluationService.chg(id,eva);
        PrintWriter out = response.getWriter();
        if (result == 1) {
            HttpSession session = request.getSession();
            session.removeAttribute("evaluation");
            out.print("<script>" + "alert('修改成功');" + "window.parent.location.href='" + request.getContextPath()
                    + "/info.jsp';" + "</script>");
        } else {
            out.print("<script>" + "alert('修改失败，请重试');" + "window.location.href='" + request.getContextPath()
                    + "/info.jsp';" + "</script>");
        }
    }

    protected void showEvaluation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Evaluation evaluation = new Evaluation();
        String idStr = request.getParameter("id");
        Integer id = Integer.parseInt(idStr);
        evaluation = evaluationService.findById(id);
        request.setAttribute("evaluation", evaluation);
        request.getRequestDispatcher("evaluation.jsp").forward(request,response);
    }

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
        } else if ("chg".equals(method)) {
            chg(request, response);
        } else if ("showEvaluation".equals(method)) {
            showEvaluation(request, response);
        }

    }
}

