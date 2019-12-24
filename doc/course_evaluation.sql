/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80015
 Source Host           : localhost:3306
 Source Schema         : course_evaluation

 Target Server Type    : MySQL
 Target Server Version : 80015
 File Encoding         : 65001

 Date: 14/12/2019 11:22:36
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程的名称',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程的类型',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程所属的专业',
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '教授课程的教师',
  `five_star` int(255) NOT NULL COMMENT '五星评分数量',
  `four_star` int(255) NOT NULL COMMENT '四星评分数量',
  `three_star` int(255) NOT NULL COMMENT '三星评分数量',
  `two_star` int(255) NOT NULL COMMENT '二星评分数量',
  `one_star` int(255) NOT NULL COMMENT '一星评分数量',
  `total` int(255) NOT NULL COMMENT '评分总数',
  `score` double(255, 1) NULL DEFAULT NULL COMMENT '课程的总体评分，十分制',
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '课程图片路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '计算机网络', '专业课', '计算机科学与技术', '唐瑞春',1, 2, 3, 4, 5, 15, 4.7, 'images/computerNetwork.jpg');
INSERT INTO `course` VALUES (2, '数据结构', '专业课', '计算机科学与技术', '刘超', 5, 4, 3, 2, 1, 15, 7.3, 'images/alpha.jpg');
INSERT INTO `course` VALUES (3, '操作系统', '专业课', '计算机科学与技术', '窦金凤', 8, 3, 3, 3, 3, 20, 7.0, 'images/OS.jpg');
INSERT INTO `course` VALUES (4, '编译原理', '专业课', '计算机科学与技术', '林喜军', 10, 9, 3, 1, 2, 25, 7.9, 'images/bianyi.jpg');
INSERT INTO `course` VALUES (5, '软件工程', '专业课', '计算机科学与技术', '高峰', 2, 1, 0, 0, 0, 3, 9.3, 'images/software.jpg');
INSERT INTO `course` VALUES (6, '高等数学', '公共基础课', '全专业', '林敏',1, 2, 3, 4, 5, 15, 4.7, 'images/math.jpg');
INSERT INTO `course` VALUES (7, '大学物理', '公共基础课', '全专业', '王术宽', 5, 4, 3, 2, 1, 15, 7.3, 'images/wuli.jpg');
INSERT INTO `course` VALUES (8, '高级口语', '公共基础课', '全专业', '李诞', 8, 3, 3, 3, 3, 20, 7.0, 'images/oral.jpg');
INSERT INTO `course` VALUES (9, '家庭社会学', '通识课', '全专业', '王鹏', 10, 9, 3, 1, 2, 25, 7.9, 'images/family.jpg');
INSERT INTO `course` VALUES (10, '初级游泳', '公共基础课', '全专业', '初奕剑', 2, 1, 0, 0, 0, 3, 9.3, 'images/swim.jpg');
-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL COMMENT '评论的用户的id',
  `course_id` int(10) NOT NULL COMMENT '评论的课程的id',
  `star` int(1) NOT NULL COMMENT '评星：1-5',
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '评论的内容',
  `time` varchar(255) NOT NULL COMMENT '评论的时间',
  `support` int(255) NOT NULL COMMENT '评论的点赞数',
  `learned` int(1) NULL DEFAULT NULL COMMENT '评论的用户是否学过本课程：0.否；1.是',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '密码',
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '真实姓名',
  `number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '学号',
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业',
  `grade` int(4) NULL DEFAULT NULL COMMENT '年级：2015-2020',
  `sex` int(1) NULL DEFAULT NULL COMMENT '性别：1.男；2.女',
  `phone_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号',
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '电子邮箱',
  `profile_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像路径',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', '张三', '17020001000', '计算机科学与技术', 2017, 1, '17811112222', 'test@test.com', 'images/duck.jpg');
INSERT INTO `user` VALUES (2, '17020031015', '17020031015', '高老师的小迷弟', '17020001015', '计算机科学与技术', 2017, 1, '17811112222', 'test@test.com', 'images/xixi.jpg');

SET FOREIGN_KEY_CHECKS = 1;
