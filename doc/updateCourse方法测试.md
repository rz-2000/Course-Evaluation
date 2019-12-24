# updateCourse方法测试

## 测试人

曾哲

## 测试时间

2019/12/19

## 测试工具

Junit

## 测试内容

CourseService.updateCourse

提交评论后更新课程信息的方法，包括课程评论数加一、相应评星数加一和重新计算课程评分

## 测试结果

> course id:1
> 课程信息更新前：
> fiveStar:1
> total:15
> score:4.7
> 课程信息更新后：
> fiveStar:2
> total:16
> score:5.0

成功更新课程信息

## 问题

1. 没有Junit的jar包

   下载并放在WebContent\WEB-INF\lib目录下

2. 刚开始测试只更新了评星数和评分，忘记更新评论数

   修改方法，课程评论数加一

## 感想

Junit可以方便地进行单元测试，找出方法中的问题