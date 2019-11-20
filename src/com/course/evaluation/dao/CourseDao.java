package com.course.evaluation.dao;

import com.course.evaluation.po.Course;
import com.course.evaluation.util.DBUtil;

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
    public List<Course> search(String keywords){
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
                course.setScore(rSet.getFloat(12));
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
