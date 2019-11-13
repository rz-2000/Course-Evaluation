package com.course.evaluation.dao;

import com.course.evaluation.po.User;
import com.course.evaluation.util.DBUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * @author 曾哲
 */
public class UserDao {

    /**
     * 添加
     */
    public int add(User user) {
        //获取连接
        Connection conn = DBUtil.getConn();
        //sql语句
        String sql = "insert into user(username,password,real_name,number,major,grade,sex,phone_number,email,profile_photo) values(?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(1, user.getPassword());
            pstmt.setString(1, user.getRealName());
            pstmt.setInt(1, user.getNumber());
            pstmt.setString(1, user.getMajor());
            pstmt.setInt(1, user.getGrade());
            pstmt.setInt(1, user.getSex());
            pstmt.setInt(1, user.getPhoneNumber());
            pstmt.setString(1, user.getEmail());
            pstmt.setString(1, user.getProfilePhoto());
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
     * 根据用户名和密码查询
     * @param username 用户名
     * @param password 密码
     * @return User
     */
    public User findByUsernameAndPassword(String username, String password) {
        Connection conn = DBUtil.getConn();
        String sql = "select * from user where username=? && password=?";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        User user = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            pstmt.setString(2, password);
            rSet = pstmt.executeQuery();
            if (rSet.next()) {
                user = new User();
                user.setId(rSet.getInt(1));
                user.setUsername(rSet.getString(2));
                user.setPassword(rSet.getString(3));
                user.setRealName(rSet.getString(4));
                user.setNumber(rSet.getInt(5));
                user.setMajor(rSet.getString(6));
                user.setGrade(rSet.getInt(7));
                user.setSex(rSet.getInt(8));
                user.setPhoneNumber(rSet.getInt(9));
                user.setEmail(rSet.getString(10));
                user.setProfilePhoto(rSet.getString(11));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closeRst(rSet);
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return user;
    }

    /**
     * 根据用户名查询
     * @param username 用户名
     * @return User
     */
    public User findByUsername(String username) {
        Connection conn = DBUtil.getConn();
        String sql = "select * from user where username=?";
        PreparedStatement pstmt = null;
        ResultSet rSet = null;
        User user = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, username);
            rSet = pstmt.executeQuery();
            if (rSet.next()) {
                user = new User();
                user.setId(rSet.getInt(1));
                user.setUsername(rSet.getString(2));
                user.setPassword(rSet.getString(3));
            }
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
            DBUtil.closeRst(rSet);
            DBUtil.closePstmt(pstmt);
            DBUtil.closeConn(conn);
        }
        return user;
    }

    /**
     * 修改
     * @param id 用户id
     * @param user user
     * @return int
     */
    public int update(int id, User user) {
        Connection conn = DBUtil.getConn();
        String sql = "update user set username=?,password=?,real_name=?,number=?,major=?,grade=?,sex=?,phone_number=?,email=?,profile_photo=? where id=?";
        PreparedStatement pstmt = null;
        int result = 0;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, user.getUsername());
            pstmt.setString(2, user.getPassword());
            pstmt.setString(3, user.getRealName());
            pstmt.setInt(4, user.getNumber());
            pstmt.setString(5, user.getMajor());
            pstmt.setInt(6, user.getGrade());
            pstmt.setInt(7, user.getSex());
            pstmt.setInt(8, user.getPhoneNumber());
            pstmt.setString(9, user.getEmail());
            pstmt.setString(10, user.getProfilePhoto());
            pstmt.setInt(11, id);
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
}
