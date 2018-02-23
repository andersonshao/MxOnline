/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50721
Source Host           : localhost:3306
Source Database       : mxonline

Target Server Type    : MYSQL
Target Server Version : 50721
File Encoding         : 65001

Date: 2018-02-23 18:16:44
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for auth_group
-- ----------------------------
DROP TABLE IF EXISTS `auth_group`;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group
-- ----------------------------
INSERT INTO `auth_group` VALUES ('1', '编辑部');

-- ----------------------------
-- Table structure for auth_group_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_group_permissions`;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_group_permissi_permission_id_84c5c92e_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_group_permissions
-- ----------------------------
INSERT INTO `auth_group_permissions` VALUES ('5', '1', '28');
INSERT INTO `auth_group_permissions` VALUES ('6', '1', '29');
INSERT INTO `auth_group_permissions` VALUES ('2', '1', '37');
INSERT INTO `auth_group_permissions` VALUES ('3', '1', '38');
INSERT INTO `auth_group_permissions` VALUES ('1', '1', '68');
INSERT INTO `auth_group_permissions` VALUES ('4', '1', '69');

-- ----------------------------
-- Table structure for auth_permission
-- ----------------------------
DROP TABLE IF EXISTS `auth_permission`;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permissi_content_type_id_2f476e4b_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_permission
-- ----------------------------
INSERT INTO `auth_permission` VALUES ('1', 'Can add log entry', '1', 'add_logentry');
INSERT INTO `auth_permission` VALUES ('2', 'Can change log entry', '1', 'change_logentry');
INSERT INTO `auth_permission` VALUES ('3', 'Can delete log entry', '1', 'delete_logentry');
INSERT INTO `auth_permission` VALUES ('4', 'Can add permission', '2', 'add_permission');
INSERT INTO `auth_permission` VALUES ('5', 'Can change permission', '2', 'change_permission');
INSERT INTO `auth_permission` VALUES ('6', 'Can delete permission', '2', 'delete_permission');
INSERT INTO `auth_permission` VALUES ('7', 'Can add group', '3', 'add_group');
INSERT INTO `auth_permission` VALUES ('8', 'Can change group', '3', 'change_group');
INSERT INTO `auth_permission` VALUES ('9', 'Can delete group', '3', 'delete_group');
INSERT INTO `auth_permission` VALUES ('13', 'Can add content type', '5', 'add_contenttype');
INSERT INTO `auth_permission` VALUES ('14', 'Can change content type', '5', 'change_contenttype');
INSERT INTO `auth_permission` VALUES ('15', 'Can delete content type', '5', 'delete_contenttype');
INSERT INTO `auth_permission` VALUES ('16', 'Can add session', '6', 'add_session');
INSERT INTO `auth_permission` VALUES ('17', 'Can change session', '6', 'change_session');
INSERT INTO `auth_permission` VALUES ('18', 'Can delete session', '6', 'delete_session');
INSERT INTO `auth_permission` VALUES ('19', 'Can add 用户信息', '7', 'add_userprofile');
INSERT INTO `auth_permission` VALUES ('20', 'Can change 用户信息', '7', 'change_userprofile');
INSERT INTO `auth_permission` VALUES ('21', 'Can delete 用户信息', '7', 'delete_userprofile');
INSERT INTO `auth_permission` VALUES ('22', 'Can add 邮箱验证码', '8', 'add_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('23', 'Can change 邮箱验证码', '8', 'change_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('24', 'Can delete 邮箱验证码', '8', 'delete_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('25', 'Can add 轮播图', '9', 'add_banner');
INSERT INTO `auth_permission` VALUES ('26', 'Can change 轮播图', '9', 'change_banner');
INSERT INTO `auth_permission` VALUES ('27', 'Can delete 轮播图', '9', 'delete_banner');
INSERT INTO `auth_permission` VALUES ('28', 'Can add 课程', '10', 'add_course');
INSERT INTO `auth_permission` VALUES ('29', 'Can change 课程', '10', 'change_course');
INSERT INTO `auth_permission` VALUES ('30', 'Can delete 课程', '10', 'delete_course');
INSERT INTO `auth_permission` VALUES ('31', 'Can add 章节', '11', 'add_lesson');
INSERT INTO `auth_permission` VALUES ('32', 'Can change 章节', '11', 'change_lesson');
INSERT INTO `auth_permission` VALUES ('33', 'Can delete 章节', '11', 'delete_lesson');
INSERT INTO `auth_permission` VALUES ('34', 'Can add 视频', '12', 'add_video');
INSERT INTO `auth_permission` VALUES ('35', 'Can change 视频', '12', 'change_video');
INSERT INTO `auth_permission` VALUES ('36', 'Can delete 视频', '12', 'delete_video');
INSERT INTO `auth_permission` VALUES ('37', 'Can add 课程资源', '13', 'add_courseresource');
INSERT INTO `auth_permission` VALUES ('38', 'Can change 课程资源', '13', 'change_courseresource');
INSERT INTO `auth_permission` VALUES ('39', 'Can delete 课程资源', '13', 'delete_courseresource');
INSERT INTO `auth_permission` VALUES ('40', 'Can add 城市', '14', 'add_citydict');
INSERT INTO `auth_permission` VALUES ('41', 'Can change 城市', '14', 'change_citydict');
INSERT INTO `auth_permission` VALUES ('42', 'Can delete 城市', '14', 'delete_citydict');
INSERT INTO `auth_permission` VALUES ('43', 'Can add 机构', '15', 'add_courseorg');
INSERT INTO `auth_permission` VALUES ('44', 'Can change 机构', '15', 'change_courseorg');
INSERT INTO `auth_permission` VALUES ('45', 'Can delete 机构', '15', 'delete_courseorg');
INSERT INTO `auth_permission` VALUES ('46', 'Can add 教师', '16', 'add_teacher');
INSERT INTO `auth_permission` VALUES ('47', 'Can change 教师', '16', 'change_teacher');
INSERT INTO `auth_permission` VALUES ('48', 'Can delete 教师', '16', 'delete_teacher');
INSERT INTO `auth_permission` VALUES ('49', 'Can add 用户咨询', '17', 'add_userask');
INSERT INTO `auth_permission` VALUES ('50', 'Can change 用户咨询', '17', 'change_userask');
INSERT INTO `auth_permission` VALUES ('51', 'Can delete 用户咨询', '17', 'delete_userask');
INSERT INTO `auth_permission` VALUES ('52', 'Can add 用户评论', '18', 'add_coursecomments');
INSERT INTO `auth_permission` VALUES ('53', 'Can change 用户评论', '18', 'change_coursecomments');
INSERT INTO `auth_permission` VALUES ('54', 'Can delete 用户评论', '18', 'delete_coursecomments');
INSERT INTO `auth_permission` VALUES ('55', 'Can add 用户收藏', '19', 'add_userfavorite');
INSERT INTO `auth_permission` VALUES ('56', 'Can change 用户收藏', '19', 'change_userfavorite');
INSERT INTO `auth_permission` VALUES ('57', 'Can delete 用户收藏', '19', 'delete_userfavorite');
INSERT INTO `auth_permission` VALUES ('58', 'Can add 用户消息', '20', 'add_usermessage');
INSERT INTO `auth_permission` VALUES ('59', 'Can change 用户消息', '20', 'change_usermessage');
INSERT INTO `auth_permission` VALUES ('60', 'Can delete 用户消息', '20', 'delete_usermessage');
INSERT INTO `auth_permission` VALUES ('61', 'Can add 用户课程', '21', 'add_usercourse');
INSERT INTO `auth_permission` VALUES ('62', 'Can change 用户课程', '21', 'change_usercourse');
INSERT INTO `auth_permission` VALUES ('63', 'Can delete 用户课程', '21', 'delete_usercourse');
INSERT INTO `auth_permission` VALUES ('64', 'Can view log entry', '1', 'view_logentry');
INSERT INTO `auth_permission` VALUES ('65', 'Can view group', '3', 'view_group');
INSERT INTO `auth_permission` VALUES ('66', 'Can view permission', '2', 'view_permission');
INSERT INTO `auth_permission` VALUES ('67', 'Can view content type', '5', 'view_contenttype');
INSERT INTO `auth_permission` VALUES ('68', 'Can view 课程', '10', 'view_course');
INSERT INTO `auth_permission` VALUES ('69', 'Can view 课程资源', '13', 'view_courseresource');
INSERT INTO `auth_permission` VALUES ('70', 'Can view 章节', '11', 'view_lesson');
INSERT INTO `auth_permission` VALUES ('71', 'Can view 视频', '12', 'view_video');
INSERT INTO `auth_permission` VALUES ('72', 'Can view 用户评论', '18', 'view_coursecomments');
INSERT INTO `auth_permission` VALUES ('73', 'Can view 用户咨询', '17', 'view_userask');
INSERT INTO `auth_permission` VALUES ('74', 'Can view 用户课程', '21', 'view_usercourse');
INSERT INTO `auth_permission` VALUES ('75', 'Can view 用户收藏', '19', 'view_userfavorite');
INSERT INTO `auth_permission` VALUES ('76', 'Can view 用户消息', '20', 'view_usermessage');
INSERT INTO `auth_permission` VALUES ('77', 'Can view 城市', '14', 'view_citydict');
INSERT INTO `auth_permission` VALUES ('78', 'Can view 机构', '15', 'view_courseorg');
INSERT INTO `auth_permission` VALUES ('79', 'Can view 教师', '16', 'view_teacher');
INSERT INTO `auth_permission` VALUES ('80', 'Can view session', '6', 'view_session');
INSERT INTO `auth_permission` VALUES ('81', 'Can view 轮播图', '9', 'view_banner');
INSERT INTO `auth_permission` VALUES ('82', 'Can view 邮箱验证码', '8', 'view_emailverifyrecord');
INSERT INTO `auth_permission` VALUES ('83', 'Can view 用户信息', '7', 'view_userprofile');
INSERT INTO `auth_permission` VALUES ('84', 'Can add Bookmark', '22', 'add_bookmark');
INSERT INTO `auth_permission` VALUES ('85', 'Can change Bookmark', '22', 'change_bookmark');
INSERT INTO `auth_permission` VALUES ('86', 'Can delete Bookmark', '22', 'delete_bookmark');
INSERT INTO `auth_permission` VALUES ('87', 'Can add User Setting', '23', 'add_usersettings');
INSERT INTO `auth_permission` VALUES ('88', 'Can change User Setting', '23', 'change_usersettings');
INSERT INTO `auth_permission` VALUES ('89', 'Can delete User Setting', '23', 'delete_usersettings');
INSERT INTO `auth_permission` VALUES ('90', 'Can add User Widget', '24', 'add_userwidget');
INSERT INTO `auth_permission` VALUES ('91', 'Can change User Widget', '24', 'change_userwidget');
INSERT INTO `auth_permission` VALUES ('92', 'Can delete User Widget', '24', 'delete_userwidget');
INSERT INTO `auth_permission` VALUES ('93', 'Can add log entry', '25', 'add_log');
INSERT INTO `auth_permission` VALUES ('94', 'Can change log entry', '25', 'change_log');
INSERT INTO `auth_permission` VALUES ('95', 'Can delete log entry', '25', 'delete_log');
INSERT INTO `auth_permission` VALUES ('96', 'Can view Bookmark', '22', 'view_bookmark');
INSERT INTO `auth_permission` VALUES ('97', 'Can view log entry', '25', 'view_log');
INSERT INTO `auth_permission` VALUES ('98', 'Can view User Setting', '23', 'view_usersettings');
INSERT INTO `auth_permission` VALUES ('99', 'Can view User Widget', '24', 'view_userwidget');
INSERT INTO `auth_permission` VALUES ('100', 'Can add captcha store', '26', 'add_captchastore');
INSERT INTO `auth_permission` VALUES ('101', 'Can change captcha store', '26', 'change_captchastore');
INSERT INTO `auth_permission` VALUES ('102', 'Can delete captcha store', '26', 'delete_captchastore');
INSERT INTO `auth_permission` VALUES ('103', 'Can view captcha store', '26', 'view_captchastore');
INSERT INTO `auth_permission` VALUES ('104', 'Can view 轮播课程', '27', 'view_bannercourse');
INSERT INTO `auth_permission` VALUES ('105', 'Can add 轮播课程', '10', 'add_bannercourse');
INSERT INTO `auth_permission` VALUES ('106', 'Can change 轮播课程', '10', 'change_bannercourse');
INSERT INTO `auth_permission` VALUES ('107', 'Can delete 轮播课程', '10', 'delete_bannercourse');

-- ----------------------------
-- Table structure for auth_user
-- ----------------------------
DROP TABLE IF EXISTS `auth_user`;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_groups
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_groups`;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_groups
-- ----------------------------

