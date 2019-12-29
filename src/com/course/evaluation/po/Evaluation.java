package com.course.evaluation.po;

import java.lang.String;
/**
 * @author 曾哲
 */
public class Evaluation {
    private Integer id;
    private Integer userId;
    private Integer courseId;
    private Integer star;
    private String content;
    private String time;
    private Integer support;
    private Integer learned;

    public Evaluation() {
    }

    public Evaluation(Integer id, Integer userId, Integer courseId, Integer star, String content,
                      String time, Integer support,Integer learned) {

        this.id = id;
        this.userId = userId;
        this.courseId = courseId;
        this.star = star;
        this.content = content;
        this.time = time;
        this.support = support;
        this.learned = learned;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public Integer getStar() {
        return star;
    }

    public void setStar(Integer star) {
        this.star = star;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime() { return time; }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getSupport() {
        return support;
    }

    public void setSupport(Integer support) {
        this.support = support;
    }

    public Integer getLearned() { return learned; }

    public void setLearned(Integer learned) { this.learned = learned; }
}
