/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50711
Source Host           : 127.0.0.1:3309
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-25 13:36:30
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for clerk
-- ----------------------------
DROP TABLE IF EXISTS `clerk`;
CREATE TABLE `clerk` (
  `Clerk_ID` int(11) NOT NULL AUTO_INCREMENT,
  `Clerk_name` varchar(50) DEFAULT NULL COMMENT '用户名',
  `Clerk_pwd` varchar(50) DEFAULT NULL COMMENT '密码',
  `name` varchar(50) DEFAULT NULL COMMENT '姓名',
  `OrganId` int(11) DEFAULT NULL,
  PRIMARY KEY (`Clerk_ID`),
  KEY `fk_organ_clerk` (`OrganId`),
  CONSTRAINT `fk_organ_clerk` FOREIGN KEY (`OrganId`) REFERENCES `organ` (`OrganID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clerk
-- ----------------------------
INSERT INTO `clerk` VALUES ('1', '1210030101', '123', 'clerk1', '1');
INSERT INTO `clerk` VALUES ('6', '1210030102', '123', 'clerk2', '1');
INSERT INTO `clerk` VALUES ('7', '1210030103', '123', 'clerk3', '1');
INSERT INTO `clerk` VALUES ('8', '1210030104', '123', 'clerk4', '1');
INSERT INTO `clerk` VALUES ('9', '1210030105', '123', 'clerk5', '1');
INSERT INTO `clerk` VALUES ('10', '1210030201', '123', 'clerk6', '2');
INSERT INTO `clerk` VALUES ('11', '1210030202', '123', 'clerk7', '2');
INSERT INTO `clerk` VALUES ('12', '1210030203', '123', 'clerk8', '2');
INSERT INTO `clerk` VALUES ('13', '1210030204', '123', 'clerk9', '2');
INSERT INTO `clerk` VALUES ('14', '1210030205', '123', 'clerk10', '2');
INSERT INTO `clerk` VALUES ('15', '1210030301', '123', 'clerk11', '3');
INSERT INTO `clerk` VALUES ('16', '1210030302', '123', 'clerk12', '3');
INSERT INTO `clerk` VALUES ('17', '1210030303', '123', 'clerk13', '3');
INSERT INTO `clerk` VALUES ('18', '1210030304', '123', 'clerk14', '3');
INSERT INTO `clerk` VALUES ('19', '1210030305', '123', 'clerk15', '3');

-- ----------------------------
-- Table structure for clerk_cl
-- ----------------------------
DROP TABLE IF EXISTS `clerk_cl`;
CREATE TABLE `clerk_cl` (
  `cl_clerk_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_cl_id` int(11) DEFAULT NULL COMMENT '考卷id',
  `OrganID` int(11) DEFAULT NULL COMMENT '考生班级id',
  PRIMARY KEY (`cl_clerk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clerk_cl
-- ----------------------------
INSERT INTO `clerk_cl` VALUES ('53', '1', '1');
INSERT INTO `clerk_cl` VALUES ('54', '1', '2');
INSERT INTO `clerk_cl` VALUES ('55', '1', '3');
INSERT INTO `clerk_cl` VALUES ('56', '1', '4');
INSERT INTO `clerk_cl` VALUES ('59', '2', '1');
INSERT INTO `clerk_cl` VALUES ('61', '2', '4');
INSERT INTO `clerk_cl` VALUES ('62', '2', '5');
INSERT INTO `clerk_cl` VALUES ('63', '1', '5');
INSERT INTO `clerk_cl` VALUES ('64', '2', '2');

-- ----------------------------
-- Table structure for clerk_gdks_tm
-- ----------------------------
DROP TABLE IF EXISTS `clerk_gdks_tm`;
CREATE TABLE `clerk_gdks_tm` (
  `clerk_answer_id` int(11) NOT NULL AUTO_INCREMENT,
  `gdsj_id` int(11) DEFAULT NULL COMMENT '固定试卷下面的题目id',
  `clerk_kscj_id` int(11) DEFAULT NULL COMMENT '考试成绩里的考生id',
  `clerk_tm_da` varchar(2000) DEFAULT NULL COMMENT '考生答案',
  `tm_wddf` float DEFAULT NULL COMMENT '问答得分',
  PRIMARY KEY (`clerk_answer_id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clerk_gdks_tm
-- ----------------------------
INSERT INTO `clerk_gdks_tm` VALUES ('1', '3', '7', 'ABC', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('19', '5', '7', '66', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('20', '4', '7', 'ac', '1');
INSERT INTO `clerk_gdks_tm` VALUES ('21', '258', '8', 'b', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('22', '259', '8', '6', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('23', '260', '8', '6', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('24', '251', '8', 'b', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('25', '252', '8', 'a', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('26', '253', '8', '0', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('27', '254', '8', '0', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('28', '255', '8', '66', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('29', '256', '9', '66', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('30', '257', '9', 'ac', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('31', '258', '9', 'b', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('32', '259', '9', '6', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('33', '260', '9', '6', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('34', '251', '9', 'b', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('35', '252', '9', 'a', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('36', '253', '9', '0', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('37', '254', '9', '0', '0');
INSERT INTO `clerk_gdks_tm` VALUES ('38', '255', '9', '66', '0');

-- ----------------------------
-- Table structure for clerk_kscj
-- ----------------------------
DROP TABLE IF EXISTS `clerk_kscj`;
CREATE TABLE `clerk_kscj` (
  `clerk_kscj_id` int(11) NOT NULL AUTO_INCREMENT,
  `clerk_id` int(11) DEFAULT NULL COMMENT '考生id',
  `tk_cl_id` int(11) DEFAULT NULL COMMENT '试卷id',
  `clerk_ks_status` int(11) DEFAULT NULL COMMENT '考试状态 0未提交1完成2待判分',
  `clerk_ks_btime` datetime DEFAULT NULL COMMENT '开始时间',
  `clerk_ks_etime` datetime DEFAULT NULL COMMENT '结束时间',
  `cj` float DEFAULT NULL COMMENT '成绩',
  `clerk_xzdf` float DEFAULT NULL COMMENT '客观题得分',
  `clerk_wddf` float DEFAULT NULL COMMENT '主观题得分',
  `clerk_wdpf` int(11) DEFAULT NULL COMMENT '是否手工评分',
  `ks_time` int(11) DEFAULT NULL COMMENT '考试时长',
  `clerk_pj` varchar(50) DEFAULT '' COMMENT '判卷人',
  `AnswerGather` varchar(5000) DEFAULT '' COMMENT 'xml',
  PRIMARY KEY (`clerk_kscj_id`),
  KEY `fk_clerkId` (`clerk_id`),
  CONSTRAINT `fk_clerkId` FOREIGN KEY (`clerk_id`) REFERENCES `clerk` (`Clerk_ID`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clerk_kscj
-- ----------------------------
INSERT INTO `clerk_kscj` VALUES ('7', '1', '2', '1', '2016-05-18 17:40:30', '2016-05-18 17:40:50', '60', '60', '0', '1', '60', null, '<ROOTSTUB global=\"true\" prefix_259=\"6\" mark_259=\"0\" prefix_260=\"6\" mark_260=\"0\" prefix_251=\"b\" mark_251=\"0\" prefix_252=\"a\" mark_252=\"0\" prefix_257=\"ac\" mark_257=\"0\" prefix_258=\"b\" mark_258=\"0\" prefix_253=\"0\" mark_253=\"0\" prefix_254=\"0\" mark_254=\"0\" prefix_255=\"66\" mark_255=\"0\" prefix_256=\"66\" mark_256=\"0\"/>');
INSERT INTO `clerk_kscj` VALUES ('8', '7', '2', '1', '2016-05-18 17:40:30', '2016-05-18 17:40:50', '60', '60', '0', '1', '60', null, '<ROOTSTUB global=\"true\" prefix_259=\"6\" mark_259=\"0\" prefix_260=\"6\" mark_260=\"0\" prefix_251=\"b\" mark_251=\"0\" prefix_252=\"a\" mark_252=\"0\" prefix_257=\"ac\" mark_257=\"0\" prefix_258=\"b\" mark_258=\"0\" prefix_253=\"0\" mark_253=\"0\" prefix_254=\"0\" mark_254=\"0\" prefix_255=\"66\" mark_255=\"0\" prefix_256=\"66\" mark_256=\"0\"/>');
INSERT INTO `clerk_kscj` VALUES ('9', '6', '2', '1', '2016-05-18 17:40:30', '2016-05-18 17:40:50', '60', '60', '0', '1', '60', null, '<ROOTSTUB global=\"true\" prefix_259=\"6\" mark_259=\"0\" prefix_260=\"6\" mark_260=\"0\" prefix_251=\"b\" mark_251=\"0\" prefix_252=\"a\" mark_252=\"0\" prefix_257=\"ac\" mark_257=\"0\" prefix_258=\"b\" mark_258=\"0\" prefix_253=\"0\" mark_253=\"0\" prefix_254=\"0\" mark_254=\"0\" prefix_255=\"66\" mark_255=\"0\" prefix_256=\"66\" mark_256=\"0\"/>');

-- ----------------------------
-- Table structure for gdsj
-- ----------------------------
DROP TABLE IF EXISTS `gdsj`;
CREATE TABLE `gdsj` (
  `gdsj_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_cl_id` int(11) DEFAULT NULL COMMENT '试卷编号',
  `tk_tkj_id` int(11) DEFAULT NULL COMMENT '题库集',
  `tk_lx_id` int(11) DEFAULT NULL COMMENT '题库类型（tk_id）',
  `tm_id` int(11) DEFAULT NULL COMMENT '题目id',
  `tm_tx_id` int(11) DEFAULT NULL COMMENT '题目题型',
  `tm_nr` varchar(1000) DEFAULT NULL COMMENT '内容',
  `tm_fs` int(11) DEFAULT NULL COMMENT '分数',
  `tm_nd` int(11) DEFAULT NULL COMMENT '难度',
  `tm_zsd` varchar(500) DEFAULT NULL COMMENT '知识点',
  `tm_xuanxiang` varchar(5000) DEFAULT NULL COMMENT '题目可选项',
  `tm_xuanxiangnum` int(11) DEFAULT NULL COMMENT '可选项的数目',
  `tm_da` varchar(2000) DEFAULT NULL COMMENT '题目答案',
  PRIMARY KEY (`gdsj_id`),
  KEY `tm_id` (`tm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of gdsj
-- ----------------------------
INSERT INTO `gdsj` VALUES ('1', '2', '2', '8', '3', '1', 'java单选题', '2', '2', '单选题', '选A;选B;选C;选D', '4', 'C');
INSERT INTO `gdsj` VALUES ('2', '2', '2', '8', '5', '2', 'java填空题(大华位置___)', '2', '2', '填空题', null, '0', '北京');
INSERT INTO `gdsj` VALUES ('3', '2', '2', '8', '4', '3', 'java多选题', '2', '2', '多选题', '选A;选B;选C;选D', '4', 'BCD');
INSERT INTO `gdsj` VALUES ('4', '2', '2', '8', '6', '4', 'java判断题(大华最好)', '2', '2', '判断题', null, '0', '对');
INSERT INTO `gdsj` VALUES ('5', '2', '2', '8', '7', '5', 'java问答题(大华哪里好？)', '5', '4', '问答题', null, '0', '老师优秀');

-- ----------------------------
-- Table structure for organ
-- ----------------------------
DROP TABLE IF EXISTS `organ`;
CREATE TABLE `organ` (
  `OrganID` int(11) NOT NULL AUTO_INCREMENT,
  `OrganName` varchar(50) DEFAULT NULL COMMENT '机构名称',
  PRIMARY KEY (`OrganID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organ
-- ----------------------------
INSERT INTO `organ` VALUES ('1', '大华1319班');
INSERT INTO `organ` VALUES ('2', '大华1320班');
INSERT INTO `organ` VALUES ('3', '大华1321班');
INSERT INTO `organ` VALUES ('4', '大华1322班');
INSERT INTO `organ` VALUES ('5', '大华1323班');

-- ----------------------------
-- Table structure for right
-- ----------------------------
DROP TABLE IF EXISTS `right`;
CREATE TABLE `right` (
  `right_id` int(11) NOT NULL AUTO_INCREMENT,
  `right_name` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL COMMENT '0大权限，>0小权限',
  PRIMARY KEY (`right_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of right
-- ----------------------------
INSERT INTO `right` VALUES ('1', '试卷管理', '0');
INSERT INTO `right` VALUES ('2', '增加试卷', '1');
INSERT INTO `right` VALUES ('3', '删除试卷', '1');
INSERT INTO `right` VALUES ('4', '修改试卷', '1');
INSERT INTO `right` VALUES ('5', '题库管理', '0');
INSERT INTO `right` VALUES ('6', '增加题库', '5');
INSERT INTO `right` VALUES ('7', '删除题库', '5');
INSERT INTO `right` VALUES ('8', '修改题库', '5');
INSERT INTO `right` VALUES ('9', '权限管理', '0');
INSERT INTO `right` VALUES ('10', '增加权限', '9');
INSERT INTO `right` VALUES ('11', '删除权限', '9');
INSERT INTO `right` VALUES ('12', '修改权限', '9');
INSERT INTO `right` VALUES ('13', '考生管理', '0');
INSERT INTO `right` VALUES ('14', '增加考生', '13');
INSERT INTO `right` VALUES ('15', '删除考生', '13');
INSERT INTO `right` VALUES ('16', '修改考生', '13');

-- ----------------------------
-- Table structure for tk
-- ----------------------------
DROP TABLE IF EXISTS `tk`;
CREATE TABLE `tk` (
  `tk_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_name` varchar(255) DEFAULT NULL,
  `tkj_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tk_id`),
  KEY `fk_tkj_id` (`tkj_id`),
  CONSTRAINT `fk_tkj_id` FOREIGN KEY (`tkj_id`) REFERENCES `tkj` (`tkj_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tk
-- ----------------------------
INSERT INTO `tk` VALUES ('1', '大学物理', '1');
INSERT INTO `tk` VALUES ('2', '数据结构', '2');
INSERT INTO `tk` VALUES ('3', '计算机原理', '2');
INSERT INTO `tk` VALUES ('4', '操作系统', '2');
INSERT INTO `tk` VALUES ('5', '有机化学', '3');
INSERT INTO `tk` VALUES ('6', '文言文', '4');
INSERT INTO `tk` VALUES ('7', '分析化学', '3');
INSERT INTO `tk` VALUES ('8', 'java', '2');
INSERT INTO `tk` VALUES ('15', '333', '14');
INSERT INTO `tk` VALUES ('16', '333333', '15');

-- ----------------------------
-- Table structure for tkj
-- ----------------------------
DROP TABLE IF EXISTS `tkj`;
CREATE TABLE `tkj` (
  `tkj_id` int(11) NOT NULL AUTO_INCREMENT,
  `tkj_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`tkj_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tkj
-- ----------------------------
INSERT INTO `tkj` VALUES ('1', '物理系');
INSERT INTO `tkj` VALUES ('2', '计算机系');
INSERT INTO `tkj` VALUES ('3', '化学系');
INSERT INTO `tkj` VALUES ('4', '中文系');
INSERT INTO `tkj` VALUES ('14', '22');
INSERT INTO `tkj` VALUES ('15', '33');

-- ----------------------------
-- Table structure for tk_cl
-- ----------------------------
DROP TABLE IF EXISTS `tk_cl`;
CREATE TABLE `tk_cl` (
  `tk_cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_cl_name` varchar(50) DEFAULT NULL COMMENT '试卷名称',
  `tk_cl_time` int(11) DEFAULT NULL COMMENT '考试时长',
  `valid_btime` datetime DEFAULT NULL COMMENT '开始时间',
  `valid_etime` datetime DEFAULT NULL,
  `tk_cl_pf` int(11) DEFAULT NULL COMMENT '试卷是否需手工判分 1是0否',
  `allowSeePaper` int(11) DEFAULT NULL COMMENT '考生查看考试后，试卷是否显示试卷内各题目真确答案及说明 1允许0否',
  `isSavePaper` int(11) DEFAULT NULL COMMENT '答卷是否保存参数 保存1不保存答卷0',
  `minKsNum` int(11) DEFAULT NULL COMMENT '最小考试次数',
  `maxKsNum` int(11) DEFAULT NULL COMMENT '最大考试次数',
  `isOrder` int(11) DEFAULT NULL COMMENT '出题是否打乱顺序0不打乱1打乱',
  `moveOutTimes` int(11) DEFAULT NULL COMMENT '考试期间移出页面次数',
  `tk_cl_type` int(11) DEFAULT NULL COMMENT '试题显示方式 0一屏所有题1一屏一题2一屏一题型',
  `isAllow` int(11) DEFAULT NULL COMMENT '0允许所有人参加考试 1部分人参加考试',
  `totalScore` int(11) DEFAULT NULL COMMENT '总分',
  `passFS` int(255) DEFAULT NULL COMMENT '及格分',
  PRIMARY KEY (`tk_cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tk_cl
-- ----------------------------
INSERT INTO `tk_cl` VALUES ('1', '1320第一次考试', '60', '2016-04-05 17:00:00', '2016-04-05 18:00:00', '1', '1', '1', '1', '1', '0', '3', '1', '1', '100', '60');
INSERT INTO `tk_cl` VALUES ('2', '1320第二次考试', '60', '2016-05-19 19:14:25', '2016-05-23 19:14:20', '1', '1', '1', '1', '1', '0', '3', '1', '1', '100', '60');

-- ----------------------------
-- Table structure for tk_cl_ndzsd
-- ----------------------------
DROP TABLE IF EXISTS `tk_cl_ndzsd`;
CREATE TABLE `tk_cl_ndzsd` (
  `cl_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_cl_id` int(11) DEFAULT NULL COMMENT '试卷编号',
  `tk_tkj_id` int(11) DEFAULT NULL COMMENT '题库集',
  `tk_lx_id` int(11) DEFAULT NULL COMMENT '题库',
  `tm_tx_id` int(11) DEFAULT NULL COMMENT '题目类型，指向题型表主键',
  `tm_num` int(11) DEFAULT NULL COMMENT '题目出题数量',
  PRIMARY KEY (`cl_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tk_cl_ndzsd
-- ----------------------------
INSERT INTO `tk_cl_ndzsd` VALUES ('1', '2', '2', '8', '1', '1');
INSERT INTO `tk_cl_ndzsd` VALUES ('2', '2', '2', '8', '2', '1');
INSERT INTO `tk_cl_ndzsd` VALUES ('3', '2', '2', '8', '3', '1');
INSERT INTO `tk_cl_ndzsd` VALUES ('4', '2', '2', '8', '4', '1');
INSERT INTO `tk_cl_ndzsd` VALUES ('5', '2', '2', '8', '5', '1');

-- ----------------------------
-- Table structure for tm
-- ----------------------------
DROP TABLE IF EXISTS `tm`;
CREATE TABLE `tm` (
  `tm_id` int(11) NOT NULL AUTO_INCREMENT,
  `tm_name` varchar(50) DEFAULT NULL COMMENT '题目名称',
  `tm_type` int(11) DEFAULT NULL COMMENT '题目类型1选择题2填空题3多选题4判断题5问答题',
  `tm_score` int(11) DEFAULT NULL COMMENT '题目分数',
  `tm_nd` int(11) DEFAULT NULL COMMENT '题目难度',
  `tm_zsd` varchar(50) DEFAULT NULL COMMENT '题目知识点',
  `tm_xuanxiang` varchar(50) DEFAULT NULL COMMENT '题目选项',
  `tm_xuanxiang_num` int(11) DEFAULT NULL COMMENT '选项个数',
  `tm_da` varchar(2000) DEFAULT NULL COMMENT '题目答案',
  `tm_create_time` date DEFAULT NULL COMMENT '创建时间',
  `tm_create_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `tk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tm_id`),
  KEY `fk_tk_id` (`tk_id`),
  CONSTRAINT `fk_tk_id` FOREIGN KEY (`tk_id`) REFERENCES `tk` (`tk_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm
-- ----------------------------
INSERT INTO `tm` VALUES ('3', 'java单选题', '1', '2', '2', '单选题', '选A;选B;选C;选D', '4', 'C', '2016-04-01', '管理员', '8');
INSERT INTO `tm` VALUES ('4', 'java多选题', '3', '2', '2', '多选题', '选A;选B;选C;选D', '4', 'BCD', '2016-04-01', '管理员', '8');
INSERT INTO `tm` VALUES ('5', 'java填空题(大华位置___)', '2', '2', '2', '填空题', '', '0', '北京', '2016-04-01', '管理员', '8');
INSERT INTO `tm` VALUES ('6', 'java判断题(大华最好)', '4', '2', '2', '判断题', '', '0', '对', '2016-04-01', '管理员', '8');
INSERT INTO `tm` VALUES ('7', 'java问答题(大华哪里好？)', '5', '5', '4', '问答题', '', '0', '老师优秀', '2016-04-01', '管理员', '8');
INSERT INTO `tm` VALUES ('35', 'java权限标识符', '3', '2', '1', 'java基础', 'A:public;B:private;C:protected;D:default', '4', 'ABCD', '2016-05-16', '题库管理员', '8');
INSERT INTO `tm` VALUES ('36', 'java类关键字', '2', '2', '1', 'java基础', '', '0', 'Class', '2016-05-16', '题库管理员', '8');
INSERT INTO `tm` VALUES ('37', 'java异常处理哪个块都要执行', '2', '2', '1', 'java基础', '', '0', 'finally', '2016-05-16', '题库管理员', '8');
INSERT INTO `tm` VALUES ('38', 'java线程接口关键字是', '1', '2', '1', 'java中级', 'A:class;B:runanable;C:throw;D:hello', '4', 'B', '2016-05-16', '题库管理员', '8');
INSERT INTO `tm` VALUES ('39', '二叉树 遍历方式', '3', '2', '1', '二叉树', 'A:中序遍历;B:后序遍历;D:先序遍历;D:helloworld', '4', 'ABC', '2016-05-16', '题库管理员', '2');
INSERT INTO `tm` VALUES ('40', '中央处理单元缩写是?', '1', '2', '1', '计算机常识', 'A:CPU;B:CPV;C:CTO;D:CEO', '4', 'A', '2016-05-16', '题库管理员', '3');
INSERT INTO `tm` VALUES ('41', '计算机内存只读缩写', '1', '2', '1', '计算机常识', 'A:CPU;B:ROM;C:RAM;D:NTFS', '4', 'B', '2016-05-16', '题库管理员', '3');
INSERT INTO `tm` VALUES ('42', '计算机acer宏基产地', '2', '2', '1', '计算机基础', '', '0', '台湾', '2016-05-16', '题库管理员', '3');
INSERT INTO `tm` VALUES ('43', 'hibernate和mybati哪个好？', '5', '5', '1', '框架', '', '0', 'mybatis', '2016-05-16', '题库管理员', '8');
INSERT INTO `tm` VALUES ('44', 'hibernate能执行sql吗?', '5', '5', '1', '框架', '', '0', '能', '2016-05-16', '题库管理员', '8');
INSERT INTO `tm` VALUES ('46', '22', '1', '2', '1', '2', 'A:1;B:2;C:3;D:4', '4', 'A', '2016-05-17', '题库管理员', '15');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(4) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(255) NOT NULL,
  `user_pwd` varchar(255) NOT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', 'admin');
INSERT INTO `user` VALUES ('2', '试卷管理员', '123');
INSERT INTO `user` VALUES ('3', '题库管理员', '123');
INSERT INTO `user` VALUES ('4', '考生管理员', '123');

-- ----------------------------
-- Table structure for user_right
-- ----------------------------
DROP TABLE IF EXISTS `user_right`;
CREATE TABLE `user_right` (
  `user_right_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `right_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`user_right_id`),
  KEY `fk_user_id` (`user_id`),
  KEY `fk_right_id` (`right_id`),
  CONSTRAINT `fk_right_id` FOREIGN KEY (`right_id`) REFERENCES `right` (`right_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_user_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=76 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_right
-- ----------------------------
INSERT INTO `user_right` VALUES ('1', '1', '9');
INSERT INTO `user_right` VALUES ('2', '1', '10');
INSERT INTO `user_right` VALUES ('3', '1', '11');
INSERT INTO `user_right` VALUES ('4', '1', '12');
INSERT INTO `user_right` VALUES ('58', '4', '13');
INSERT INTO `user_right` VALUES ('59', '4', '14');
INSERT INTO `user_right` VALUES ('60', '4', '15');
INSERT INTO `user_right` VALUES ('61', '4', '16');
INSERT INTO `user_right` VALUES ('62', '2', '1');
INSERT INTO `user_right` VALUES ('63', '2', '1');
INSERT INTO `user_right` VALUES ('64', '2', '1');
INSERT INTO `user_right` VALUES ('65', '2', '1');
INSERT INTO `user_right` VALUES ('66', '3', '5');
INSERT INTO `user_right` VALUES ('67', '3', '6');
INSERT INTO `user_right` VALUES ('68', '3', '7');
INSERT INTO `user_right` VALUES ('69', '3', '8');
INSERT INTO `user_right` VALUES ('70', '1', '1');
INSERT INTO `user_right` VALUES ('71', '1', '1');
INSERT INTO `user_right` VALUES ('72', '1', '1');
INSERT INTO `user_right` VALUES ('73', '1', '1');
INSERT INTO `user_right` VALUES ('74', '1', '5');
INSERT INTO `user_right` VALUES ('75', '1', '13');
