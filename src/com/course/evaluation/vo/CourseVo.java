package com.course.evaluation.vo;

public class CourseVo {
    private Integer id;
    private String name;
    private String teacher;
    private String type;
    private Double score;
    private String newEva;

    public CourseVo(Integer id, String name, String teacher, String type, Double score, String newEva) {
        this.id = id;
        this.name = name;
        this.teacher = teacher;
        this.type = type;
        this.score = score;
        this.newEva = newEva;
    }

    public CourseVo() {

    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public Double getScore() {
        return score;
    }

    public void setScore(Double score) {
        this.score = score;
    }

    public String getNewEva() {
        return newEva;
    }

    public void setNewEva(String newEva) {
        this.newEva = newEva;
    }
}