-- ----------------------------
-- Table structure for auth_user_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `auth_user_user_permissions`;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `auth_user_user_perm_permission_id_1fbb5f2c_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of auth_user_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for captcha_captchastore
-- ----------------------------
DROP TABLE IF EXISTS `captcha_captchastore`;
CREATE TABLE `captcha_captchastore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `challenge` varchar(32) NOT NULL,
  `response` varchar(32) NOT NULL,
  `hashkey` varchar(40) NOT NULL,
  `expiration` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `hashkey` (`hashkey`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of captcha_captchastore
-- ----------------------------
INSERT INTO `captcha_captchastore` VALUES ('86', 'UQIE', 'uqie', 'c187d176f1e4848d065df5b44077d78f209e40f2', '2018-01-31 17:21:28.098306');
INSERT INTO `captcha_captchastore` VALUES ('88', 'CYWL', 'cywl', '3b2b52668d68edd9c98ec501411ad3d7b7b8a0f4', '2018-01-31 17:55:16.025799');
INSERT INTO `captcha_captchastore` VALUES ('89', 'DIJK', 'dijk', '8087835fbef0eb2e2651f7dec96d902c72cf8805', '2018-02-10 18:31:56.575517');
INSERT INTO `captcha_captchastore` VALUES ('90', 'AJJQ', 'ajjq', '3ae61c7299edd9b6958994832572584ad7a333d7', '2018-02-10 18:33:10.684057');
INSERT INTO `captcha_captchastore` VALUES ('91', 'BEEQ', 'beeq', 'e54e63a5ddc754b5c395f8738d56f2613ed51d45', '2018-02-10 18:33:27.547512');

-- ----------------------------
-- Table structure for courses_course
-- ----------------------------
DROP TABLE IF EXISTS `courses_course`;
CREATE TABLE `courses_course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(300) NOT NULL,
  `detail` longtext NOT NULL,
  `degree` varchar(20) NOT NULL,
  `learn_times` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11),
  `category` varchar(50) NOT NULL,
  `tag` varchar(50) NOT NULL,
  `notice` varchar(300) NOT NULL,
  `teacher_id` int(11),
  `teacher_tell` varchar(300) NOT NULL,
  `is_banner` tinyint(1) NOT NULL,
  `announcement` varchar(300) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_course_9cf869aa` (`org_id`),
  KEY `courses_course_d9614d40` (`teacher_id`),
  CONSTRAINT `courses_course_org_id_387fdc72_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`),
  CONSTRAINT `courses_course_teacher_id_846fa526_fk_organization_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `organization_teacher` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_course
-- ----------------------------
INSERT INTO `courses_course` VALUES ('1', 'Amazon S3 测试', '可能需要科学上网', '<p><span style=\"color: rgb(192, 80, 77); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\">python入门1</span><br/></p><p><span style=\"color: rgb(192, 80, 77); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\">21:02:03</span></p><p><span style=\"color: rgb(192, 80, 77); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\"><img src=\"http://img.baidu.com/hi/jx2/j_0002.gif\"/></span></p><p><span style=\"color: rgb(192, 80, 77); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\"></span></p><table><tbody><tr class=\"firstRow\"><td width=\"173\" valign=\"top\" style=\"word-break: break-all;\">hello</td><td width=\"173\" valign=\"top\"><br/></td><td width=\"173\" valign=\"top\"><br/></td></tr><tr><td width=\"173\" valign=\"top\"><br/></td><td width=\"173\" valign=\"top\"><br/></td><td width=\"173\" valign=\"top\"><br/></td></tr></tbody></table><p><span style=\"color: rgb(192, 80, 77); font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 20px;\"></span><br/></p>', 'primary', '0', '2', '1', 'courses/2018/01/540e57300001d6d906000338-240-135_isFtRl7.jpg', '110', '2018-01-23 11:40:00.000000', '7', '后端开发', 'python', 'python基础你需要有', '2', 'django的进阶开发', '0', 'amazon你懂的，应该加载很慢甚至加载不过来');
INSERT INTO `courses_course` VALUES ('2', '七牛云 测试', '注册七牛云账户很烦', '<p style=\"line-height: normal;\">∝<img src=\"http://img.baidu.com/hi/jx2/j_0004.gif\"/>\r\n &nbsp; &nbsp; python入门2</p><p style=\"line-height: normal;\"><br/></p>', 'primary', '0', '3', '1', 'courses/2018/01/540e57300001d6d906000338-240-135_MSIqfvw.jpg', '25', '2018-01-31 13:22:00.000000', '8', '后端开发', 'python', '七牛云', '3', '七牛云', '0', '加载很快吧。。。');
INSERT INTO `courses_course` VALUES ('3', 'python入门3', 'python入门3', 'python入门3', 'intermediate', '0', '3', '0', 'courses/2018/01/540e57300001d6d906000338-240-135_mvvGYHL.jpg', '6', '2018-01-31 13:23:00.000000', '8', '后端开发', 'python', 'xxx', '1', 'xxx', '0', 'xxx');
INSERT INTO `courses_course` VALUES ('4', 'python入门4', 'python入门4', 'python入门4', 'intermediate', '0', '4', '0', 'courses/2018/01/540e57300001d6d906000338-240-135_n0L8vbw.jpg', '3', '2018-01-31 13:24:00.000000', '9', '后端开发', 'python', 'xxx', '2', 'xxx', '0', '');
INSERT INTO `courses_course` VALUES ('5', 'python入门5', 'python入门5', 'python入门5', 'advanced', '0', '5', '0', 'courses/2018/01/540e57300001d6d906000338-240-135_wH52IED.jpg', '2', '2018-01-31 13:24:00.000000', '10', '后端开发', 'xxx', 'xxx', '3', 'xxx', '0', 'xxx');
INSERT INTO `courses_course` VALUES ('6', 'python入门6', 'python入门6', 'python入门6', 'advanced', '0', '6', '0', 'courses/2018/01/540e57300001d6d906000338-240-135_Z3HIQ2t.jpg', '1', '2018-01-31 13:24:00.000000', '9', '后端开发', '', '', null, '', '0', '');
INSERT INTO `courses_course` VALUES ('7', 'java入门1', 'java入门1', 'java入门1', 'intermediate', '0', '0', '0', 'courses/2018/01/57035ff200014b8a06000338-240-135.jpg', '0', '2018-01-31 13:25:00.000000', '8', '后端开发', '', '', null, '', '0', '');
INSERT INTO `courses_course` VALUES ('8', 'java入门2', 'java入门2', 'java入门2', 'advanced', '0', '0', '0', 'courses/2018/01/57035ff200014b8a06000338-240-135_0nFiBSI.jpg', '0', '2018-01-31 13:25:00.000000', '8', '后端开发', '', '', null, '', '0', '');
INSERT INTO `courses_course` VALUES ('9', 'java入门3', 'java入门3', 'java入门3', 'intermediate', '0', '0', '0', 'courses/2018/01/57035ff200014b8a06000338-240-135_dHfj8Nq.jpg', '0', '2018-01-31 13:25:00.000000', '7', '后端开发', '', '', null, '', '0', '');
INSERT INTO `courses_course` VALUES ('10', '搬砖', '搬砖', '<p>&nbsp; &nbsp; 搬砖</p>', 'advanced', '0', '1', '0', 'courses/2018/02/course.jpg', '2', '2018-01-31 13:26:00.000000', '7', '后端开发', 'xxx', 'xxx', '1', 'xxx', '1', 'xxx');
INSERT INTO `courses_course` VALUES ('11', 'mysql', 'mysql', 'mysql', 'primary', '0', '0', '0', 'courses/2018/01/mysql.jpg', '0', '2018-01-31 13:26:00.000000', '1', '后端开发', 'python', 'xxx', null, 'xxx', '0', 'xxx');

-- ----------------------------
-- Table structure for courses_courseresource
-- ----------------------------
DROP TABLE IF EXISTS `courses_courseresource`;
CREATE TABLE `courses_courseresource` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `download` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_courseresource_course_id_5eba1332_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_courseresource_course_id_5eba1332_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_courseresource
-- ----------------------------
INSERT INTO `courses_courseresource` VALUES ('1', '前端页面', 'course/resource/2018/02/media.zip', '2018-02-05 12:47:49.000000', '1');
INSERT INTO `courses_courseresource` VALUES ('3', 'curl_wget.rar', 'course/resource/2018/02/curl_wget.rar', '2018-02-23 11:04:00.000000', '10');

-- ----------------------------
-- Table structure for courses_lesson
-- ----------------------------
DROP TABLE IF EXISTS `courses_lesson`;
CREATE TABLE `courses_lesson` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_lesson_course_id_16bc4882_fk_courses_course_id` (`course_id`),
  CONSTRAINT `courses_lesson_course_id_16bc4882_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_lesson
-- ----------------------------
INSERT INTO `courses_lesson` VALUES ('1', '第一章', '2018-01-23 11:41:00.000000', '1');
INSERT INTO `courses_lesson` VALUES ('2', '第二章', '2018-02-05 09:52:51.000000', '1');
INSERT INTO `courses_lesson` VALUES ('4', '周杰伦', '2018-02-07 18:12:34.000000', '2');
INSERT INTO `courses_lesson` VALUES ('5', '邓紫棋', '2018-02-07 18:12:48.000000', '2');
INSERT INTO `courses_lesson` VALUES ('6', '第一章 强身健体', '2018-02-15 18:02:00.000000', '10');

-- ----------------------------
-- Table structure for courses_video
-- ----------------------------
DROP TABLE IF EXISTS `courses_video`;
CREATE TABLE `courses_video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `lesson_id` int(11) NOT NULL,
  `url` varchar(500) NOT NULL,
  `learn_times` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` (`lesson_id`),
  CONSTRAINT `courses_video_lesson_id_59f2396e_fk_courses_lesson_id` FOREIGN KEY (`lesson_id`) REFERENCES `courses_lesson` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of courses_video
-- ----------------------------
INSERT INTO `courses_video` VALUES ('1', '1-1 Love the way you lie & I need a doctor', '2018-02-05 10:03:36.000000', '1', 'https://s3-ap-northeast-1.amazonaws.com/mxonline/Love+The+Way+You+Lie+%26+I+Need+A+Doctor+%E7%AC%AC53%E5%B1%8A%E6%A0%BC%E8%8E%B1%E7%BE%8E+%E7%8E%B0%E5%9C%BA%E7%89%88.Mp4', '0');
INSERT INTO `courses_video` VALUES ('2', '1-2 蓝洁瑛 cut', '2018-02-05 10:03:49.000000', '1', 'https://s3-ap-northeast-1.amazonaws.com/mxonline/%E3%80%90%E8%93%9D%E6%B4%81%E7%91%9B%E5%BD%B1%E8%A7%86%E6%B7%B7%E5%89%AA%E3%80%91%E8%8A%B1%E8%90%BD%E7%BB%88%E5%BE%97%E5%BD%92%EF%BC%8C%E8%8A%B3%E5%8D%8E%E7%BB%88%E6%86%94%E6%82%B4+-+1.1(Av16231075%2CP1).Mp4', '0');
INSERT INTO `courses_video` VALUES ('3', '2-1 我们不是相爱吗', '2018-02-05 10:04:26.000000', '2', 'https://s3-ap-northeast-1.amazonaws.com/mxonline/%E3%80%90%E9%87%91%E9%92%9F%E5%9B%BD+%E5%AE%8B%E6%99%BA%E5%AD%9D%E3%80%91+T-ara+-+%E6%88%91%E4%BB%AC%E4%B8%8D%E6%98%AF%E7%9B%B8%E7%88%B1%E5%90%97+%E9%A5%AD%E5%88%B6%E5%8F%98%E5%A3%B0%E7%89%88+%E4%B8%AD%E6%96%87%E5%AD%97%E5%B9%95+-+1.1(Av14606976%2CP1).Mp4', '0');
INSERT INTO `courses_video` VALUES ('4', '2-2 sjh & kjk', '2018-02-05 10:04:33.000000', '2', 'https://s3-ap-northeast-1.amazonaws.com/mxonline/%E5%AE%8B%E6%99%BA%E5%AD%9D+%E9%87%91%E9%92%9F%E5%9B%BD+%E7%B2%89%E7%BA%A2%E6%97%B6%E5%88%BB+-+1.1(Av14798718%2CP1).Mp4', '0');
INSERT INTO `courses_video` VALUES ('5', '发如雪', '2018-02-07 18:13:14.000000', '4', 'http://p3rs89rki.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E5%8F%91%E5%A6%82%E9%9B%AA.mp4', '0');
INSERT INTO `courses_video` VALUES ('6', '等你下课', '2018-02-07 18:13:40.000000', '4', 'http://p3rs89rki.bkt.clouddn.com/%E5%91%A8%E6%9D%B0%E4%BC%A6%20-%20%E7%AD%89%E4%BD%A0%E4%B8%8B%E8%AF%BE%20%E5%AE%98%E6%96%B9%E5%AE%8C%E6%95%B4%E6%AD%8C%E8%AF%8D%E7%89%88.mp4', '0');
INSERT INTO `courses_video` VALUES ('7', '泡沫', '2018-02-07 18:14:15.000000', '5', 'http://p3rs89rki.bkt.clouddn.com/G.E.M.%E9%82%93%E7%B4%AB%E6%A3%8B%20-%20%E6%B3%A1%E6%B2%AB.mp4', '0');
INSERT INTO `courses_video` VALUES ('8', '盲点', '2018-02-07 18:14:39.000000', '5', 'http://p3rs89rki.bkt.clouddn.com/G.E.M.%E9%82%93%E7%B4%AB%E6%A3%8B%20-%20%E7%9B%B2%E7%82%B9.mp4', '0');

-- ----------------------------
-- Table structure for django_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `django_admin_log`;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin__content_type_id_c4bce8eb_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_admin_log
-- ----------------------------

-- ----------------------------
-- Table structure for django_content_type
-- ----------------------------
DROP TABLE IF EXISTS `django_content_type`;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_content_type
-- ----------------------------
INSERT INTO `django_content_type` VALUES ('1', 'admin', 'logentry');
INSERT INTO `django_content_type` VALUES ('3', 'auth', 'group');
INSERT INTO `django_content_type` VALUES ('2', 'auth', 'permission');
INSERT INTO `django_content_type` VALUES ('26', 'captcha', 'captchastore');
INSERT INTO `django_content_type` VALUES ('5', 'contenttypes', 'contenttype');
INSERT INTO `django_content_type` VALUES ('27', 'courses', 'bannercourse');
INSERT INTO `django_content_type` VALUES ('10', 'courses', 'course');
INSERT INTO `django_content_type` VALUES ('13', 'courses', 'courseresource');
INSERT INTO `django_content_type` VALUES ('11', 'courses', 'lesson');
INSERT INTO `django_content_type` VALUES ('12', 'courses', 'video');
INSERT INTO `django_content_type` VALUES ('18', 'operation', 'coursecomments');
INSERT INTO `django_content_type` VALUES ('17', 'operation', 'userask');
INSERT INTO `django_content_type` VALUES ('21', 'operation', 'usercourse');
INSERT INTO `django_content_type` VALUES ('19', 'operation', 'userfavorite');
INSERT INTO `django_content_type` VALUES ('20', 'operation', 'usermessage');
INSERT INTO `django_content_type` VALUES ('14', 'organization', 'citydict');
INSERT INTO `django_content_type` VALUES ('15', 'organization', 'courseorg');
INSERT INTO `django_content_type` VALUES ('16', 'organization', 'teacher');
INSERT INTO `django_content_type` VALUES ('6', 'sessions', 'session');
INSERT INTO `django_content_type` VALUES ('9', 'users', 'banner');
INSERT INTO `django_content_type` VALUES ('8', 'users', 'emailverifyrecord');
INSERT INTO `django_content_type` VALUES ('7', 'users', 'userprofile');
INSERT INTO `django_content_type` VALUES ('22', 'xadmin', 'bookmark');
INSERT INTO `django_content_type` VALUES ('25', 'xadmin', 'log');
INSERT INTO `django_content_type` VALUES ('23', 'xadmin', 'usersettings');
INSERT INTO `django_content_type` VALUES ('24', 'xadmin', 'userwidget');

-- ----------------------------
-- Table structure for django_migrations
-- ----------------------------
DROP TABLE IF EXISTS `django_migrations`;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_migrations
-- ----------------------------
INSERT INTO `django_migrations` VALUES ('1', 'contenttypes', '0001_initial', '2018-01-21 12:05:23.789124');
INSERT INTO `django_migrations` VALUES ('2', 'auth', '0001_initial', '2018-01-21 12:05:24.657720');
INSERT INTO `django_migrations` VALUES ('3', 'admin', '0001_initial', '2018-01-21 12:05:24.853909');
INSERT INTO `django_migrations` VALUES ('4', 'admin', '0002_logentry_remove_auto_add', '2018-01-21 12:05:24.890932');
INSERT INTO `django_migrations` VALUES ('5', 'contenttypes', '0002_remove_content_type_name', '2018-01-21 12:05:25.043040');
INSERT INTO `django_migrations` VALUES ('6', 'auth', '0002_alter_permission_name_max_length', '2018-01-21 12:05:25.140103');
INSERT INTO `django_migrations` VALUES ('7', 'auth', '0003_alter_user_email_max_length', '2018-01-21 12:05:25.231665');
INSERT INTO `django_migrations` VALUES ('8', 'auth', '0004_alter_user_username_opts', '2018-01-21 12:05:25.246675');
INSERT INTO `django_migrations` VALUES ('9', 'auth', '0005_alter_user_last_login_null', '2018-01-21 12:05:25.730051');
INSERT INTO `django_migrations` VALUES ('10', 'auth', '0006_require_contenttypes_0002', '2018-01-21 12:05:25.754277');
INSERT INTO `django_migrations` VALUES ('11', 'auth', '0007_alter_validators_add_error_messages', '2018-01-21 12:05:25.810819');
INSERT INTO `django_migrations` VALUES ('12', 'sessions', '0001_initial', '2018-01-21 12:05:26.256693');
INSERT INTO `django_migrations` VALUES ('13', 'users', '0001_initial', '2018-01-21 12:43:42.896948');
INSERT INTO `django_migrations` VALUES ('14', 'courses', '0001_initial', '2018-01-22 11:11:38.271682');
INSERT INTO `django_migrations` VALUES ('15', 'operation', '0001_initial', '2018-01-22 11:11:38.948760');
INSERT INTO `django_migrations` VALUES ('16', 'organization', '0001_initial', '2018-01-22 11:11:39.238270');
INSERT INTO `django_migrations` VALUES ('17', 'users', '0002_banner_emailverifyrecord', '2018-01-22 11:11:39.314673');
INSERT INTO `django_migrations` VALUES ('18', 'users', '0003_auto_20180122_1938', '2018-01-22 19:38:58.638896');
INSERT INTO `django_migrations` VALUES ('19', 'xadmin', '0001_initial', '2018-01-22 21:44:30.127745');
INSERT INTO `django_migrations` VALUES ('20', 'xadmin', '0002_log', '2018-01-22 21:44:30.459966');
INSERT INTO `django_migrations` VALUES ('21', 'xadmin', '0003_auto_20160715_0100', '2018-01-22 21:44:31.195454');
INSERT INTO `django_migrations` VALUES ('22', 'courses', '0002_auto_20180123_1206', '2018-01-23 12:06:09.940536');
INSERT INTO `django_migrations` VALUES ('23', 'organization', '0002_auto_20180123_1206', '2018-01-23 12:06:10.016777');
INSERT INTO `django_migrations` VALUES ('24', 'users', '0004_auto_20180123_1206', '2018-01-23 12:06:10.046301');
INSERT INTO `django_migrations` VALUES ('25', 'captcha', '0001_initial', '2018-01-24 17:41:07.416887');
INSERT INTO `django_migrations` VALUES ('26', 'organization', '0003_courseorg_category', '2018-01-26 17:10:29.634284');
INSERT INTO `django_migrations` VALUES ('27', 'organization', '0004_auto_20180126_2144', '2018-01-26 21:44:32.107409');
INSERT INTO `django_migrations` VALUES ('28', 'courses', '0003_course_org', '2018-01-27 17:12:25.298771');
INSERT INTO `django_migrations` VALUES ('29', 'organization', '0005_teacher_image', '2018-01-27 18:31:08.870796');
INSERT INTO `django_migrations` VALUES ('30', 'courses', '0004_course_category', '2018-01-31 16:12:13.329507');
INSERT INTO `django_migrations` VALUES ('31', 'users', '0005_auto_20180131_1915', '2018-01-31 19:15:50.366405');
INSERT INTO `django_migrations` VALUES ('32', 'courses', '0005_course_tag', '2018-02-04 16:19:03.916656');
INSERT INTO `django_migrations` VALUES ('33', 'courses', '0006_auto_20180204_1630', '2018-02-04 16:30:14.322368');
INSERT INTO `django_migrations` VALUES ('34', 'courses', '0007_video_url', '2018-02-05 09:59:20.796310');
INSERT INTO `django_migrations` VALUES ('35', 'courses', '0008_video_learn_times', '2018-02-05 12:44:47.256189');
INSERT INTO `django_migrations` VALUES ('36', 'courses', '0009_auto_20180205_1305', '2018-02-05 13:05:34.250239');
INSERT INTO `django_migrations` VALUES ('37', 'courses', '0010_auto_20180207_1109', '2018-02-07 11:09:33.496850');
INSERT INTO `django_migrations` VALUES ('38', 'organization', '0006_teacher_age', '2018-02-07 19:17:24.568323');
INSERT INTO `django_migrations` VALUES ('39', 'courses', '0011_auto_20180207_1946', '2018-02-07 19:46:31.000820');
INSERT INTO `django_migrations` VALUES ('40', 'users', '0006_auto_20180208_1904', '2018-02-08 19:04:54.657758');
INSERT INTO `django_migrations` VALUES ('41', 'users', '0007_auto_20180209_1449', '2018-02-09 14:49:17.861485');
INSERT INTO `django_migrations` VALUES ('42', 'users', '0008_auto_20180210_1826', '2018-02-10 18:26:31.211533');
INSERT INTO `django_migrations` VALUES ('43', 'courses', '0012_course_is_banner', '2018-02-13 17:29:15.071163');
INSERT INTO `django_migrations` VALUES ('44', 'organization', '0007_courseorg_tag', '2018-02-13 19:42:07.580254');
INSERT INTO `django_migrations` VALUES ('45', 'courses', '0013_auto_20180215_1852', '2018-02-15 18:53:04.699003');
INSERT INTO `django_migrations` VALUES ('46', 'courses', '0014_auto_20180215_2006', '2018-02-15 20:06:08.193926');
INSERT INTO `django_migrations` VALUES ('47', 'courses', '0015_auto_20180216_1038', '2018-02-16 10:38:41.773320');
INSERT INTO `django_migrations` VALUES ('48', 'courses', '0016_auto_20180216_1039', '2018-02-16 10:39:44.739645');

-- ----------------------------
-- Table structure for django_session
-- ----------------------------
DROP TABLE IF EXISTS `django_session`;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_de54fa62` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of django_session
-- ----------------------------
INSERT INTO `django_session` VALUES ('98mygy2az7qbpwse82p9o6p2ruira5r4', 'MGI0NjExOGIyZGVkNmJlYmMxNTUxY2E5MzRjZjViYmYxM2RiMDM3ODp7Il9hdXRoX3VzZXJfaWQiOiIyIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZHMiLCJfYXV0aF91c2VyX2hhc2giOiI5NjZlMmJmYmM3NWU5YWMzODQxZWM3YjI5YTU5NTU2Nzc5Y2ZkOWI2In0=', '2018-02-07 20:19:24.987676');
INSERT INTO `django_session` VALUES ('hweyvs9co4mbw6ro1hvzm5sqihkoa4po', 'NjdkYjYxY2EwZjQ0OGU4MzEzMTkyNTEzMTMzYTNmOTcxZjJmZGI1Njp7Il9hdXRoX3VzZXJfaWQiOiI0IiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZHMiLCJfYXV0aF91c2VyX2hhc2giOiI2NGFjNDJiZjMzOTE0NDYxYTNkNDM1MjM3MzIxZGNmYTQyNDIzNjRhIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImNvdXJzZSJdLCIiXX0=', '2018-02-28 20:27:28.056302');
INSERT INTO `django_session` VALUES ('l8lhgpcl7lepkpv4bexjv9awd04079as', 'M2MzNjI1Y2JhZDE4NDY1NTg4YmZiNjM5NGFjNjA5Njc0MzI3NGMwYTp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZHMiLCJfYXV0aF91c2VyX2hhc2giOiI5ZmM4NTUzYzgyYjZlOTZhYTI0NDYxNmM3MzQ5MjZkYWEwZmJmODZlIiwiTElTVF9RVUVSWSI6W1siY291cnNlcyIsImJhbm5lcmNvdXJzZSJdLCIiXX0=', '2018-03-09 11:05:06.632653');
INSERT INTO `django_session` VALUES ('pupxhzbxsct62p7s7ummpfthz3rg16ct', 'N2YwNWRkMTkyMDM1NzUwNTlhOWIxNDVmMWYyYThhZTRmYjQyNDM4Mzp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoidXNlcnMudmlld3MuQ3VzdG9tQmFja2VuZHMiLCJfYXV0aF91c2VyX2hhc2giOiI5YmQxNWVhMjlkNjU1MDk3N2RjMWMwMTkxODFmNWZiNDZhNWJkYjQ3IiwiTElTVF9RVUVSWSI6W1sidXNlcnMiLCJ1c2VycHJvZmlsZSJdLCIiXX0=', '2018-02-22 17:38:47.924100');

