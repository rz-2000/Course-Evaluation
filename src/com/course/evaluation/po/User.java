package com.course.evaluation.po;

/**
 * @author 曾哲
 */
public class User {
    private Integer id;
    private String username;
    private String password;
    private String realName;
    private Integer number;
    private String major;
    private Integer grade;
    private Integer sex;
    private Integer phoneNumber;
    private String email;
    private String profilePhoto;

    public User() {
    }

    public User(Integer id, String username, String password, String realName, Integer number, String major, Integer grade, Integer sex, Integer phoneNumber, String email, String profilePhoto) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.realName = realName;
        this.number = number;
        this.major = major;
        this.grade = grade;
        this.sex = sex;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.profilePhoto = profilePhoto;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRealName() {
        return realName;
    }

    public void setRealName(String realName) {
        this.realName = realName;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    public Integer getGrade() {
        return grade;
    }

    public void setGrade(Integer grade) {
        this.grade = grade;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(String profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
}
