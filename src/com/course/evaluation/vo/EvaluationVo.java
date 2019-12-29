package com.course.evaluation.vo;

public class EvaluationVo {
    private Integer id;
    private Integer courseId;
    private String username;
    private String profile;
    private Integer star;
    private String content;
    private String time;
    private Integer support;
    private Integer learned;

    public EvaluationVo() {
    }

    public EvaluationVo(Integer id, Integer courseId, String username, String profile, Integer star, String content, String time, Integer support, Integer learned) {
        this.id = id;
        this.courseId = courseId;
        this.username = username;
        this.profile = profile;
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

    public Integer getCourseId() {
        return courseId;
    }

    public void setCourseId(Integer courseId) {
        this.courseId = courseId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
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

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public Integer getSupport() {
        return support;
    }

    public void setSupport(Integer support) {
        this.support = support;
    }

    public Integer getLearned() {
        return learned;
    }

    public void setLearned(Integer learned) {
        this.learned = learned;
    }
}