-- ----------------------------
-- Table structure for operation_coursecomments
-- ----------------------------
DROP TABLE IF EXISTS `operation_coursecomments`;
CREATE TABLE `operation_coursecomments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comments` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` (`course_id`),
  KEY `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_coursecomment_user_id_f5ff70b3_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `operation_coursecomments_course_id_c88f1b6a_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_coursecomments
-- ----------------------------
INSERT INTO `operation_coursecomments` VALUES ('1', '测试', '2018-02-05 18:22:32.219728', '1', '1');
INSERT INTO `operation_coursecomments` VALUES ('2', '再次测试', '2018-02-05 18:33:41.588820', '1', '1');
INSERT INTO `operation_coursecomments` VALUES ('3', 'good\n', '2018-02-05 18:34:20.788649', '1', '1');

-- ----------------------------
-- Table structure for operation_userask
-- ----------------------------
DROP TABLE IF EXISTS `operation_userask`;
CREATE TABLE `operation_userask` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `mobile` varchar(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userask
-- ----------------------------
INSERT INTO `operation_userask` VALUES ('12', 'anderson', '18036233180', 'python spider', '2018-01-27 16:13:01.620572');
INSERT INTO `operation_userask` VALUES ('13', 'anderson', '18036233180', 'python spider', '2018-01-27 16:15:52.828467');
INSERT INTO `operation_userask` VALUES ('14', 'sp', '15345158049', 'django', '2018-01-27 16:43:18.940201');

-- ----------------------------
-- Table structure for operation_usercourse
-- ----------------------------
DROP TABLE IF EXISTS `operation_usercourse`;
CREATE TABLE `operation_usercourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime(6) NOT NULL,
  `course_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` (`course_id`),
  KEY `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_usercourse_course_id_9f1eab2e_fk_courses_course_id` FOREIGN KEY (`course_id`) REFERENCES `courses_course` (`id`),
  CONSTRAINT `operation_usercourse_user_id_835fe81a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usercourse
-- ----------------------------
INSERT INTO `operation_usercourse` VALUES ('5', '2018-02-10 19:52:20.200980', '1', '1');
INSERT INTO `operation_usercourse` VALUES ('6', '2018-02-10 19:52:26.587070', '2', '1');
INSERT INTO `operation_usercourse` VALUES ('7', '2018-02-15 18:04:40.669110', '10', '1');

-- ----------------------------
-- Table structure for operation_userfavorite
-- ----------------------------
DROP TABLE IF EXISTS `operation_userfavorite`;
CREATE TABLE `operation_userfavorite` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fav_id` int(11) NOT NULL,
  `fav_type` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `operation_userfavorite_user_id_ad46a6af_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_userfavorite
-- ----------------------------
INSERT INTO `operation_userfavorite` VALUES ('28', '1', '1', '2018-02-13 15:19:29.732846', '1');
INSERT INTO `operation_userfavorite` VALUES ('29', '2', '1', '2018-02-13 15:19:47.930648', '1');
INSERT INTO `operation_userfavorite` VALUES ('30', '7', '2', '2018-02-13 15:21:42.428702', '1');

-- ----------------------------
-- Table structure for operation_usermessage
-- ----------------------------
DROP TABLE IF EXISTS `operation_usermessage`;
CREATE TABLE `operation_usermessage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user` int(11) NOT NULL,
  `message` varchar(200) NOT NULL,
  `has_read` tinyint(1) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_usermessage
-- ----------------------------
INSERT INTO `operation_usermessage` VALUES ('1', '0', '测试', '1', '2018-02-10 17:32:10.244846');
INSERT INTO `operation_usermessage` VALUES ('2', '0', 'test', '1', '2018-02-10 17:34:00.000000');
INSERT INTO `operation_usermessage` VALUES ('3', '0', '11111111111111111111111111111111', '1', '2018-02-10 17:34:00.000000');
INSERT INTO `operation_usermessage` VALUES ('4', '0', '慕课网（IMOOC）是IT技能学习平台。慕课网(IMOOC)提供了丰富的移动端开发、php开发、web前端、android开发以及html5等视频教程资源公开课。并且富有交互性及趣味性，你还可以和朋友一起编程。', '1', '2018-02-10 17:35:00.000000');
INSERT INTO `operation_usermessage` VALUES ('5', '1', '欢迎注册', '1', '2018-02-13 15:37:11.868000');

-- ----------------------------
-- Table structure for organization_citydict
-- ----------------------------
DROP TABLE IF EXISTS `organization_citydict`;
CREATE TABLE `organization_citydict` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` varchar(200) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_citydict
-- ----------------------------
INSERT INTO `organization_citydict` VALUES ('1', '上海', '上海', '2018-01-26 16:19:00.000000');
INSERT INTO `organization_citydict` VALUES ('2', '广州', '广州', '2018-01-26 16:20:00.000000');
INSERT INTO `organization_citydict` VALUES ('3', '深圳', '深圳', '2018-01-26 16:20:00.000000');
INSERT INTO `organization_citydict` VALUES ('4', '北京', '北京', '2018-01-26 16:20:00.000000');
INSERT INTO `organization_citydict` VALUES ('5', '南京', '南京', '2018-01-26 17:03:00.000000');

