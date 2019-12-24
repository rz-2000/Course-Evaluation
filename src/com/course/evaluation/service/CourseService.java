package com.course.evaluation.service;
import java.util.ArrayList;
import	java.util.List;

import com.course.evaluation.dao.CourseDao;
import com.course.evaluation.dao.EvaluationDao;
import com.course.evaluation.po.Course;
import com.course.evaluation.vo.CourseVo;

/**
 * @author 曾哲
 */
public class CourseService {

    private CourseDao courseDao = new CourseDao();

    private EvaluationDao evaluationDao = new EvaluationDao();

    public Course findById(Integer id){
        return courseDao.findById(id);
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

    public int updateCourse(Integer id, Integer star){
        Course course = findById(id);
        switch (star){
            case 1:course.setOneStar(course.getOneStar()+1);break;
            case 2:course.setTwoStar(course.getTwoStar()+1);break;
            case 3:course.setThreeStar(course.getThreeStar()+1);break;
            case 4:course.setFourStar(course.getFourStar()+1);break;
            case 5:course.setFiveStar(course.getFiveStar()+1);break;
            default:break;
        }
        course.setTotal(course.getTotal()+1);
        double score = 5.0 * course.getFiveStar() / course.getTotal() + 4.0 * course.getFourStar() / course.getTotal() + 3.0 * course.getThreeStar()
                / course.getTotal() + 2.0 * course.getTwoStar() / course.getTotal() + 1.0 * course.getOneStar() / course.getTotal();
        course.setScore((double) Math.round(score * 2 * 10) / 10);
        return courseDao.update(course);
    }

    public List<CourseVo> courseVoList(String type){
        List<Course> courseList = courseDao.findAllByType(type);
        List<CourseVo> courseVoList = new ArrayList<>();
        for (Course course:courseList){
            CourseVo courseVo = new CourseVo();
            courseVo.setId(course.getId());
            courseVo.setName(course.getName());
            courseVo.setTeacher(course.getTeacher());
            courseVo.setType(type);
            courseVo.setScore(course.getScore());
            courseVo.setNewEva(evaluationDao.findContentByCourseId(course.getId()));
            courseVoList.add(courseVo);
        }
        return courseVoList;
    }
}
