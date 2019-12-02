package com.course.evaluation;

import com.course.evaluation.po.Course;
import com.course.evaluation.service.CourseService;

/**
 * @author 曾哲
 */
public class test {
    public static void main(String[] args) {
        CourseService courseService = new CourseService();
        for (int id=1;id<=5;id++) {
            Course course = courseService.findById(id);
            double score = 5.0 * course.getFiveStar() / course.getTotal() + 4.0 * course.getFourStar() / course.getTotal() + 3.0 * course.getThreeStar()
                    / course.getTotal() + 2.0 * course.getTwoStar() / course.getTotal() + 1.0 * course.getOneStar() / course.getTotal();
            course.setScore((double) Math.round(score * 2 * 10) / 10);
            courseService.updateScore(course);
            System.out.println("course"+id+"-score:"+course.getScore());
        }
    }
}