-- ----------------------------
-- Table structure for organization_courseorg
-- ----------------------------
DROP TABLE IF EXISTS `organization_courseorg`;
CREATE TABLE `organization_courseorg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `desc` longtext NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `image` varchar(100) NOT NULL,
  `address` varchar(150) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `city_id` int(11) NOT NULL,
  `category` varchar(20) NOT NULL,
  `course_nums` int(11) NOT NULL,
  `students` int(11) NOT NULL,
  `tag` varchar(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_course_city_id_4a842f85_fk_organization_citydict_id` (`city_id`),
  CONSTRAINT `organization_course_city_id_4a842f85_fk_organization_citydict_id` FOREIGN KEY (`city_id`) REFERENCES `organization_citydict` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_courseorg
-- ----------------------------
INSERT INTO `organization_courseorg` VALUES ('1', '慕课网', '慕课网是垂直的互联网IT技能免费学习网站。以独家视频教程、在线编程工具、学习计划、问答社区为核心特色。在这里，你可以找到最好的互联网技术牛人，也可以通过免费的在线公开视频课程学习国内领先的互联网IT技术。', '3', '0', 'org/2018/01/imooc.png', '北京市', '2018-01-26 16:25:00.000000', '4', 'pxjg', '1', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('2', '慕课网1', '慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。', '0', '0', 'org/2018/01/imooc_Gn1sRjp.png', '上海', '2018-01-26 16:44:00.000000', '1', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('3', '慕课网2', '慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。', '0', '0', 'org/2018/01/imooc_klgAUn5.png', '广州', '2018-01-26 16:45:00.000000', '2', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('4', '慕课网3', '慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。', '0', '0', 'org/2018/01/imooc_OO2ykYP.png', '北京市', '2018-01-26 17:01:00.000000', '4', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('5', '慕课网4', '慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。', '0', '0', 'org/2018/01/imooc_qEaMov1.png', '深圳', '2018-01-26 17:02:00.000000', '3', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('6', '慕课网5', '慕课网课程涵盖前端开发、PHP、Html5、Android、iOS、Swift等IT前沿技术语言，包括基础课程、实用案例、高级分享三大类型，适合不同阶段的学习人群。以纯干货、短视频的形式为平台特点，为在校学生、职场白领提供了一个迅速提升技能、共同分享进步的学习平台。', '0', '0', 'org/2018/01/imooc_V0TJOyb.png', '南京', '2018-01-26 17:03:00.000000', '5', 'pxjg', '0', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('7', 'ANDERSON', 'anderson.com', '2', '1', 'org/2018/01/imooc_Y2Tonsq.png', '朝阳区', '2018-01-26 17:04:00.000000', '4', 'gr', '3', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('8', '北京大学', '北京大学，简称“北大”，诞生于1898年，初名京师大学堂，是中国近代第一所国立大学，也是最早以“大学”之名创办的学校，其成立标志着中国近代高等教育的开端。北大是中国近代以来唯一以国家最高学府身份创立的学校，最初也是国家最高教育行政机关，行使教育部职能，统管全国教育。北大催生了中国最早的现代学制，开创了中国最早的文科、理科、社科、农科、医科等大学学科，是近代以来中国高等教育的奠基者。', '0', '0', 'org/2018/01/bjdx.jpg', '北京市', '2018-01-26 17:04:00.000000', '4', 'gx', '4', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('9', '南京大学', '南京大学（Nanjing University），简称“南大”，是中华人民共和国教育部直属、中央直管副部级建制的全国重点大学，国家首批“双一流”、“211工程”、“985工程”重点建设高校，入选首批“珠峰计划”、“111计划”、“2011计划”、“卓越工程师教育培养计划”、“卓越医生教育培养计划”、“卓越法律人才教育培养计划”，九校联盟、中国大学校长联谊会、环太平洋大学联盟、21世纪学术联盟和东亚研究型大学协会成员。', '0', '0', 'org/2018/01/njdx.jpg', '南京', '2018-01-26 17:05:00.000000', '5', 'gx', '3', '0', '全国知名');
INSERT INTO `organization_courseorg` VALUES ('10', '清华大学', '清华大学（Tsinghua University），简称“清华”，由中华人民共和国教育部直属，中央直管副部级建制，位列“211工程”、“985工程”、“世界一流大学和一流学科”，入选“基础学科拔尖学生培养试验计划”、“高等学校创新能力提升计划”、“高等学校学科创新引智计划”，为九校联盟、中国大学校长联谊会、东亚研究型大学协会、亚洲大学联盟、环太平洋大学联盟、清华—剑桥—MIT低碳大学联盟成员，被誉为“红色工程师的摇篮”。', '0', '0', 'org/2018/01/qhdx-logo.png', '北京市', '2018-01-26 17:06:00.000000', '4', 'gx', '1', '0', '全国知名');

-- ----------------------------
-- Table structure for organization_teacher
-- ----------------------------
DROP TABLE IF EXISTS `organization_teacher`;
CREATE TABLE `organization_teacher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `work_years` int(11) NOT NULL,
  `work_company` varchar(50) NOT NULL,
  `work_position` varchar(50) NOT NULL,
  `points` varchar(50) NOT NULL,
  `click_nums` int(11) NOT NULL,
  `fav_nums` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  `org_id` int(11) NOT NULL,
  `image` varchar(100),
  `age` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` (`org_id`),
  CONSTRAINT `organization_teache_org_id_cd000a1a_fk_organization_courseorg_id` FOREIGN KEY (`org_id`) REFERENCES `organization_courseorg` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of organization_teacher
-- ----------------------------
INSERT INTO `organization_teacher` VALUES ('1', 'anderson', '0', 'xxx', 'xxx', 'xxx', '71', '0', '2018-01-27 17:03:00.000000', '7', 'teacher/2018/01/aobama.png', '20');
INSERT INTO `organization_teacher` VALUES ('2', 'zyq', '0', 'xxx', 'xxx', 'xxx', '92', '0', '2018-01-27 17:04:00.000000', '9', 'teacher/2018/02/fqy.png', '20');
INSERT INTO `organization_teacher` VALUES ('3', 'yw', '5', 'xxx', 'xxx', 'xxx', '103', '0', '2018-01-27 17:07:00.000000', '7', 'teacher/2018/01/aobama_CXWwMef.png', '20');

-- ----------------------------
-- Table structure for users_banner
-- ----------------------------
DROP TABLE IF EXISTS `users_banner`;
CREATE TABLE `users_banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  `url` varchar(200) NOT NULL,
  `index` int(11) NOT NULL,
  `add_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_banner
-- ----------------------------
INSERT INTO `users_banner` VALUES ('1', 'First', 'banner/2018/02/57a801860001c34b12000460.jpg', 'https://pan.baidu.com', '1', '2018-02-13 18:01:00.000000');
INSERT INTO `users_banner` VALUES ('2', 'Second', 'banner/2018/02/57a801860001c34b12000460_z4Vb8zl.jpg', 'https://pan.baidu.com', '2', '2018-02-13 18:03:00.000000');
INSERT INTO `users_banner` VALUES ('3', 'Third', 'banner/2018/02/57aa86a0000145c512000460.jpg', 'https://pan.baidu.com', '3', '2018-02-13 18:03:00.000000');
INSERT INTO `users_banner` VALUES ('4', '4th', 'banner/2018/02/57aa86a0000145c512000460_GXIBATC.jpg', 'https://pan.baidu.com', '4', '2018-02-13 18:03:00.000000');
INSERT INTO `users_banner` VALUES ('5', '5th', 'banner/2018/02/57aa86a0000145c512000460_nMwvoQD.jpg', 'https://pan.baidu.com', '5', '2018-02-13 18:03:00.000000');

-- ----------------------------
-- Table structure for users_emailverifyrecord
-- ----------------------------
DROP TABLE IF EXISTS `users_emailverifyrecord`;
CREATE TABLE `users_emailverifyrecord` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(20) NOT NULL,
  `email` varchar(50) NOT NULL,
  `send_type` varchar(20) NOT NULL,
  `send_time` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_emailverifyrecord
-- ----------------------------
INSERT INTO `users_emailverifyrecord` VALUES ('1', 'anderson', 'xxx@qq.com', 'register', '2018-01-22 22:13:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('2', 'ANDERSON', 'xxx@gmail.com', 'forget', '2018-01-22 22:14:00.000000');
INSERT INTO `users_emailverifyrecord` VALUES ('3', '9MVnX72f', '726129246@qq.com', 'register', '2018-01-24 19:32:36.333854');
INSERT INTO `users_emailverifyrecord` VALUES ('4', 'uxo53jRH', '726129246@qq.com', 'register', '2018-01-24 20:29:09.710962');
INSERT INTO `users_emailverifyrecord` VALUES ('5', 'XAx1O2qj', '726129246@qq.com', 'forget', '2018-01-25 13:38:51.520527');
INSERT INTO `users_emailverifyrecord` VALUES ('6', 'P8vCaSVp', '726129246@qq.com', 'forget', '2018-01-25 13:46:20.251586');
INSERT INTO `users_emailverifyrecord` VALUES ('7', 'n5opinxU', '726129246@qq.com', 'register', '2018-01-31 17:16:45.150041');
INSERT INTO `users_emailverifyrecord` VALUES ('8', '5gKp', '18036233180@163.com', 'sendemail_code', '2018-02-08 19:10:37.924545');
INSERT INTO `users_emailverifyrecord` VALUES ('9', 'n4nT', '18036233180@163.com', 'sendemail_code', '2018-02-08 19:12:21.303901');
INSERT INTO `users_emailverifyrecord` VALUES ('10', 'MfXs', 'sp726129246@gmail.com', 'sendemail_code', '2018-02-09 13:26:20.995774');

-- ----------------------------
-- Table structure for users_userprofile
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile`;
CREATE TABLE `users_userprofile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `nickname` varchar(50) NOT NULL,
  `birthday` date NOT NULL,
  `gender` varchar(10) NOT NULL,
  `mobile` varchar(11) DEFAULT NULL,
  `address` varchar(100) NOT NULL,
  `image` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile
-- ----------------------------
INSERT INTO `users_userprofile` VALUES ('1', 'pbkdf2_sha256$24000$f0Q18rj1snC8$An+X5wo+KuECMuPhBi2OMdTwL3houmXcKxojQvfL5XE=', '2018-02-14 20:17:32.627744', '1', 'anderson', '鹏', '邵', 'sp726129246@gmail.com', '1', '1', '2018-01-22 19:39:00.000000', 'anderson', '1996-05-15', 'male', '18036233180', '高邮', 'courses/2018/01/default_middile_1.png');
INSERT INTO `users_userprofile` VALUES ('4', 'pbkdf2_sha256$24000$VGjxa3xnVWts$VOFjxEtNaWuWfNMUuUEbjeCGfwD7IRJVVYz7kqdbTtQ=', '2018-02-14 20:18:00.000000', '0', 'sp', '鹏', '邵', '726129246@qq.com', '1', '1', '2018-01-31 17:16:00.000000', 'shaopeng', '1996-05-15', 'male', '', '卸甲', 'image/2018/02/oyf.png');

-- ----------------------------
-- Table structure for users_userprofile_groups
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_groups`;
CREATE TABLE `users_userprofile_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_groups_userprofile_id_823cf2fc_uniq` (`userprofile_id`,`group_id`),
  KEY `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` (`group_id`),
  CONSTRAINT `users_userprofil_userprofile_id_a4496a80_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_groups_group_id_3de53dbf_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_groups
-- ----------------------------
INSERT INTO `users_userprofile_groups` VALUES ('1', '4', '1');

-- ----------------------------
-- Table structure for users_userprofile_user_permissions
-- ----------------------------
DROP TABLE IF EXISTS `users_userprofile_user_permissions`;
CREATE TABLE `users_userprofile_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userprofile_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_userprofile_user_permissions_userprofile_id_d0215190_uniq` (`userprofile_id`,`permission_id`),
  KEY `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` (`permission_id`),
  CONSTRAINT `users_userprofil_userprofile_id_34544737_fk_users_userprofile_id` FOREIGN KEY (`userprofile_id`) REFERENCES `users_userprofile` (`id`),
  CONSTRAINT `users_userprofile_u_permission_id_393136b6_fk_auth_permission_id` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users_userprofile_user_permissions
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_bookmark
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_bookmark`;
CREATE TABLE `xadmin_bookmark` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(128) NOT NULL,
  `url_name` varchar(64) NOT NULL,
  `query` varchar(1000) NOT NULL,
  `is_share` tinyint(1) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_bookma_content_type_id_60941679_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_bookmark_user_id_42d307fc_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_bookmark
-- ----------------------------

-- ----------------------------
-- Table structure for xadmin_log
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_log`;
CREATE TABLE `xadmin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `ip_addr` char(39) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` varchar(32) NOT NULL,
  `message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` (`content_type_id`),
  KEY `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_log_content_type_id_2a6cb852_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `xadmin_log_user_id_bb16a176_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_log
-- ----------------------------
INSERT INTO `xadmin_log` VALUES ('1', '2018-01-22 22:14:19.817837', '127.0.0.1', '1', 'EmailVerifyRecord object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('2', '2018-01-22 22:15:06.378334', '127.0.0.1', '2', 'EmailVerifyRecord object', 'create', '已添加。', '8', '1');
INSERT INTO `xadmin_log` VALUES ('3', '2018-01-23 11:41:10.568037', '127.0.0.1', '1', 'Course object', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('4', '2018-01-23 11:42:05.329413', '127.0.0.1', '1', 'Lesson object', 'create', '已添加。', '11', '1');
INSERT INTO `xadmin_log` VALUES ('5', '2018-01-26 16:20:15.825929', '127.0.0.1', '1', '上海', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('6', '2018-01-26 16:20:28.217933', '127.0.0.1', '2', '广州', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('7', '2018-01-26 16:20:36.814241', '127.0.0.1', '3', '深圳', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('8', '2018-01-26 16:20:44.315301', '127.0.0.1', '4', '北京', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('9', '2018-01-26 16:27:46.800194', '127.0.0.1', '1', '慕课网', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('10', '2018-01-26 16:41:00.633288', '127.0.0.1', '1', '慕课网', 'change', '已修改 image 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('11', '2018-01-26 16:43:02.868714', '127.0.0.1', '1', 'django入门', 'change', '已修改 image 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('12', '2018-01-26 16:45:26.414005', '127.0.0.1', '2', '慕课网1', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('13', '2018-01-26 17:01:54.735886', '127.0.0.1', '3', '慕课网2', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('14', '2018-01-26 17:02:38.588560', '127.0.0.1', '4', '慕课网3', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('15', '2018-01-26 17:03:28.220804', '127.0.0.1', '5', '慕课网4', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('16', '2018-01-26 17:03:39.824200', '127.0.0.1', '5', '南京', 'create', '已添加。', '14', '1');
INSERT INTO `xadmin_log` VALUES ('17', '2018-01-26 17:04:14.782098', '127.0.0.1', '6', '慕课网5', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('18', '2018-01-26 17:04:40.844915', '127.0.0.1', '7', '慕课网6', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('19', '2018-01-26 17:05:50.902018', '127.0.0.1', '8', '北京大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('20', '2018-01-26 17:06:25.557799', '127.0.0.1', '9', '南京大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('21', '2018-01-26 17:07:15.268291', '127.0.0.1', '10', '清华大学', 'create', '已添加。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('22', '2018-01-26 20:51:45.382156', '127.0.0.1', '10', '清华大学', 'change', '已修改 category 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('23', '2018-01-26 20:51:49.193775', '127.0.0.1', '10', '清华大学', 'change', '没有字段被修改。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('24', '2018-01-26 20:51:57.667753', '127.0.0.1', '9', '南京大学', 'change', '已修改 category 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('25', '2018-01-26 20:52:04.822119', '127.0.0.1', '8', '北京大学', 'change', '已修改 category 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('26', '2018-01-26 20:52:55.618784', '127.0.0.1', '7', 'ANDERSON\'S BLOG', 'change', '已修改 name，desc 和 category 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('27', '2018-01-27 17:03:30.579678', '127.0.0.1', '1', 'Teacher object', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('28', '2018-01-27 17:04:32.556105', '127.0.0.1', '2', 'zyq', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('29', '2018-01-27 17:07:37.351062', '127.0.0.1', '3', 'yw', 'create', '已添加。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('30', '2018-01-27 17:13:25.356495', '127.0.0.1', '1', 'django入门', 'change', '已修改 org 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('31', '2018-01-27 18:09:40.365598', '127.0.0.1', '1', 'python入门', 'change', '已修改 name，desc，detail 和 image 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('32', '2018-01-27 18:32:09.468049', '127.0.0.1', '1', 'anderson', 'change', '已修改 image 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('33', '2018-01-30 13:43:31.936701', '127.0.0.1', '3', 'yw', 'change', '已修改 image 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('34', '2018-01-30 13:43:47.102530', '127.0.0.1', '2', 'zyq', 'change', '已修改 image 。', '16', '1');
INSERT INTO `xadmin_log` VALUES ('35', '2018-01-30 14:22:11.544629', '127.0.0.1', '7', 'ANDERSON', 'change', '已修改 name 。', '15', '1');
INSERT INTO `xadmin_log` VALUES ('36', '2018-01-31 13:22:53.578797', '127.0.0.1', '1', 'python入门1', 'change', '已修改 name，desc 和 detail 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('37', '2018-01-31 13:23:47.483627', '127.0.0.1', '2', 'python入门2', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('38', '2018-01-31 13:23:55.708392', '127.0.0.1', '1', 'python入门1', 'change', '已修改 image 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('39', '2018-01-31 13:24:15.356482', '127.0.0.1', '3', 'python入门3', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('40', '2018-01-31 13:24:32.743847', '127.0.0.1', '4', 'python入门4', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('41', '2018-01-31 13:24:51.037917', '127.0.0.1', '5', 'python入门5', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('42', '2018-01-31 13:25:07.739906', '127.0.0.1', '6', 'python入门6', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('43', '2018-01-31 13:25:26.381714', '127.0.0.1', '7', 'java入门1', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('44', '2018-01-31 13:25:49.943560', '127.0.0.1', '8', 'java入门2', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('45', '2018-01-31 13:26:15.562058', '127.0.0.1', '9', 'java入门3', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('46', '2018-01-31 13:26:52.750389', '127.0.0.1', '10', '搬砖', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('47', '2018-01-31 13:27:10.883568', '127.0.0.1', '11', 'mysql', 'create', '已添加。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('48', '2018-01-31 14:44:23.196301', '127.0.0.1', '6', 'python入门6', 'change', '已修改 students 和 click_nums 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('49', '2018-01-31 14:44:28.867808', '127.0.0.1', '6', 'python入门6', 'change', '没有字段被修改。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('50', '2018-01-31 14:44:39.195529', '127.0.0.1', '5', 'python入门5', 'change', '已修改 students 和 click_nums 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('51', '2018-01-31 14:44:52.127228', '127.0.0.1', '4', 'python入门4', 'change', '已修改 students 和 click_nums 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('52', '2018-01-31 14:45:01.844758', '127.0.0.1', '3', 'python入门3', 'change', '已修改 students 和 click_nums 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('53', '2018-01-31 14:45:10.303140', '127.0.0.1', '2', 'python入门2', 'change', '已修改 students 和 click_nums 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('54', '2018-01-31 14:45:18.027321', '127.0.0.1', '1', 'python入门1', 'change', '已修改 students 和 click_nums 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('55', '2018-01-31 16:22:59.190496', '127.0.0.1', '1', 'anderson', 'change', '已修改 last_login，first_name，last_name，nickname，gender 和 address 。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('56', '2018-01-31 16:25:22.464825', '127.0.0.1', null, '', 'delete', '批量删除 1 个 用户信息', null, '1');
INSERT INTO `xadmin_log` VALUES ('57', '2018-01-31 17:46:25.911255', '127.0.0.1', '5', '', 'create', '已添加。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('58', '2018-01-31 19:09:20.198325', '127.0.0.1', '1', 'UserCourse object', 'create', 'Added.', '21', '1');
INSERT INTO `xadmin_log` VALUES ('59', '2018-02-04 16:32:34.153683', '127.0.0.1', '1', 'python入门1', 'change', 'Changed tag.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('60', '2018-02-04 16:32:47.253485', '127.0.0.1', '2', 'python入门2', 'change', 'Changed tag.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('61', '2018-02-04 16:33:01.278450', '127.0.0.1', '3', 'python入门3', 'change', 'Changed tag.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('62', '2018-02-05 09:52:47.201069', '127.0.0.1', '1', '第一章 基础', 'change', 'Changed name.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('63', '2018-02-05 09:53:03.583896', '127.0.0.1', '2', '第二章 进阶', 'create', 'Added.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('64', '2018-02-05 09:53:12.970080', '127.0.0.1', '3', '第三章 高级', 'create', 'Added.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('65', '2018-02-05 10:03:44.414638', '127.0.0.1', '1', 'test1', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('66', '2018-02-05 10:03:55.279946', '127.0.0.1', '2', 'test2', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('67', '2018-02-05 10:04:31.674827', '127.0.0.1', '3', 'test1', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('68', '2018-02-05 10:04:38.565865', '127.0.0.1', '4', 'test2', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('69', '2018-02-05 10:04:51.271442', '127.0.0.1', null, '', 'delete', 'Batch delete 1 章节.', null, '1');
INSERT INTO `xadmin_log` VALUES ('70', '2018-02-05 11:56:37.221619', '127.0.0.1', '1', '1-1 test1', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('71', '2018-02-05 11:56:42.203485', '127.0.0.1', '1', '1-1 test1', 'change', 'No fields changed.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('72', '2018-02-05 11:56:50.666606', '127.0.0.1', '2', '1-2 test2', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('73', '2018-02-05 11:56:56.241845', '127.0.0.1', '3', '2-1 test1', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('74', '2018-02-05 11:57:01.784103', '127.0.0.1', '4', '2-2 test2', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('75', '2018-02-05 12:48:36.315503', '127.0.0.1', '1', 'CourseResource object', 'create', 'Added.', '13', '1');
INSERT INTO `xadmin_log` VALUES ('76', '2018-02-05 13:06:51.866337', '127.0.0.1', '1', 'python入门1', 'change', 'Changed notice and teacher_tell.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('77', '2018-02-05 13:07:32.050009', '127.0.0.1', '1', 'python入门1', 'change', 'Changed teacher.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('78', '2018-02-05 13:09:23.005665', '127.0.0.1', '2', 'zyq', 'change', 'No fields changed.', '16', '1');
INSERT INTO `xadmin_log` VALUES ('79', '2018-02-05 13:10:03.973005', '127.0.0.1', '2', 'zyq', 'change', 'Changed image.', '16', '1');
INSERT INTO `xadmin_log` VALUES ('80', '2018-02-07 11:09:51.008164', '127.0.0.1', '1', '1-1 test1', 'change', 'Changed url.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('81', '2018-02-07 12:38:23.420487', '127.0.0.1', '1', '1-1 test1', 'change', 'Changed url.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('82', '2018-02-07 15:30:13.572049', '127.0.0.1', '2', '1-2 test2', 'change', 'Changed url.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('83', '2018-02-07 15:30:36.233590', '127.0.0.1', '3', '2-1 test1', 'change', 'Changed url.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('84', '2018-02-07 15:31:04.587869', '127.0.0.1', '4', '2-2 test2', 'change', 'Changed url.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('85', '2018-02-07 15:46:40.968418', '127.0.0.1', '1', '1-1 Love the way you lie & I need a doctor', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('86', '2018-02-07 15:47:17.211129', '127.0.0.1', '2', '1-2 蓝洁瑛 cut', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('87', '2018-02-07 15:47:42.429966', '127.0.0.1', '3', '2-1 我们不是相爱吗', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('88', '2018-02-07 15:48:14.698990', '127.0.0.1', '4', '2-2 sjh & kjk', 'change', 'Changed name.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('89', '2018-02-07 15:48:53.703925', '127.0.0.1', '1', '第一章', 'change', 'Changed name.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('90', '2018-02-07 15:49:00.829937', '127.0.0.1', '2', '第二章', 'change', 'Changed name.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('91', '2018-02-07 15:49:47.489080', '127.0.0.1', '1', 'Amazon S3 测试', 'change', 'Changed name.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('92', '2018-02-07 18:12:27.083244', '127.0.0.1', '2', '七牛云 测试', 'change', 'Changed teacher, name, notice and teacher_tell.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('93', '2018-02-07 18:12:46.016688', '127.0.0.1', '4', '周杰伦', 'create', 'Added.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('94', '2018-02-07 18:13:10.826816', '127.0.0.1', '5', '邓紫棋', 'create', 'Added.', '11', '1');
INSERT INTO `xadmin_log` VALUES ('95', '2018-02-07 18:13:37.869712', '127.0.0.1', '5', '发如雪', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('96', '2018-02-07 18:14:04.210217', '127.0.0.1', '6', '等你下课', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('97', '2018-02-07 18:14:36.902773', '127.0.0.1', '7', '泡沫', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('98', '2018-02-07 18:14:53.999357', '127.0.0.1', '8', '盲点', 'create', 'Added.', '12', '1');
INSERT INTO `xadmin_log` VALUES ('99', '2018-02-07 19:28:36.945926', '127.0.0.1', '3', 'yw', 'change', 'Changed click_nums and fav_nums.', '16', '1');
INSERT INTO `xadmin_log` VALUES ('100', '2018-02-07 19:28:45.498358', '127.0.0.1', '2', 'zyq', 'change', 'Changed click_nums and fav_nums.', '16', '1');
INSERT INTO `xadmin_log` VALUES ('101', '2018-02-07 19:28:59.989137', '127.0.0.1', '1', 'anderson', 'change', 'Changed click_nums and fav_nums.', '16', '1');
INSERT INTO `xadmin_log` VALUES ('102', '2018-02-07 19:44:54.990824', '127.0.0.1', '3', 'python入门3', 'change', 'Changed teacher, notice and teacher_tell.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('103', '2018-02-07 19:46:55.500299', '127.0.0.1', '4', 'python入门4', 'change', 'Changed teacher, tag, notice and teacher_tell.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('104', '2018-02-07 19:47:11.565428', '127.0.0.1', '5', 'python入门5', 'change', 'Changed teacher, tag, notice and teacher_tell.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('105', '2018-02-07 19:47:27.519688', '127.0.0.1', '10', '搬砖', 'change', 'Changed teacher, tag, notice and teacher_tell.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('106', '2018-02-07 19:51:37.536712', '127.0.0.1', '10', '搬砖', 'change', 'Changed image.', '10', '1');
INSERT INTO `xadmin_log` VALUES ('107', '2018-02-10 17:34:46.818306', '127.0.0.1', '2', 'test', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('108', '2018-02-10 17:35:03.299143', '127.0.0.1', '3', '1111111111', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('109', '2018-02-10 17:35:59.648341', '127.0.0.1', '4', '慕课网（IMOOC）...', 'create', '已添加。', '20', '1');
INSERT INTO `xadmin_log` VALUES ('110', '2018-02-13 18:03:08.278123', '127.0.0.1', '1', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('111', '2018-02-13 18:03:19.869932', '127.0.0.1', '2', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('112', '2018-02-13 18:03:31.088807', '127.0.0.1', '3', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('113', '2018-02-13 18:03:42.576111', '127.0.0.1', '4', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('114', '2018-02-13 18:03:54.083061', '127.0.0.1', '5', 'Banner object', 'create', '已添加。', '9', '1');
INSERT INTO `xadmin_log` VALUES ('115', '2018-02-13 18:05:56.765842', '127.0.0.1', '10', '搬砖', 'change', '已修改 is_banner 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('116', '2018-02-13 18:06:49.620035', '127.0.0.1', '11', 'mysql', 'change', '已修改 tag，notice，teacher_tell 和 is_banner 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('117', '2018-02-14 20:03:26.570265', '127.0.0.1', '1', '编辑部', 'create', '已添加。', '3', '1');
INSERT INTO `xadmin_log` VALUES ('118', '2018-02-14 20:08:15.736152', '127.0.0.1', '1', '编辑部', 'change', '没有字段被修改。', '3', '1');
INSERT INTO `xadmin_log` VALUES ('119', '2018-02-14 20:17:43.669356', '127.0.0.1', '4', 'sp', 'change', '已修改 last_login 和 is_staff 。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('120', '2018-02-14 20:25:04.137043', '127.0.0.1', '1', '编辑部', 'change', '已修改 permissions 。', '3', '1');
INSERT INTO `xadmin_log` VALUES ('121', '2018-02-14 20:26:06.717755', '127.0.0.1', '4', 'sp', 'change', '已修改 last_login 和 groups 。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('122', '2018-02-14 20:27:19.227832', '127.0.0.1', '4', 'sp', 'change', '已修改 first_name 和 last_name 。', '7', '1');
INSERT INTO `xadmin_log` VALUES ('123', '2018-02-15 18:03:58.783668', '127.0.0.1', '10', '搬砖', 'change', '没有字段被修改。', '27', '1');
INSERT INTO `xadmin_log` VALUES ('124', '2018-02-15 18:55:29.074625', '127.0.0.1', '1', 'Amazon S3 测试', 'change', '已修改 announcement 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('125', '2018-02-15 18:55:48.605960', '127.0.0.1', '1', 'Amazon S3 测试', 'change', '已修改 announcement 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('126', '2018-02-15 18:56:50.294347', '127.0.0.1', '2', '七牛云 测试', 'change', '已修改 announcement 。', '10', '1');
INSERT INTO `xadmin_log` VALUES ('127', '2018-02-15 19:24:29.816878', '127.0.0.1', null, '', 'delete', '批量删除 1 个 课程', null, '1');
INSERT INTO `xadmin_log` VALUES ('128', '2018-02-23 11:04:47.998726', '127.0.0.1', '10', '搬砖', 'change', '已修改 detail 和 announcement 。', '27', '1');
INSERT INTO `xadmin_log` VALUES ('129', '2018-02-23 11:05:06.424654', '127.0.0.1', '10', '搬砖', 'change', '没有字段被修改。', '27', '1');

-- ----------------------------
-- Table structure for xadmin_usersettings
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_usersettings`;
CREATE TABLE `xadmin_usersettings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `key` varchar(256) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_usersettings_user_id_edeabe4a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_usersettings
-- ----------------------------
INSERT INTO `xadmin_usersettings` VALUES ('1', 'dashboard:home:pos', '', '1');
INSERT INTO `xadmin_usersettings` VALUES ('2', 'site-theme', '/static/xadmin/css/themes/bootstrap-xadmin.css', '1');
INSERT INTO `xadmin_usersettings` VALUES ('3', 'dashboard:home:pos', '', '4');
INSERT INTO `xadmin_usersettings` VALUES ('4', 'courses_bannercourse_editform_portal', 'box-0,lesson_set-group,courseresource_set-group', '1');

-- ----------------------------
-- Table structure for xadmin_userwidget
-- ----------------------------
DROP TABLE IF EXISTS `xadmin_userwidget`;
CREATE TABLE `xadmin_userwidget` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `page_id` varchar(256) NOT NULL,
  `widget_type` varchar(50) NOT NULL,
  `value` longtext NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` (`user_id`),
  CONSTRAINT `xadmin_userwidget_user_id_c159233a_fk_users_userprofile_id` FOREIGN KEY (`user_id`) REFERENCES `users_userprofile` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of xadmin_userwidget
-- ----------------------------
