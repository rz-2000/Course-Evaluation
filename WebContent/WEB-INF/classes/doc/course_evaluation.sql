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

 Date: 02/12/2019 23:39:52
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `teacher` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `five_star` int(255) NOT NULL,
  `four_star` int(255) NOT NULL,
  `three_star` int(255) NOT NULL,
  `two_star` int(255) NOT NULL,
  `one_star` int(255) NOT NULL,
  `total` int(255) NOT NULL,
  `score` double(255, 1) NULL DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of course
-- ----------------------------
INSERT INTO `course` VALUES (1, '课程1', '类型1', '专业1', '教师1', 1, 2, 3, 4, 5, 15, 4.7, 'images/temp.jpg');
INSERT INTO `course` VALUES (2, '课程2', '类型2', '专业2', '教师2', 5, 4, 3, 2, 1, 15, 7.3, 'images/temp.jpg');
INSERT INTO `course` VALUES (3, '课程3', '类型3', '专业3', '教师3', 8, 3, 3, 3, 3, 20, 7.0, 'images/temp.jpg');
INSERT INTO `course` VALUES (4, '课程4', '类型4', '专业4', '教师4', 10, 9, 3, 1, 2, 25, 7.9, 'images/temp.jpg');
INSERT INTO `course` VALUES (5, '课程5', '类型5', '专业5', '教师5', 2, 1, 0, 0, 0, 3, 9.3, 'images/temp.jpg');

-- ----------------------------
-- Table structure for evaluation
-- ----------------------------
DROP TABLE IF EXISTS `evaluation`;
CREATE TABLE `evaluation`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `course_id` int(10) NOT NULL,
  `star` int(1) NOT NULL,
  `content` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` datetime(0) NOT NULL,
  `support` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `real_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `grade` int(4) NULL DEFAULT NULL,
  `sex` int(1) NULL DEFAULT NULL,
  `phone_number` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `profile_photo` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, '1', '1', '张三', '17020001000', '计算机科学与技术', 2017, 1, '17811112222', 'test@test.com', NULL);

SET FOREIGN_KEY_CHECKS = 1;
