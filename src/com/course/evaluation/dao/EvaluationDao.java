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
import javafx.scene.Parent;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.util.DBUtil;

public class EvaluationDao {

    // 添加
    public int add(Evaluation evaluation) {
        Connection conn = DBUtil.getConn();
        String sql = "insert into evaluation(id,userId,courseId,star,content,time,support) values(?,?,?,?,?,?,?)";
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
    public long count() {
        // 获取连接
        Connection conn = DBUtil.getConn();
        // sql语句
        String sql = "SELECT COUNT(*) FROM evaluation where evaluation.courseId=courseId && evaluation.star=star";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        long count = 0;
        try {
            pstmt = conn.prepareStatement(sql);
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

    public List<Evaluation> findAllOrderById(){
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
}
