package com.course.evaluation.dao;

import com.course.evaluation.po.Course;
import com.course.evaluation.util.DBUtil;
import com.course.evaluation.vo.CourseVo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author 曾哲
 */
public class CourseDao {
    public List<Course> findByKeywords(String keywords){
        Connection conn = DBUtil.getConn();
        String sql = "select * from course where name like ?;";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Course course = null;
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, "%" + keywords + "%");
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                course = new Course();
                course.setId(rSet.getInt(1));
                course.setName(rSet.getString(2));
                course.setType(rSet.getString(3));
                course.setMajor(rSet.getString(4));
                course.setTeacher(rSet.getString(5));
                course.setFiveStar(rSet.getInt(6));
                course.setFourStar(rSet.getInt(7));
                course.setThreeStar(rSet.getInt(8));
                course.setTwoStar(rSet.getInt(9));
                course.setOneStar(rSet.getInt(10));
                course.setTotal(rSet.getInt(11));
                course.setScore(rSet.getDouble(12));
                course.setImage(rSet.getString(13));
                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return courseList;
    }

    public Course findById(Integer id){
        Connection conn = DBUtil.getConn();
        String sql = "select * from course where id = ?;";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Course course = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rSet = pstmt.executeQuery();
            if (rSet.next()) {
                course = new Course();
                course.setId(rSet.getInt(1));
                course.setName(rSet.getString(2));
                course.setType(rSet.getString(3));
                course.setMajor(rSet.getString(4));
                course.setTeacher(rSet.getString(5));
                course.setFiveStar(rSet.getInt(6));
                course.setFourStar(rSet.getInt(7));
                course.setThreeStar(rSet.getInt(8));
                course.setTwoStar(rSet.getInt(9));
                course.setOneStar(rSet.getInt(10));
                course.setTotal(rSet.getInt(11));
                course.setScore(rSet.getDouble(12));
                course.setImage(rSet.getString(13));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return course;
    }

    public List<Course> findAllOrderByTotal(){
        Connection conn = DBUtil.getConn();
        String sql = "select * from course order by total desc ;";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Course course = null;
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                course = new Course();
                course.setId(rSet.getInt(1));
                course.setName(rSet.getString(2));
                course.setType(rSet.getString(3));
                course.setMajor(rSet.getString(4));
                course.setTeacher(rSet.getString(5));
                course.setFiveStar(rSet.getInt(6));
                course.setFourStar(rSet.getInt(7));
                course.setThreeStar(rSet.getInt(8));
                course.setTwoStar(rSet.getInt(9));
                course.setOneStar(rSet.getInt(10));
                course.setTotal(rSet.getInt(11));
//                System.out.println("score:"+rSet.getDouble(12));
                course.setScore(rSet.getDouble(12));
                course.setImage(rSet.getString(13));
                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return courseList;
    }

    public List<Course> findAllOrderByScore(){
        Connection conn = DBUtil.getConn();
        String sql = "select * from course order by score desc ;";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Course course = null;
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                course = new Course();
                course.setId(rSet.getInt(1));
                course.setName(rSet.getString(2));
                course.setType(rSet.getString(3));
                course.setMajor(rSet.getString(4));
                course.setTeacher(rSet.getString(5));
                course.setFiveStar(rSet.getInt(6));
                course.setFourStar(rSet.getInt(7));
                course.setThreeStar(rSet.getInt(8));
                course.setTwoStar(rSet.getInt(9));
                course.setOneStar(rSet.getInt(10));
                course.setTotal(rSet.getInt(11));
                course.setScore(rSet.getDouble(12));
                course.setImage(rSet.getString(13));
                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return courseList;
    }

    /**
     * 修改评分
     */
    public int update(Course course) {
        //获取连接
        Connection conn = DBUtil.getConn();
        //sql语句
        String sql = "update course set five_star=?,four_star=?,three_star=?,two_star=?,one_star=?,total=?,score=? where id=?";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1,course.getFiveStar());
            pstmt.setInt(2,course.getFourStar());
            pstmt.setInt(3,course.getThreeStar());
            pstmt.setInt(4,course.getTwoStar());
            pstmt.setInt(5,course.getOneStar());
            pstmt.setInt(6,course.getTotal());
            pstmt.setDouble(7,course.getScore());
            pstmt.setInt(8,course.getId());
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

    public List<Course> findAllByType(String type){
        Connection conn = DBUtil.getConn();
        String sql = "select id,name,teacher,type,score from course where type=?";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        Course course = null;
        ArrayList<Course> courseList = new ArrayList<>();
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1,type);
            rSet = pstmt.executeQuery();
            while (rSet.next()) {
                course = new Course();
                course.setId(rSet.getInt(1));
                course.setName(rSet.getString(2));
                course.setTeacher(rSet.getString(3));
                course.setType(rSet.getString(4));
                course.setScore(rSet.getDouble(5));
                courseList.add(course);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return courseList;
    }
}
