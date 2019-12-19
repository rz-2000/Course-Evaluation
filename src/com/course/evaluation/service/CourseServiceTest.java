package com.course.evaluation.service;

import com.course.evaluation.po.Course;

import static org.junit.jupiter.api.Assertions.*;

/**
 * @author 曾哲
 */
class CourseServiceTest {
    private CourseService courseService = new CourseService();

    @org.junit.jupiter.api.Test
    void updateCourse() {
        int courseId = 1;
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