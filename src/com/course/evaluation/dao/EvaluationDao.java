package com.course.evaluation.dao;

import java.lang.String;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import com.course.evaluation.po.Page;
import javafx.scene.Parent;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.util.DBUtil;

public class EvaluationDao {

    // 添加
    public int add(Evaluation evaluation) {
        Connection conn = DBUtil.getConn();
        String sql = "insert into evaluation(id,user_id,course_id,star,content,time,support) values(?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, evaluation.getId());
            pstmt.setInt(2, evaluation.getUserId());
            pstmt.setInt(3, evaluation.getCourseId());
            pstmt.setInt(4, evaluation.getStar());
            pstmt.setString(5, evaluation.getContent());
            pstmt.setString(6, evaluation.getTime());
            pstmt.setInt(7, evaluation.getSupport());
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return result;
    }

    // 查询一共有多少条
    public int count(Integer id) {
        // 获取连接
        Connection conn = DBUtil.getConn();
        // sql语句
        String sql = "SELECT COUNT(*) FROM evaluation where course_id=?";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        int count = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,id);
            rSet = pstmt.executeQuery();
            if (rSet.next()) {
                count = rSet.getInt(1);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closeRst(rSet);
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return count;
    }

    public Evaluation findById(Integer id){
        Connection conn = DBUtil.getConn();
        String sql = "select * from evaluation where id = ?;";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Evaluation evaluation = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rSet = pstmt.executeQuery();
            if (rSet.next()) {
                evaluation = new Evaluation();
                evaluation.setId(rSet.getInt(1));
                evaluation.setUserId(rSet.getInt(2));
                evaluation.setCourseId(rSet.getInt(3));
                evaluation.setContent(rSet.getString(4));
                evaluation.setStar(rSet.getInt(5));
                evaluation.setTime(rSet.getString(6));
                evaluation.setSupport(rSet.getInt(7));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return evaluation;
    }

    // 修改
    public int chg(int id, Evaluation evaluation) {
        // 获取连接
        Connection conn = DBUtil.getConn();
        // sql语句
        String sql = "update evaluation set content=? where id=?";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, evaluation.getContent());
            pstmt.setInt(2, id);
            result = pstmt.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return result;
    }

    public List<Evaluation> findAllEvaluationById(){
        Connection conn = DBUtil.getConn();
        String sql = "select * from evaluation order by id desc ;";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Evaluation evaluation = null;
        ArrayList<Evaluation> evaluationList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                evaluation = new Evaluation();
                evaluation.setId(rSet.getInt(1));
                evaluation.setCourseId(rSet.getInt(2));
                evaluation.setUserId(rSet.getInt(3));
                evaluation.setContent(rSet.getString(4));
                evaluation.setStar(rSet.getInt(5));
                evaluation.setTime(rSet.getString(6));
                evaluation.setSupport(rSet.getInt(7));
                evaluationList.add(evaluation);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return evaluationList;
    }

    public ArrayList<Evaluation> ordersRank() {
//		String preTime=null;
//		String currentTime=null;
//		Date date = new Date();
//		SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//		currentTime = sf.format(date);
//		Calendar calendar = Calendar.getInstance();
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
//		Calendar cal = Calendar.getInstance();
//		cal.setTime(date);
//		int w = cal.get(Calendar.DAY_OF_WEEK) - 1;
//        if (w < 0)
//            w = 7;
//		calendar.add(Calendar.DATE, -w);
//		preTime = sdf.format(calendar.getTime());
//		preTime = preTime + " 23:59:59";
        Connection conn = DBUtil.getConn();
        String sql = "SELECT "
                + "o.content,COUNT(o.support) "
                + "FROM course m,evaluation o "
                + "WHERE "
                + "m.id=o.course_id"
                + " GROUP BY o.content "
                + "ORDER BY COUNT(o.support) DESC";
//		String sql = "SELECT "
//				+ "m.name,COUNT(o.menusum) "
//				+ "FROM "
//				+ "menus m,orders o "
//				+ "WHERE "
//				+ "m.id=o.menuid && o.times>'"
//				+ preTime
//				+ "' && o.times<'"
//				+ currentTime
//				+ "' GROUP BY m.name "
//				+ "ORDER BY "
//				+ "COUNT(o.menusum) DESC";
        PreparedStatement pstmt = null;
        Evaluation evaluation=null;
        ResultSet rSet = null;
        ArrayList<Evaluation> list = new ArrayList<Evaluation>();
        try {
            pstmt = conn.prepareStatement(sql);
            evaluation = new Evaluation();
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                evaluation = new Evaluation();
                evaluation.setContent(rSet.getString(1));
                evaluation.setContent(rSet.getString(2));
                list.add(evaluation);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return list;
    }

    // 分页查询
    public Page<Evaluation> findByPage(Page<Evaluation> page) {
        // 获取连接
        Connection conn = DBUtil.getConn();
        // sql语句
        String sql = "SELECT " + "o.id," + "o.user_id," +  "o.content,"
                + "o.star," + "m.id,"  + "o.time," + "o.support " + "FROM "
                + "evaluation o,user u,course m " + "WHERE " + "o.user_id = u.id && o.course_id = m.id limit ?,?";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        ArrayList<Evaluation> list = new ArrayList<Evaluation>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, page.getBeginIndex());
            pstmt.setInt(2, page.getEveryPage());
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                Evaluation evaluation = new Evaluation();
                evaluation.setId(rSet.getInt(1));
                evaluation.setUserId(rSet.getInt(2));
                evaluation.setCourseId(rSet.getInt(3));
                evaluation.setContent(rSet.getString(4));
                evaluation.setStar(rSet.getInt(5));
                evaluation.setTime(rSet.getString(6));
                evaluation.setSupport(rSet.getInt(7));
                list.add(evaluation);
            }
            page.setList(list);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closeRst(rSet);
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return page;
    }
}
