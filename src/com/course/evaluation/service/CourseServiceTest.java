package com.course.evaluation.service;

import com.course.evaluation.po.Course;
import org.junit.jupiter.api.Test;

/**
 * @author 曾哲
 * @date 2019/12/19
 * @description 提交评论后更新课程信息的方法的测试类
 */
class CourseServiceTest {
    private CourseService courseService = new CourseService();

    @Test
    void updateCourse() {
        //待更新的课程id
        int courseId = 1;
        //提交评论的评星
        int star = 5;
        System.out.println("course id:"+courseId);
        System.out.println("课程信息更新前：");
        Course course = courseService.findById(courseId);
        switch (star){
            case 1:System.out.println("oneStar:"+course.getOneStar());break;
            case 2:System.out.println("twoStar:"+course.getTwoStar());break;
            case 3:System.out.println("threeStar:"+course.getThreeStar());break;
            case 4:System.out.println("fourStar:"+course.getFourStar());break;
            case 5:System.out.println("fiveStar:"+course.getFiveStar());break;
            default:break;
        }
        System.out.println("total:"+course.getTotal());
        System.out.println("score:"+course.getScore());
        int result = courseService.updateCourse(courseId, star);
        course = courseService.findById(courseId);
        System.out.println("课程信息更新后：");
        if (result==1){
            switch (star){
                case 1:System.out.println("oneStar:"+course.getOneStar());break;
                case 2:System.out.println("twoStar:"+course.getTwoStar());break;
                case 3:System.out.println("threeStar:"+course.getThreeStar());break;
                case 4:System.out.println("fourStar:"+course.getFourStar());break;
                case 5:System.out.println("fiveStar:"+course.getFiveStar());break;
                default:break;
            }
            System.out.println("total:"+course.getTotal());
            System.out.println("score:"+course.getScore());
        }
    }
}