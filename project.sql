/*
 Navicat Premium Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50151
 Source Host           : localhost:3306
 Source Schema         : project

 Target Server Type    : MySQL
 Target Server Version : 50151
 File Encoding         : 65001

 Date: 16/06/2018 09:53:24
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for recommendjob
-- ----------------------------
DROP TABLE IF EXISTS `recommendjob`;
CREATE TABLE `recommendjob`  (
  `number` int(11) NOT NULL,
  `companyNumber` int(11) NULL DEFAULT NULL,
  `jobNumber` int(11) NULL DEFAULT NULL,
  `teacherNumber` int(11) NULL DEFAULT NULL,
  `studentNumber` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `recommendjob_ibfk_1`(`companyNumber`) USING BTREE,
  INDEX `recommendjob_ibfk_2`(`jobNumber`) USING BTREE,
  INDEX `recommendjob_ibfk_3`(`teacherNumber`) USING BTREE,
  INDEX `recommendjob_ibfk_4`(`studentNumber`) USING BTREE,
  CONSTRAINT `recommendjob_ibfk_1` FOREIGN KEY (`companyNumber`) REFERENCES `companymessageregister` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendjob_ibfk_2` FOREIGN KEY (`jobNumber`) REFERENCES `studentjobmessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendjob_ibfk_3` FOREIGN KEY (`teacherNumber`) REFERENCES `teachermessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `recommendjob_ibfk_4` FOREIGN KEY (`studentNumber`) REFERENCES `studentmessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for studentenrollmessage
-- ----------------------------
DROP TABLE IF EXISTS `studentenrollmessage`;
CREATE TABLE `studentenrollmessage`  (
  `number` int(11) NOT NULL,
  `companyNumber` int(11) NULL DEFAULT NULL,
  `jobNumber` int(11) NULL DEFAULT NULL,
  `studentNumber` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `studentenrollmessage_ibfk_1`(`companyNumber`) USING BTREE,
  INDEX `studentenrollmessage_ibfk_2`(`jobNumber`) USING BTREE,
  INDEX `studentenrollmessage_ibfk_3`(`studentNumber`) USING BTREE,
  CONSTRAINT `studentenrollmessage_ibfk_1` FOREIGN KEY (`companyNumber`) REFERENCES `companymessageregister` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentenrollmessage_ibfk_2` FOREIGN KEY (`jobNumber`) REFERENCES `studentjobmessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentenrollmessage_ibfk_3` FOREIGN KEY (`studentNumber`) REFERENCES `studentmessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for studentjobapply
-- ----------------------------
DROP TABLE IF EXISTS `studentjobapply`;
CREATE TABLE `studentjobapply`  (
  `number` int(11) NOT NULL,
  `studentNumber` int(11) NULL DEFAULT NULL,
  `companyNumber` int(11) NULL DEFAULT NULL,
  `jobNumber` int(11) NULL DEFAULT NULL,
  `applytime` date NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `jobNumber`(`jobNumber`) USING BTREE,
  INDEX `studentjobapply_ibfk_1`(`studentNumber`) USING BTREE,
  INDEX `studentjobapply_ibfk_2`(`companyNumber`) USING BTREE,
  CONSTRAINT `studentjobapply_ibfk_1` FOREIGN KEY (`studentNumber`) REFERENCES `studentmessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `studentjobapply_ibfk_2` FOREIGN KEY (`companyNumber`) REFERENCES `companymessageregister` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for studentjobmessage
-- ----------------------------
DROP TABLE IF EXISTS `studentjobmessage`;
CREATE TABLE `studentjobmessage`  (
  `number` int(11) NOT NULL,
  `companyNumber` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `experience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `typerequire` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `salary` int(11) NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `studentjobmessage_ibfk_1`(`companyNumber`) USING BTREE,
  CONSTRAINT `studentjobmessage_ibfk_1` FOREIGN KEY (`companyNumber`) REFERENCES `companymessageregister` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for studentmessage
-- ----------------------------
DROP TABLE IF EXISTS `studentmessage`;
CREATE TABLE `studentmessage`  (
  `number` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `registerNumber` int(11) NOT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `birth` date NOT NULL,
  `date` date NOT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `registerNumber`(`registerNumber`) USING BTREE,
  CONSTRAINT `studentmessage_ibfk_1` FOREIGN KEY (`registerNumber`) REFERENCES `studentregister` (`registerNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of studentmessage
-- ----------------------------
INSERT INTO `studentmessage` VALUES (1, '111', '?', 1, '111', '11', '2018-06-14', '2018-06-07', '1111111111111111');
INSERT INTO `studentmessage` VALUES (2, '2', 'on', 8, '软件工程', '555', '1204-04-07', '1207-07-07', NULL);
INSERT INTO `studentmessage` VALUES (3, '2', 'on', 7, '海洋科学类', 'ds', '1111-01-01', '1112-01-01', NULL);
INSERT INTO `studentmessage` VALUES (4, '2', 'on', 9, '大气科学类', '1212', '1212-01-01', '1212-01-01', NULL);
INSERT INTO `studentmessage` VALUES (6, '2', '?', 2, '11', '1111', '2018-06-22', '2018-06-07', '1');
INSERT INTO `studentmessage` VALUES (11, '111', '?', 1, '111', '11', '2018-06-14', '2018-06-07', '1111111111111111');


-- ----------------------------
-- Table structure for studentresume
-- ----------------------------
DROP TABLE IF EXISTS `studentresume`;
CREATE TABLE `studentresume`  (
  `number` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `studentNumber` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `birth` date NULL DEFAULT NULL,
  `award` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `politics` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `nativeplace` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `health` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `studentNumber`(`studentNumber`) USING BTREE,
  CONSTRAINT `studentresume_ibfk_1` FOREIGN KEY (`studentNumber`) REFERENCES `studentmessage` (`number`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 30 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of studentresume
-- ----------------------------
INSERT INTO `studentresume` VALUES (1, 1, '11', '?', '2018-06-08', '111111111111111111', '111', '111111', '1111111', '7d7596173ab1241f541958164ef7841a1f3447671f96d-5Ths6M_fw658.jpg', '1111111', '111111111111111', '11111111111111111');
INSERT INTO `studentresume` VALUES (2, 2, '哈哈', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `studentresume` VALUES (13, 6, '6', '?', '2018-06-15', '11111', '6', '13615804059', '1', 'image/1.png', '1', '1', '1111111111');
INSERT INTO `studentresume` VALUES (26, 2, '2', '?', '2018-06-14', '2', '2', '2', '2', '7d7596173ab1241f541958164ef7841a1f3447671f96d-5Ths6M_fw658.jpg', '2', '2', '2');
INSERT INTO `studentresume` VALUES (27, 6, '2', '?', '2018-06-14', '2', '2', '2', '2', '7d7596173ab1241f541958164ef7841a1f3447671f96d-5Ths6M_fw658.jpg', '2', '2', '2');
INSERT INTO `studentresume` VALUES (28, 1, '11', '?', '2018-06-08', '111111111111111111', '111', '111111', '1111111', '7d7596173ab1241f541958164ef7841a1f3447671f96d-5Ths6M_fw658.jpg', '1111111', '111111111111111', '11111111111111111');
INSERT INTO `studentresume` VALUES (29, 1, '11', '?', '2018-06-08', '111111111111111111', '111', '111111', '1111111', '7d7596173ab1241f541958164ef7841a1f3447671f96d-5Ths6M_fw658.jpg', '1111111', '111111111111111', '11111111111111111');

-- ----------------------------
-- Table structure for teachercoursemessage
-- ----------------------------
DROP TABLE IF EXISTS `teachercoursemessage`;
CREATE TABLE `teachercoursemessage`  (
  `number` int(11) NOT NULL,
  `teacherNumber` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `time` date NULL DEFAULT NULL,
  `place` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `teachercoursemessage_ibfk_1`(`teacherNumber`) USING BTREE,
  CONSTRAINT `teachercoursemessage_ibfk_1` FOREIGN KEY (`teacherNumber`) REFERENCES `teachermessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for teachercoursepush
-- ----------------------------
DROP TABLE IF EXISTS `teachercoursepush`;
CREATE TABLE `teachercoursepush`  (
  `number` int(11) NOT NULL,
  `courseNumber` int(11) NULL DEFAULT NULL,
  `teacherNumber` int(11) NULL DEFAULT NULL,
  `companyNumber` int(11) NULL DEFAULT NULL,
  `date` date NULL DEFAULT NULL,
  PRIMARY KEY (`number`) USING BTREE,
  INDEX `courseNumber`(`courseNumber`) USING BTREE,
  INDEX `teacherNumber`(`teacherNumber`) USING BTREE,
  INDEX `companyNumber`(`companyNumber`) USING BTREE,
  CONSTRAINT `teachercoursepush_ibfk_1` FOREIGN KEY (`courseNumber`) REFERENCES `teachercoursemessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teachercoursepush_ibfk_2` FOREIGN KEY (`teacherNumber`) REFERENCES `teachermessage` (`number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teachercoursepush_ibfk_3` FOREIGN KEY (`companyNumber`) REFERENCES `companymessageregister` (`number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Compact;


SET FOREIGN_KEY_CHECKS = 1;
