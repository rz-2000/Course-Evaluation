package com.course.evaluation.util;

import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

/**
 * @author 曾哲
 */
public class DBUtil {
    private static String drivatename = null;
    private static String url = null;
    private static String username = null;
    private static String password = null;

    static {
        try {
            //读取配置文件，加载JDBC四大参数
            drivatename = "com.mysql.jdbc.Driver";
            url = "jdbc:mysql://localhost:3306/evaluation_course";
            username = "root";
            password = "root";
//			Properties config = new Properties();
//			config.load(new FileReader(new File("JDBC.conf")));
//			drivatename = config.getProperty("drivername");
//			url = config.getProperty("url");
//			username = config.getProperty("username");
//			password = config.getProperty("password");

            //加载驱动类
            Class.forName(drivatename);
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //建立连接
    public static Connection getConn() {
        Connection conn = null;

        try {
            conn = DriverManager.getConnection(url, username, password);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return conn;
    }

    //关闭连接
    public static void closeConn(Connection conn) {
        try {
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //关闭preparedStatement
    public static void closePstmt(PreparedStatement pstmt) {
        try {
            pstmt.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    //关闭结果集ResultSet
    public static void closeRst(ResultSet rst) {
        try {
            rst.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
}
