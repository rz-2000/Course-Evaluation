package com.course.evaluation.dao;

import java.lang.String;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.course.evaluation.po.Course;
import com.course.evaluation.po.Page;
import com.course.evaluation.po.Evaluation;
import com.course.evaluation.util.DBUtil;
import com.course.evaluation.vo.EvaluationVo;

public class EvaluationDao {

    // 添加
    public int add(Evaluation evaluation) {
        Connection conn = DBUtil.getConn();
        String sql = "insert into evaluation(user_id,course_id,star,content,time,support, learned) values(?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, evaluation.getUserId());
            pstmt.setInt(2, evaluation.getCourseId());
            pstmt.setInt(3, evaluation.getStar());
            pstmt.setString(4, evaluation.getContent());
            pstmt.setString(5, evaluation.getTime());
            pstmt.setInt(6, evaluation.getSupport());
            pstmt.setInt(7, evaluation.getLearned());
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
                evaluation.setStar(rSet.getInt(4));
                evaluation.setContent(rSet.getString(5));
                evaluation.setTime(rSet.getString(6));
                evaluation.setSupport(rSet.getInt(7));
                evaluation.setLearned(rSet.getInt(8));
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

    public List<EvaluationVo> findAllEvaluationByCourseId(Integer courseId){
        Connection conn = DBUtil.getConn();
        String sql = "select e.id,e.course_id,u.username,u.profile_photo,e.star,e.content,e.time,e.support,e.learned from evaluation e, user u where course_id =? and e.user_id=u.id order by e.support desc ;";
        PreparedStatement pstmt = null;
        ResultSet rSet;
        //String result = null;
        EvaluationVo evaluationVo;
        ArrayList<EvaluationVo> evaluationVoList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, courseId);
            rSet = pstmt.executeQuery();
           
            while (rSet.next()) {
                evaluationVo = new EvaluationVo();
                evaluationVo.setId(rSet.getInt(1));
                evaluationVo.setCourseId(rSet.getInt(2));
                evaluationVo.setUsername(rSet.getString(3));
                evaluationVo.setProfile(rSet.getString(4));
                evaluationVo.setStar(rSet.getInt(5));
                evaluationVo.setContent(rSet.getString(6));
                evaluationVo.setTime(rSet.getString(7));
                evaluationVo.setSupport(rSet.getInt(8));
                evaluationVo.setLearned(rSet.getInt(9));
                evaluationVoList.add(evaluationVo);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return evaluationVoList;
    }

    // 分页查询
    public Page<Evaluation> findByPage(Page<Evaluation> page) {
        // 获取连接
        Connection conn = DBUtil.getConn();
        // sql语句
        String sql = "SELECT " + "e.id," + "u.id," + "c.id," + " e.content,"
                + "e.star,"  + "e.time," + "e.support," + "e.learned " + "FROM "
                + "evaluation e,user u,course c " + "WHERE " + "e.user_id = u.id && e.course_id = c.id limit ?,?";
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
                evaluation.setLearned(rSet.getInt(8));
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

    /**
     * 点赞评论
     */
    public int update(Evaluation evaluation) {
        //获取连接
        Connection conn = DBUtil.getConn();
        //sql语句
        String sql = "update evaluation set support=? where id=?";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,evaluation.getSupport());
            pstmt.setInt(2,evaluation.getId());
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

    /**
     * 最新评论
     */
    public String findContentByCourseId(Integer courseId) {
        //获取连接
        Connection conn = DBUtil.getConn();
        //sql语句
        String sql = "select content from evaluation where course_id=? order by time desc";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        String result = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,courseId);
            rSet = pstmt.executeQuery();
            if (!rSet.next()){
                result = "无";
            }else {
                result = rSet.getString(0);
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return result;
    }
}
