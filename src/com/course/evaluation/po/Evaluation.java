package com.course.evaluation.po;

import java.util.Date;

/**
 * @author 曾哲
 */
public class Evaluation {
    private Integer id;
    private Integer userId;
    private Integer courseId;
    private Integer star;
    private String content;
    private Date time;
    private Integer support;

    public Evaluation() {
    }

    public Evaluation(Integer id, Integer userId, Integer courseId, Integer star, String content, Date time, Integer support) {
        this.id = id;
        this.userId = userId;
        this.courseId = courseId;
        this.star = star;
        this.content = content;
        this.time = time;
        this.support = support;
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

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getSupport() {
        return support;
    }

    public void setSupport(Integer support) {
        this.support = support;
    }
}
