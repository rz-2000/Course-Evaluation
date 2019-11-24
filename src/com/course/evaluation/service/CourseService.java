package com.course.evaluation.service;
import	java.util.List;

import com.course.evaluation.dao.CourseDao;
import com.course.evaluation.po.Course;

import java.util.List;

/**
 * @author 曾哲
 */
public class CourseService {

    private CourseDao courseDao = new CourseDao();

    public Course findById(Integer id){
        return courseDao.findById(id);
    }

    public Course findByNameAndTeacher(String name, String teacher){
        return courseDao.findByNameAndTeacher(name, teacher);
    }

    public List<Course> search(String keywords){
        return courseDao.findByKeywords(keywords);
    }

    public List<Course> findAllOrderByTotal(){
        return courseDao.findAllOrderByTotal();
    }

    public List<Course> findAllOrderByScore(){
        return courseDao.findAllOrderByScore();
    }
}
