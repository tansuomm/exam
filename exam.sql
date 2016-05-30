/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50711
Source Host           : 127.0.0.1:3309
Source Database       : exam

Target Server Type    : MYSQL
Target Server Version : 50711
File Encoding         : 65001

Date: 2016-05-30 23:02:22
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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

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
INSERT INTO `clerk` VALUES ('21', '1210030401', '123', 'clerk16', '4');
INSERT INTO `clerk` VALUES ('22', '1210030402', '123', 'clerk17', '4');
INSERT INTO `clerk` VALUES ('23', '1210030403', '123', 'clerk18', '4');
INSERT INTO `clerk` VALUES ('24', '1210030404', '123', 'clerk19', '4');
INSERT INTO `clerk` VALUES ('25', '1210030405', '123', 'clerk20', '4');

-- ----------------------------
-- Table structure for clerk_cl
-- ----------------------------
DROP TABLE IF EXISTS `clerk_cl`;
CREATE TABLE `clerk_cl` (
  `cl_clerk_id` int(11) NOT NULL AUTO_INCREMENT,
  `tk_cl_id` int(11) DEFAULT NULL COMMENT '考卷id',
  `OrganID` int(11) DEFAULT NULL COMMENT '考生班级id',
  PRIMARY KEY (`cl_clerk_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of clerk_cl
-- ----------------------------
INSERT INTO `clerk_cl` VALUES ('59', '2', '1');
INSERT INTO `clerk_cl` VALUES ('61', '2', '2');
INSERT INTO `clerk_cl` VALUES ('64', '2', '3');
INSERT INTO `clerk_cl` VALUES ('65', '2', '4');

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
INSERT INTO `clerk_gdks_tm` VALUES ('1', '3', '7', 'ABC', '1');
INSERT INTO `clerk_gdks_tm` VALUES ('19', '5', '7', '66', '1');
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
INSERT INTO `clerk_kscj` VALUES ('7', '1', '2', '2', '2016-05-18 17:40:30', '2016-05-18 17:40:50', '69', '60', '3', '1', '60', 'admin', '<ROOTSTUB global=\"true\" prefix_259=\"6\" mark_259=\"0\" prefix_260=\"6\" mark_260=\"0\" prefix_251=\"b\" mark_251=\"0\" prefix_252=\"a\" mark_252=\"0\" prefix_257=\"ac\" mark_257=\"0\" prefix_258=\"b\" mark_258=\"0\" prefix_253=\"0\" mark_253=\"0\" prefix_254=\"0\" mark_254=\"0\" prefix_255=\"66\" mark_255=\"0\" prefix_256=\"66\" mark_256=\"0\"/>');
INSERT INTO `clerk_kscj` VALUES ('8', '7', '2', '2', '2016-05-18 17:40:30', '2016-05-18 17:40:50', '60', '60', '0', '1', '60', null, '<ROOTSTUB global=\"true\" prefix_259=\"6\" mark_259=\"0\" prefix_260=\"6\" mark_260=\"0\" prefix_251=\"b\" mark_251=\"0\" prefix_252=\"a\" mark_252=\"0\" prefix_257=\"ac\" mark_257=\"0\" prefix_258=\"b\" mark_258=\"0\" prefix_253=\"0\" mark_253=\"0\" prefix_254=\"0\" mark_254=\"0\" prefix_255=\"66\" mark_255=\"0\" prefix_256=\"66\" mark_256=\"0\"/>');
INSERT INTO `clerk_kscj` VALUES ('9', '6', '2', '2', '2016-05-18 17:40:30', '2016-05-18 17:40:50', '60', '60', '0', '1', '60', null, '<ROOTSTUB global=\"true\" prefix_259=\"6\" mark_259=\"0\" prefix_260=\"6\" mark_260=\"0\" prefix_251=\"b\" mark_251=\"0\" prefix_252=\"a\" mark_252=\"0\" prefix_257=\"ac\" mark_257=\"0\" prefix_258=\"b\" mark_258=\"0\" prefix_253=\"0\" mark_253=\"0\" prefix_254=\"0\" mark_254=\"0\" prefix_255=\"66\" mark_255=\"0\" prefix_256=\"66\" mark_256=\"0\"/>');

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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tk
-- ----------------------------
INSERT INTO `tk` VALUES ('2', '数据结构', '2');
INSERT INTO `tk` VALUES ('3', '计算机原理', '2');
INSERT INTO `tk` VALUES ('4', '操作系统', '2');
INSERT INTO `tk` VALUES ('5', '汇编语言', '2');
INSERT INTO `tk` VALUES ('7', '计算机网络', '1');
INSERT INTO `tk` VALUES ('8', '电路分析', '1');
INSERT INTO `tk` VALUES ('17', '单片机技术', '1');
INSERT INTO `tk` VALUES ('18', '通信技术', '1');
INSERT INTO `tk` VALUES ('19', 'C语言程序设计', '4');
INSERT INTO `tk` VALUES ('20', '系统级编程', '4');
INSERT INTO `tk` VALUES ('21', '操作系统', '4');
INSERT INTO `tk` VALUES ('22', '离散数学', '4');
INSERT INTO `tk` VALUES ('23', '数据库', '3');
INSERT INTO `tk` VALUES ('24', 'Java', '3');
INSERT INTO `tk` VALUES ('26', 'UML', '3');
INSERT INTO `tk` VALUES ('27', 'Web', '3');

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
INSERT INTO `tkj` VALUES ('1', '网络');
INSERT INTO `tkj` VALUES ('2', '计科');
INSERT INTO `tkj` VALUES ('3', '信管');
INSERT INTO `tkj` VALUES ('4', '软件');

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
  `tm_name` varchar(2000) DEFAULT NULL COMMENT '题目名称',
  `tm_type` int(11) DEFAULT NULL COMMENT '题目类型1选择题2填空题3多选题4判断题5问答题',
  `tm_score` int(11) DEFAULT NULL COMMENT '题目分数',
  `tm_nd` int(11) DEFAULT NULL COMMENT '题目难度',
  `tm_zsd` varchar(50) DEFAULT NULL COMMENT '题目知识点',
  `tm_xuanxiang` varchar(2000) DEFAULT NULL COMMENT '题目选项',
  `tm_xuanxiang_num` int(11) DEFAULT NULL COMMENT '选项个数',
  `tm_da` varchar(2000) DEFAULT NULL COMMENT '题目答案',
  `tm_create_time` date DEFAULT NULL COMMENT '创建时间',
  `tm_create_name` varchar(50) DEFAULT NULL COMMENT '创建人',
  `tk_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`tm_id`),
  KEY `fk_tk_id` (`tk_id`),
  CONSTRAINT `fk_tk_id` FOREIGN KEY (`tk_id`) REFERENCES `tk` (`tk_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tm
-- ----------------------------
INSERT INTO `tm` VALUES ('3', 'Java属于以下哪种语言？', '1', '2', '1', 'java开发入门', 'A.机器语言;B.汇编语言;C.高级语言;D.以上都不对', '4', 'C', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('4', '下列目录，哪一个是用来存放jdk源码的？', '1', '2', '1', 'java开发入门', 'A.lib目录;B.src目录;C.jre目录;D.include目录', '4', 'B', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('5', '下面命令可以正确执行helloworld实例的是？', '1', '2', '1', 'java开发入门', 'A.java helloworld;B.java helloworld.java;C.javac helloworld;D.javac helloworld.java', '4', 'A', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('7', '关于配置path说法真确的是？', '1', '2', '1', 'java开发入门', 'A.在任意目录可以使用javac和java命令;B.在任意目录下可以使用class文件;C.在任意目录可以使用记事本;D.在任意目录下可以使用扫雷游戏', '4', 'A', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('35', 'java权限标识符哪个只限于本类使用？', '1', '2', '1', 'java开发入门', 'A.public;B.private;C.protected;D.default', '4', 'B', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('36', '下面完全面向对象的编程语言的是', '1', '2', '1', 'java开发入门', 'A.c;B.cobol;C.java;D.fortran', '4', 'C', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('37', '关于jdk、jvm、jre说法真确的是？', '1', '2', '2', 'java开发入门', 'A.jdk中包含了jre，jvm中包含了jre;B.jre中包含了jdk，jdk中包含了jvm;C.jre中包含了jdk，jvm中包含了jre;D.jdk中包含了jre，jre中包含了jvm', '4', 'D', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('38', '声明为final的方法不能在子类中重载。', '4', '2', '1', 'java基础', '', '0', '对', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('39', '抽象方法只能存在于抽象类中。', '4', '2', '1', 'java基础', '', '0', '对', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('40', '接口中所有方法均为抽象方法。', '4', '2', '2', 'java基础', '', '0', '对', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('41', 'Java小程序（Applet）的主类的父类必须是类Applet。', '4', '2', '2', 'java基础', '', '0', '对', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('42', ' 在父类中声明为 final 的方法，也可以在其子类中被重新定义(覆盖)。', '4', '2', '1', 'java基础', '', '0', '错', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('43', '在Java中，异常(Exception)是指程序在编译和运行进出现的错误。', '4', '2', '2', 'java中级', '', '0', '错', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('44', 'Java中所有的类都是java.lang的子类。', '4', '2', '2', 'java基础', '', '0', '错', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('47', ' java中一个子类可以有多个父类，并可以为一个（父）类定义多个子类。', '4', '2', '1', 'java基础', '', '0', '错', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('48', '子类的成员变量能与其父类的成员变量同名', '4', '2', '2', 'java基础', '', '0', '对', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('49', '下面正确声明一个一维数组的是?', '3', '2', '2', 'java数组', 'A.String [] a ;B.String a[];C.char a[][] ;D.tring a[10]', '4', 'AB', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('50', '下面关于Java语言中实例方法和类方法的说法，哪几项是对的？', '3', '2', '2', 'java运算符使用', 'A.实例方法可以直接通过类名调用;B.类方法可以直接通过类名调用;\r\nC.实例方法可以操作实例变量也可以操作类变量;D.类方法可以操作实例变量也可以操作类变量', '4', 'BC', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('51', '浏览器禁止Applet执行下列哪些操作？', '3', '2', '3', 'Java Applet', 'A.在运行时调用其它程序;B.文件读写操作;\r\nC.装载动态连接库和调用任何本地方法;\r\nD.试图打开一个socket进行网络通信,但是所连接的主机并不是提供Applet的主机', '4', 'ABCD', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('52', '下面关于布局管理器说法正确的是?', '3', '2', '3', 'Java 常用的布局策略及主要容器组件', 'A.布局管理器用来管理组件放置在容器中的位置和大小;\r\nB.每个容器都有一个布局管理器;\r\nC.使用布局管理器可以使JAVA生成的图形用户界面具有平台无关性;\r\nD.布局管理器LayoutManager本身是一个接口，通常使用的是实现了该接口的类', '4', 'ABCD', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('53', '下面哪些说法是正确的？', '3', '2', '3', 'JAVA虚拟机、特点及JAVA运行系统', 'A.java语言是真正的面向对象的语言，任何代码都是类的一部分;\r\nB.运行java程序必须需要java运行环境的支持，例如需要java虚拟机JVM;\r\nC.使用Visual J++在windows下开发的所有java程序可以不加修改的在Unix下运行，这是java程序“一次编写，到处运行”的特点决定的;\r\nD.java语言的类加载器可以实现从互联网上加载java程序', '4', 'BCD', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('54', '下面关于继承的叙述哪些是正确的？', '3', '2', '2', 'java中级', 'A.在java中只允许单一继承;B.在java中一个类只能实现一个接口; C.在java中一个类不能同时继承一个类和实现一个接口;D.java的单一继承使代码更可靠', '4', 'AD', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('55', 'public static void main方法的参数描述是?', '3', '2', '2', 'Java Application程序', 'A.String args[];B.String[] args;C.Strings args[]z;D.String args', '4', 'AB', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('56', '面向对象程序设计的三个特征是___、___、___。', '2', '2', '1', 'java基础', '', '0', '封装；继承；多态', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('57', 'Java语言的主要特点有 简单性\r\n、安全性、面向对象、___。', '2', '2', '2', 'java基础', '', '0', '平台无关性', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('58', '___是Java程序中基本的结构单位。', '2', '2', '1', 'java基础', '', '0', '类', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('59', ' Java语言是一种完全的___程序设计语言。', '2', '2', '1', 'java基础', '', '0', '面向对象', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('60', 'this指当前对象，super指___。', '2', '2', '1', 'java基础', '', '0', '父对象', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('61', 'Java的类型、单精度浮点型、布尔型数据的保留字分别是：float、___。', '2', '2', '1', 'java基础', '', '0', 'boolean', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('62', '在Java中，能实现多重继承效果的方式是___。', '2', '2', '2', 'java基础', '', '0', '实现多个接口', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('63', 'Java提供了三个日期类：Date、Calendar和___。', '2', '2', '1', 'java中级', '', '0', 'DataFormat', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('64', '&和&&的区别？', '5', '5', '3', 'java 运算符', '', '0', '&是位运算符，表示按位与运算，&&是逻辑运算符，表示逻辑与（and）', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('65', 'Collection 和 Collections的区别？', '5', '5', '3', 'java高级 ', '', '0', 'Collection是集合类的上级接口，继承与他的接口主要有Set 和List.Collections是针对集合类的一个帮助类，他提供一系列静态方法实现对各种集合的搜索、排序、线程安全化等操作', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('66', 'Math.round(11.5)等於多少? Math.round(-11.5)等於多少', '5', '5', '2', 'javaApi', '', '0', 'Math.round(11.5)==12;Math.round(-11.5)==-11;round方法返回与参数最接近的长整数，参数加1/2后求其floor', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('67', 'Java有没有goto', '5', '5', '2', 'java语法', '', '0', 'java中的保留字，现在没有在java中使用', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('68', '数组有没有length()这个方法? String有没有length()这个方法', '5', '5', '2', 'java中级', ' ', '0', '数组没有length()这个方法，有length的属性。String有length()这个方法', '2016-05-30', '题库管理员', '24');
INSERT INTO `tm` VALUES ('69', '在Access数据库中，一个关系就是一个？ ', '1', '2', '1', 'access', 'A.二维表;B.记录;C.字段;D.数据库综合数据', '4', 'A', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('70', '设有部门和员工两个实体，每个员工只能属于一个部门，一个部门可以有多名员工，则部门与员工实体之间的联系类型是?', '1', '2', '1', '数据表结构', 'A.多对多;B.一对多;C.多对一;D.一对一', '4', 'B', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('71', '将表A的记录复制到表B中，且不删除表B中的记录，可以使用的查询是?', '1', '2', '2', 'DML', 'A.删除查询;B.生成表查询;C.追加查询;D.交叉表查询', '4', 'C', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('72', 'SQL的功能包括?', '1', '2', '2', 'sql基础', 'A.查找、编辑错误、控制、操纵;B.数据定义创建数据表、查询、操纵添加删除修改、控制加密授权;\r\nC.窗体X、视图、查询X、页X;D.控制、查询X、删除、增加X ', '4', 'B', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('73', '在课程表中要查找课程名称中包含“计算机”的课程，对应“课程名称”字段的条件表达式是？', '1', '2', '2', 'sql语法', 'A.\"计算机\";B.\"*计算机*\";\r\nC.Like\"*计算机*\";D.Like\"计算机\"', '4', 'C', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('74', '在 SQL 语句中，检索要去掉重复组的所有元组，则在 SELECT 中使用？', '1', '2', '1', 'sql语法', 'A.All;B.UNION;C.LIKE;D.DISTINCT', '4', 'D', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('75', '下列关于模式的叙述中，哪些是正确的？ ', '3', '2', '2', '数据库模式', 'A.模式也称为逻辑模式;\r\nB.模式实际上是数据库数据的逻辑视图;\r\nC.一个数据库可以有多个模式;\r\nD.逻辑模式的基础是数据模型', '4', 'ABD', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('76', '下列关于实体完整性约束的叙述中，哪些是正确的？', '3', '2', '2', '数据库约束', 'A.实体完整性约束是一种关系模型完整性约束;B.实体完整性约束是对关系中主码属性值的约束;C.若属性A是关系R的主码属性，则属性A不能取空值;D.关系可以没有主码，只要有主码，则主码的值唯一', '4', 'ABC', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('77', '下列哪些不是SQL预定义数据类型？', '3', '2', '2', 'sql语法', 'A.整数类型\r\n;B.字符串类型\r\n;C.构造数据类型;\r\nD.对象类型', '4', 'CD', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('78', '下列关于数据库物理结构设计的叙述中，哪些是正确的？\r\n', '3', '2', '3', '数句酷设计', 'A.数据库物理结构设计包括存储记录的格式设计、存储方法设计、存取方法设计等;B.规范化理论对于数据库物理结构设计有重要的指导意义;C.记录的聚簇存放是指将不同类型的记录存放到相同的物理区域中;D.同一个关系中的记录不能存放到不同的物理区域中', '4', 'AC', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('79', 'SQL语言中，下列哪些对象是用DDL中的CREATE语句定义的？', '3', '2', '2', 'DDL', 'A.模式;B.基本表;C.访问权限;D.视图', '4', 'ABD', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('80', '在关系数据库中，唯一标识表中每条记录的字段称为___。', '2', '2', '2', '数据库基础', '', '0', '关键字/键', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('81', '窗体中的数据来源主要包括表和 ___。', '2', '2', '1', '数据库基础', '', '0', '查询', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('82', '函数Now()返回值的含义是___。  ', '2', '2', '2', '单行函数', '', '0', '系统当前日期和时间 ', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('83', '若干同类实体的集合称为___。', '2', '2', '2', '数据库基础', '', '0', '实体集', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('84', '对金额类数据应当采用的数据类型为___。', '2', '2', '2', '数据类型', '', '0', '货币型/Money', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('85', '设置了表的主键，同时也就创建了表的___。', '2', '2', '2', '数据库基础', '', '0', '索引', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('86', '在关系数据模型中，实体与实体之间的联系统一用二维表表示。', '4', '2', '2', '数据库基础', '', '0', '对', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('87', '同一个关系模型中可以出现值完全相同的两个元组。', '4', '2', '2', '数据库基础', '', '0', '错', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('88', '投影操作是对表进行水平方向的分割。', '4', '2', '2', '数据库基础', '', '0', '错', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('89', '关系模型中有三类完整性约束，并且关系模型必须满足这三类完整性约束条件。', '4', '2', '2', '数据库模型', '', '0', '错', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('90', '数据表的复制既可以在不同数据库间复制，也可以在同一个数据库下复制。', '4', '2', '2', '数据表', '', '0', '对', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('91', '“SQL”视图用来显示与“设计”视图等效的SQL语句。', '4', '2', '3', '数据库视图', '', '0', '对', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('92', '可以用UNION将两个查询结果合并为一个查询结果。', '4', '2', '2', '数据库关键字', '', '0', '对', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('93', '当用SELECT进行查询时，结果可以是字段值，也可以是统计值。', '4', '2', '2', 'DML', '', '0', '对', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('94', '简述数据库逻辑设计阶段的主要步骤。', '5', '5', '3', '数据库设计', '', '0', '把概念模型转换成逻辑模型；2、设计外模型；3、设计应用程序与数据库接口；4、评价模型；5、修正模型。', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('95', '简述存储过程的优点。', '5', '5', '2', '存储过程', '', '0', '提供了安全机制，改进了执行能力，减少了网络流量和增强了代码的重用性', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('96', 'SQL的视图机制有哪些优点?', '5', '5', '3', '视图', '', '0', '数据安全性、逻辑独立性和操作简便性', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('97', '如果关系模式R的候选键由全部属性组成，那么R是否属于3NF？说明理由。', '5', '5', '4', '范式设计', '', '0', '3NF的定义： 在关系模式R中，不存在任何的非主属性对主键的部分函数依赖和传递函数依赖。 \r\n因为R关系中所有的属性构成候选键，则不存在非主属性，所以该关系R属于3NF.', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('98', '修改数据库权限的模式有哪几种？', '5', '5', '3', '数据库权限', '', '0', '索引权限、资源权限、修改权限、撤销权限。', '2016-05-30', '题库管理员', '23');
INSERT INTO `tm` VALUES ('99', '哪个不是UML 体系的组成部分。', '1', '2', '3', 'UML体系', 'A.应用领域;B.架构规则;C.构造块;D.公共 机制', '4', 'A', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('100', '在UML 中，有四种事物，下面哪个不是?', '1', '2', '2', 'UML事物', 'A.结构事物;B.静态事物;C.分组事物;D.注释事物', '4', 'B', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('101', '下面哪项属于UML 中的动态视图？', '1', '2', '2', 'UML图', 'A.类图;B.用例图;C.对象图;D.状态图', '4', 'D', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('102', '在UML 中，哪项把活动图中的活动划分为若干组，并将划分的组指定给对 象，这些对象必须履行该组所包括的活动，它能够明确地表示哪些活动是由 哪些对象完成的。', '1', '2', '2', 'UML图', 'A.泳道;B.同步条;C.活动;D.组合活动', '4', 'A', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('103', '用例之间有几种不同的关系，下列哪个不是他们之间可能的关系?', '1', '2', '2', 'UML用例图', 'A.include;B.connect;C.generalization;D.Extend', '4', 'B', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('104', 'UML 中，用例图展示了外部Actor 与系统所提供的用例之间的连接，UML 中的 外部Actor 是指?', '1', '2', '2', 'UML用例图', 'A.人员;B.单位;C.人员和单位;D.人员或外部系统', '4', 'D', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('105', '下面哪个不是UML 的关系？', '1', '2', '2', 'UML图', 'A.依赖关系;B.关联关系;C.继承关系;D.泛化关系', '4', 'C', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('106', 'UML 的什么模型图由类图、对象图、包图、构件图和配置图组成。 ', '1', '2', '2', 'UML图', 'A.用例;B.静态;C.动态;D.系统', '4', 'B', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('107', '在UML中，以下哪些是可以应用于包的构造型？', '3', '2', '2', 'UML包图', 'A.公开（public）;B.包内公开（package）;C.保护（protected）;D.私有（private）', '4', 'ABCD', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('108', '两个类之间的关联表示他们之间存在一种不适于继承的逻辑关系。在关联关系的表示图元的两端，以下哪些可以表示参与关联的特性。 \r\n', '3', '2', '2', 'UML关联', 'A.约束;B.可见性;C.角色名;D.多重性', '4', 'ABCD', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('109', ' 4. 用例之间的关系主要有？', '3', '2', '2', 'UML用例图', 'A.包含;B.继承;C.扩展;D.聚合', '4', 'ABC', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('110', '用例图的节点包括？\r\n ', '3', '2', '2', 'UML用例图', 'A.用例;B.边界;C.关联;D.执行者', '4', 'ABD', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('111', '在采用用例模型捕获需求时，需要执行如下哪些操作？ \r\n', '3', '2', '3', 'UML用例图', 'A.描述非功能需求;B.用例建模;C.识别用例;D.识别参与者', '4', 'ABCD', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('112', '下列属于状态的组成部分的有？', '3', '2', '2', 'UML状态图', ' A.名称;B.转移;C.条件;D.事件', '4', 'AB', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('113', '状态图包括？ \r\n', '3', '2', '2', 'UML状态图', 'A.类的状态;B.状态之间的转换;C.类执行的动作;D.触发类的动作的事件', '4', 'ABCD', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('114', '系统功能常变，但对象相对稳定。', '4', '2', '1', 'UML基础', '', '0', '对', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('115', '用户必须在系统开发的各个阶段参与开发。', '4', '2', '2', 'UML', '', '0', '对', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('116', 'UML是一种可视化的建模语言。', '4', '2', '1', 'UMl基础', '', '0', '对', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('117', '状态图和活动图都属于行为图。', '4', '2', '2', 'UML图', '', '0', '对', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('118', '系统维护工作的对象是源程序代码。', '4', '2', '2', 'UML', '', '0', '错', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('119', '协作图中的消息必须要标出消息顺序号。', '4', '2', '2', 'UML协作图', '', '0', '对', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('120', '参与者（actor）和用例（use case）之间的关系是关联（association）关系。', '4', '2', '2', 'UMl用例图', '', '0', '对', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('121', '在协作图中通过___表示出消息的时间顺序。', '2', '2', '2', 'UML协作图', '', '0', '消息编号', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('122', '领域模型是一组表示真实世界的___，不是软件部件的模型。', '2', '2', '3', 'UML', '选择题格式如:A.1;B.2;C.3;D.4', '4', '概念类', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('123', '___技术是将一个活动图中的活动状态进行分组，每一组表示一个特定的类、人或部门，他们负责完成组内的活动。', '2', '2', '2', 'UML活动图', '', '0', '泳道', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('124', '对反应型对象建模一般使用___图。', '2', '2', '2', 'UML状态图', '', '0', '状态', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('125', '类通常可以分为实体类，___和边界类。', '2', '2', '2', 'UML类图', '', '0', '控制类', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('126', '顺序图由类角色，生命线，激活期和___组成。', '2', '2', '1', 'UML顺序图', '', '0', '消息', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('127', '软件开发生命期？', '5', '5', '3', 'UML', '', '0', '软件开发生命期是指软件产品从考虑其概念开始，到该产品交付使用为止的整个时期。\r\n一般包括概念阶段，需求阶段，设计阶段，实现阶段，测试阶段，安装阶段及交付阶段。这些阶段可以有重复，执行时也可以有迭代。', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('128', '标准建模语言UML的重要内容可以由哪五类图(共9种图形)来定义？', '5', '5', '3', 'UML图', '', '0', '用例图、静态图(包括类图、对象图和包图)、行为图、交互图和实现图。', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('129', '简述面向对象分析方法（OOA）的5个基本步骤？', '5', '5', '3', 'UML建模', '', '0', '1） 识别对象，识别对象包括标识潜在的对象和筛选对象。 （2） 识别对象的属性。 （3） 识别对象的行为。 （4） 识别对象所属的类。 （5） 定义主题词。', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('130', '简述时序图的建模步骤？', '5', '5', '3', 'UML时序图', '', '0', '1） 设置交互语境。 （2） 确定对象。 \r\n（3） 分析消息和条件。 （4） 分析附加约束。 \r\n（5） 对建模结果精华和细化。', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('131', 'UML2.0中共有13种图，名称分别是什么？', '5', '5', '4', 'UML图', '', '0', '用例图、类图、对象图、顺序图、通信图、活动图、状态机图、组件图、部署图、包图、复合结构图、交互概观图、定时图', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('132', '组件图包含哪三种元素？', '5', '5', '1', 'UML组件图', '', '0', '（1） 组件 （2） 接口 （3） 依赖关系', '2016-05-30', '题库管理员', '26');
INSERT INTO `tm` VALUES ('133', '在J2EE中，<%=”2”+4%>将输出？', '1', '2', '1', 'j2ee', 'A. 2+4;B.6 ;C.  24;D. 不会输出，因为表达式是错误的 ', '4', 'C', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('134', 'J2EE中，JSP表达式语言的语法是?', '1', '2', '2', 'j2ee', 'A.{EL  expression};B.${EL  expression};C.@{EL  expression};D.&{EL  expression} ', '4', 'B', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('135', ' 在J2EE中，下列哪项语句可以获取页面请求中的一个文本框的输入（文本框的名字为\r\ntitle）。', '1', '2', '2', 'j2ee', 'A.response.getParameter(“title”);B.request.getAttribute(“title”);C.requert.getParameter(“title”);D.requert.getParameters(“title”)', '4', 'C', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('136', 'J2EE中，HttpSession接口位于哪个包中。', '1', '2', '2', 'j2ee', 'A.javax.servlet;B.javax.servlet.http;C.javax.servlet.http.session;D.javax.servlet.session', '4', 'B', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('137', '在J2EE MVC设计模式体系结构中，哪项是实现控制器的首选方案。', '1', '2', '1', 'j2ee', 'A.JavaBean;B.Servlet;C.JSP;D.HTML', '4', 'B', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('138', 'Tomcat对整个服务器软件进行配置的文件是___。', '2', '2', '1', '中间件', '', '0', 'server.xml', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('139', '要上传文件的HTML页面必须要有的标签是___。', '2', '2', '1', 'html', '', '0', 'FORM', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('140', '.JSP页面上能够在整个web应用范围内共享的隐含对象是application 其类型为___。', '2', '2', '2', 'jsp', '', '0', 'ServletContext', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('141', 'JSP页面上对页面进行全局配置的指令是___。', '2', '2', '1', 'jsp', '', '0', 'page', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('142', 'jsp引入自定义标签的指令是___。', '2', '2', '1', 'jsp', '', '0', 'tablib', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('143', '13下列关于HTML的说法中，不正确的是？\r\n', '3', '2', '2', 'html', 'A.编制HTML文件时不需要加入任何标记(tag);B.HTML网页的核心，是一种超文本标记的程序设计语言;C.HTML是网页的核心，是一种超文本标记的页面描述语言;D.通过网页浏览器阅读HTML文件时，Web服务器负责解释插入到HTML文本中的各种标记', '4', 'ABD ', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('144', '哪项不属于Web的工作模式是(　　)。\r\n', '3', '2', '1', 'web基础', 'A.客户机/服务器;B.浏览器/服务器;C.浏览器/浏览器;D.浏览器/客户机\r\n', '4', 'ACD', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('145', '哪项不属于PHP 中采用的模板技术是？\r\n\r\n', '3', '2', '2', 'php', 'A.Smarty;B.Smart;C.Templet;D.Cache', '4', 'BCD', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('146', '1在HTTP协议的“请求/响应”交互模型中，以下说法中正确的是？\r\n', '3', '2', '1', 'http', 'A.客户机在发送请求之前需要主动与服务器建立连接;B.服务器无法主动向客户机发起连接;C.服务器无法主动向客户机发送数据;D.以上都错', '4', 'ABC', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('147', 'HTML源程序文件必须使用 html或者htm作为扩展名。', '4', '2', '1', 'html', '', '0', '对', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('149', 'JavaScript中用var声明变量。', '4', '2', '1', 'js', '', '0', '对', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('150', 'JavaScript窗口对象是document。', '4', '2', '1', 'js', '', '0', '错', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('151', '当客户端请求HttpServlet时，服务器端将接收两个类的对象，一个是HttpServletRequest，另一个是HttpServletResponse。', '4', '2', '1', 'http', '', '0', '对', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('152', 'JavaScript中应用checkbox的checked 属性来设置复选框是否被勾选。', '4', '2', '1', 'js', '', '0', '对', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('153', 'css和div 开发的优势？', '5', '5', '2', 'web前端', '', '0', '显示和内容实现分离 。有利于搜索引擎搜索引擎搜索。有利于维护和程序的扩展', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('154', 'hidden表单域有什么作用？', '5', '5', '2', 'html', '', '0', '多个表单的区分 ,多个提交按钮', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('155', 'application有什么作用。 \r\n', '5', '5', '1', 'jsp', '', '0', '保存的一些全局性的对象信息', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('156', 'java servlet api中forward() 与redirect()的区别？', '5', '5', '2', 'jsp', '', '0', '1. forward客户端请求服务器一次，redirect请求服务器两次，所以forward方式可以获得\r\nrequest作用域的信息，而redirect方式不能获得。 \r\n2. forward由request对象发出，而redirect由response对象发起 \r\n3. redirect()可以跨越不同的工程之间。而forward()只能在一个工程中使用', '2016-05-30', '题库管理员', '27');
INSERT INTO `tm` VALUES ('157', 'socket是什么，它有什么作用？ \r\n', '5', '5', '2', 'http', '', '0', 'Socket是通讯的端点，是客户端和服务器进行通讯的端点 ', '2016-05-30', '题库管理员', '27');

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
INSERT INTO `user_right` VALUES ('73', '1', '1');
INSERT INTO `user_right` VALUES ('74', '1', '5');
INSERT INTO `user_right` VALUES ('75', '1', '13');
