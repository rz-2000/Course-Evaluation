package com.course.evaluation.servlet;

import com.course.evaluation.po.Evaluation;
import com.course.evaluation.po.Page;
import com.course.evaluation.service.EvaluationService;
import com.course.evaluation.util.PageUtil;

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

    protected void findByPage(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String currentPageStr = request.getParameter("currentPage");
        int currentPage;
        // 如果没有currentPage,默认查询第一页
        if (currentPageStr == null) {
            currentPage = 1;
        } else {
            currentPage = Integer.parseInt(currentPageStr);
        }
        // 总条数
        long totalCount = evaluationService.count();
        // 创建一个Page对象 1.每页显示的条数 2.总条数 3.页数
        Page<Evaluation> page = PageUtil.createPage(5, (int) totalCount, currentPage);
        if (currentPage>page.getTotalPage() && currentPage!=1) {
            currentPage=page.getTotalPage();
        }
        page = PageUtil.createPage(5, (int) totalCount, currentPage);
        page = evaluationService.findByPage(page);
        // 把page保存到域中
        request.setAttribute("evaluationPage", page);
        // 转发到review-page.jsp
        request.getRequestDispatcher("review-page.jsp").forward(request, response);
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
        } else if ("chg".equals(method)) {
            chg(request, response);
        } else if ("showEvaluation".equals(method)) {
            showEvaluation(request, response);
        } else if (method.equals("findByPage")) {
            findByPage(request, response);
        }

    }
}

