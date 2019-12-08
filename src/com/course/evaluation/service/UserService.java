package com.course.evaluation.service;

import com.course.evaluation.dao.UserDao;
import com.course.evaluation.po.User;

/**
 * @author 曾哲
 */
public class UserService {
    private UserDao userDao = new UserDao();

    /**
     * 登录
     * @param username 用户名
     * @param password 密码
     * @return User
     */
    public User login(String username, String password) {
        return userDao.findByUsernameAndPassword(username, password);
    }

    /**
     * 修改
     * @param id 用户id
     * @param user user
     * @return int
     */
    public int update(int id, User user) {
        User a = userDao.findByUsername(user.getUsername());
        if (a != null && a.getId() != id) {
            return -1;
        }
        return userDao.update(id, user);
    }

    /**
     * 注册
     * @param user user
     * @return int
     */
    public int reg(User user) {
        return userDao.add(user);
    }

    public User findByUsername(String username){
        return userDao.findByUsername(username);
    }
}
