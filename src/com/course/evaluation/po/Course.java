package com.course.evaluation.po;

/**
 * @author 曾哲
 */
public class Course {
    private Integer id;
    private String name;
    private String type;
    private String major;
    private String teacher;
    private Integer fiveStar;
    private Integer fourStar;
    private Integer threeStar;
    private Integer twoStar;
    private Integer oneStar;
    private Integer total;
    private double score;
    private String image;

    public Course() {
    }

    public Course(Integer id, String name, String type, String major, String teacher, Integer fiveStar, Integer fourStar,
                  Integer threeStar, Integer twoStar, Integer oneStar, Integer total, float score, String image) {
        this.id = id;
        this.name = name;
        this.type = type;
        this.major = major;
        this.teacher = teacher;
        this.fiveStar = fiveStar;
        this.fourStar = fourStar;
        this.threeStar = threeStar;
        this.twoStar = twoStar;
        this.oneStar = oneStar;
        this.total = total;
        this.score = score;
        this.image = image;
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

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Integer getFiveStar() {
        return fiveStar;
    }

    public void setFiveStar(Integer fiveStar) {
        this.fiveStar = fiveStar;
    }

    public Integer getFourStar() {
        return fourStar;
    }

    public void setFourStar(Integer fourStar) {
        this.fourStar = fourStar;
    }

    public Integer getThreeStar() {
        return threeStar;
    }

    public void setThreeStar(Integer threeStar) {
        this.threeStar = threeStar;
    }

    public Integer getTwoStar() {
        return twoStar;
    }

    public void setTwoStar(Integer twoStar) {
        this.twoStar = twoStar;
    }

    public Integer getOneStar() {
        return oneStar;
    }

    public void setOneStar(Integer oneStar) {
        this.oneStar = oneStar;
    }

    public Integer getTotal() {
        return total;
    }

    public void setTotal(Integer total) {
        this.total = total;
    }

    public double getScore() {
        return score;
    }

    public void setScore(double score) {
        this.score = score;
    }

    public String getImage(){
        return image;
    }

    public void setImage(String image){
        this.image = image;
    }
}
