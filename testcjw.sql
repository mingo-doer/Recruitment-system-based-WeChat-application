/*
 Navicat MySQL Data Transfer

 Source Server         : localhost_3306
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : testcjw

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 09/01/2018 20:56:02
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for company
-- ----------------------------
DROP TABLE IF EXISTS `company`;
CREATE TABLE `company`  (
  `OpenID` varchar(255) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  `CompanyID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CompanyName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `PositionID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '职位',
  `ContacterName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '联系人',
  `ContactPhone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL COMMENT '联系人电话',
  `CompanyLocation` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '公司地址',
  `CompanyIntro` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CompanyType` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CompanyScale` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CompanyService` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Welfare` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CompanyImage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`OpenID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of company
-- ----------------------------
INSERT INTO `company` VALUES ('abc12', 'cy1', '中国移动', 'p1', '杨帅', '1388888888', '温州鹿城', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `company` VALUES ('abc13', 'cy2', '中国联通', 'p2', '张三', '1588888888', '温州瓯海', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `company` VALUES ('abc23', 'cy3', '温州律所', 'p3', '李四', '1366666666', '北京', NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for introduceme
-- ----------------------------
DROP TABLE IF EXISTS `introduceme`;
CREATE TABLE `introduceme`  (
  `IntroduceID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OpenID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Degree` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ContactPhone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Political_Outlook` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Graduate_University` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `City` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Major` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `E_mail` varchar(255) CHARACTER SET ujis COLLATE ujis_japanese_ci DEFAULT NULL,
  `Honour` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Duties` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Social_Experience` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Certificate` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Hope_Career` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Self_evaluate` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`IntroduceID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for joinor
-- ----------------------------
DROP TABLE IF EXISTS `joinor`;
CREATE TABLE `joinor`  (
  `OpenID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `OrganizationID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message`  (
  `SendID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `Title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `MessageID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `MessageText` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Time` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`SendID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for organization
-- ----------------------------
DROP TABLE IF EXISTS `organization`;
CREATE TABLE `organization`  (
  `OpenID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OrganizationID` int(255) DEFAULT NULL,
  `OrganizationName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OrganizationLeader` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OrganizationPhone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `ActivityTime` datetime(6) DEFAULT NULL,
  `ActivityTest` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Sign` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '签到',
  PRIMARY KEY (`OpenID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for position
-- ----------------------------
DROP TABLE IF EXISTS `position`;
CREATE TABLE `position`  (
  `PositionID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `PositionName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Category_1` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Category_2` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Category_3` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `CompanyID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `PositionIntro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Salary` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Content` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Location` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Education` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `WorkExperience` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Contacter` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Time` datetime(6) DEFAULT NULL,
  `ContacterPhone` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Count` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`PositionID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of position
-- ----------------------------
INSERT INTO `position` VALUES ('p1', '游戏开发', '网络|通信|电子', '计算机|互联网|通信', '技术总监|经理', 'cy1', '要求', '8K-12K', '动漫设计、艺术设计等专业。\r\n了解3D、MAYA、photoshop等软件的优先考虑。\r\n热爱游戏动漫模型制作，有创造力，熟悉场景、角色制作流程，有无经验均可。\r\n有责任心，善于沟通，有团队合作精神；\r\n也可接收无基础，想要从事或热爱游戏动漫制作工作者。（公司可提供岗前实训）\r\n福利薪资：\r\n公司为培养和挖掘优秀的游戏动漫行业人才，特为员工提供优厚的待遇和发展平台，入职新员工薪资待遇在3500-5000之间。公司每年都会组织外出旅游、提供食宿、五险一金、年终奖、餐补等。', '鹿城区', '学历不限', '三年工作经验', '杨帅', '2018-01-03 13:39:46.000000', '18888888888', '3');
INSERT INTO `position` VALUES ('p2', '定向培养java实训生', '网络|通信|电子', '计算机|互联网|通信', '软件工程师', 'cy2', '要求', '5K-8K', '岗位职责:\r\n一、有足够项目经验者面试通过即可入职\r\n二、经验不足者需参加公司新员工入职前岗前实习：\r\n限量软件工程师实习生任职要求：\r\n1、对软件开发有足够的兴趣，非常想从事这个高薪行业\r\n2、中专、高中及以上学历，男女不限，\r\n3、年龄：18～30周岁，无重大传染疾病\r\n4、应、往届生不限，理科生优先，有点计算机程序语言基础的优先，喜欢玩网站和程序代码的优先。\r\n5、可跨行业，跨专业，跨学科，0基础者均可。\r\n6、实习周期：2-4个月\r\n7、实习地点：北京中关村软件园', '北京海淀区中关村软件园5号楼汉王大厦', '大专', '经验不限,可接收应届生', '张三', '2018-01-09 16:39:54.000000', '13888888888', '5');
INSERT INTO `position` VALUES ('p3', '高薪律师月薪2W全险双休带薪培训', '法律|教育|翻译|出版', '法律', '律师|法律顾问', 'cy3', '要求', '20K-25K', '入职待遇:\r\n初级交易员:底薪6000+补助+盈利20%提成+年终奖金实际月薪2万以上\r\n中级交易员:底薪12000+补助+盈利30%提成+年终奖金+五险一金实际月薪4万以上\r\n高级交易员:底薪18000+补助+盈利40%提成+年终奖金+五险一金实际月薪6万以上\r\n1、热爱交易、对金融经济知识感兴趣,对金融市场有浓厚的兴趣，立志在金融领域长期发展并有一翻建树的有志之士。\r\n2、具有良好的学习能力与团队精神，果断、自信、接受新鲜事物能力强。\r\n3、敢于挑战自我，勇于凭自己的努力和本领获得高收益。\r\n4、无论你之前从事什么行业、学历如何，在这个行业里只要你敢于挑战自我，勇于探索并发现自己的潜力，高收益不是梦想。\r\n5、理想的工作环境且公司内部气氛融洽，有灵活的晋升体系和广阔的前景。\r\n6、提供免费的专业岗前培训，为您提供绝佳的职业发展机会。\r\n打造同行业最高薪资，福利。', '北京市朝阳区国贸建外SOHO东区A座29层', '本科', '10年以上,可接收应届生', '李四', '2018-01-04 16:45:43.000000', '13666666666', '1');

-- ----------------------------
-- Table structure for readmessage
-- ----------------------------
DROP TABLE IF EXISTS `readmessage`;
CREATE TABLE `readmessage`  (
  `OpenID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `ReadImage` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `MessageID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `ReadTime` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`OpenID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for recommend
-- ----------------------------
DROP TABLE IF EXISTS `recommend`;
CREATE TABLE `recommend`  (
  `PositionID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `OpenID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`PositionID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `OpenID` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `UserName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserImage` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL COMMENT '存储图片路径',
  `UserHobby` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `UserSubject` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `OrganizationID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `CompanyID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `Sex` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `Session_Key` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `3rd_Session_Key` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `IntroduceID` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`OpenID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Compact;

SET FOREIGN_KEY_CHECKS = 1;
