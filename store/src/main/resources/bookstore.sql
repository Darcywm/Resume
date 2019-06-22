/*
Navicat MySQL Data Transfer

Source Server         : zdd
Source Server Version : 50720
Source Host           : localhost:3306
Source Database       : bookstore

Target Server Type    : MYSQL
Target Server Version : 50720
File Encoding         : 65001

Date: 2019-04-05 10:42:33
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for product_category
-- ----------------------------
DROP TABLE IF EXISTS `product_category`;
CREATE TABLE `product_category` (
  `cate_id` int(16) NOT NULL AUTO_INCREMENT,
  `parent_id` int(16) DEFAULT NULL,
  `name` varchar(30) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `sort_order` int(4) DEFAULT NULL,
  `is_parent` tinyint(1) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`cate_id`),
  KEY `parent_id` (`parent_id`),
  CONSTRAINT `product_category_ibfk_1` FOREIGN KEY (`parent_id`) REFERENCES `product_category` (`cate_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_category
-- ----------------------------
INSERT INTO `product_category` VALUES ('2', null, '新鲜蔬菜', '1', '1', '0', '2018-11-01 09:43:46', '2018-11-01 09:43:49');
INSERT INTO `product_category` VALUES ('3', null, '时令水果', '1', '1', '0', '2018-11-01 09:46:08', '2018-11-01 09:46:11');
INSERT INTO `product_category` VALUES ('4', null, '水产海鲜', '1', '1', '0', '2018-11-01 09:46:33', '2018-11-01 09:46:35');
INSERT INTO `product_category` VALUES ('5', null, '品质肉禽蛋', '1', '1', '0', '2018-11-01 09:47:09', '2018-11-01 09:47:12');
INSERT INTO `product_category` VALUES ('6', null, '童书', '1', '1', '0', '2018-11-01 09:47:44', '2018-11-01 09:47:48');
INSERT INTO `product_category` VALUES ('7', null, '小说', '1', '1', '0', '2018-11-01 15:50:56', '2018-11-01 15:50:58');

-- ----------------------------
-- Table structure for product_desc
-- ----------------------------
DROP TABLE IF EXISTS `product_desc`;
CREATE TABLE `product_desc` (
  `product_id` int(11) NOT NULL,
  `product_desc` text,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product_desc
-- ----------------------------
INSERT INTO `product_desc` VALUES ('1', '<p><br/><a href=\"http://store.dangdang.com/gys_04099_dytg\" style=\"color: rgb(26, 102, 179); font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);\"><img src=\"/ueditor/jsp/upload/image/20181124/1543065820217043526.jpg\"/></a></p>', '2018-11-24 21:23:43', '2018-11-24 21:23:43');
INSERT INTO `product_desc` VALUES ('185', '<ul class=\"key clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>开 本：16开</p></li><li><p>纸 张：胶版纸</p></li><li><p>包 装：平装-胶订</p></li><li><p>是否套装：否</p></li><li><p>国际标准书号ISBN：9787111573319</p></li><li><p>所属分类：<span class=\"lie\" style=\"display: block; padding: 0px; font-family: sinsun; clear: both;\"><a target=\"_bland\" href=\"http://category.dangdang.com/cp01.00.00.00.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">图书</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.54.00.00.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">计算机/网络</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.54.06.00.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">程序设计</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.54.06.06.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">Java</a></span></p></li></ul><p><a class=\"browser browser_op\" style=\"height: 0px; font-size: 0px; line-height: 0; overflow: hidden; color: rgb(100, 100, 100); position: absolute; right: -90px; top: -58px; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; white-space: normal; background-color: rgb(255, 255, 255);\"></a></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>快速直达</p></li><li><p><a><span class=\"icon\" style=\"position: absolute; left: 0px; top: 15px; display: block; width: 8px; height: 8px; overflow: hidden; background: url(&quot;../images/product_sprites.png&quot;) 0px -500px no-repeat;\"></span>内容简介</a></p></li><li><p><a style=\"color: rgb(255, 40, 50);\"><span class=\"icon\" style=\"position: absolute; left: -12px; top: 15px; display: block; width: 7px; height: 7px; overflow: hidden; background-image: url(&quot;../images/product_sprites.png&quot;); background-position: -15px -500px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span>目　　录</a></p></li><li><p><a><span class=\"icon\" style=\"position: absolute; left: 0px; top: 15px; display: block; width: 8px; height: 8px; overflow: hidden; background: url(&quot;../images/product_sprites.png&quot;) 0px -500px no-repeat;\"></span>前　　言</a></p></li></ul><p><a style=\"color: rgb(100, 100, 100);\"><span style=\"display: block; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 18px; font-family: &quot;Microsoft Yahei&quot;; margin: 0px auto; text-align: center;\">下载免费当当读书</span></a></p><p><a href=\"http://book.dangdang.com/20181106_1hu0\" target=\"_blank\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\"><img src=\"/ueditor/jsp/upload/image/20181111/1541927607930084356.jpg\" alt=\"\"/></a></p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">内容简介</span></p><p>本书是Java领域有影响力和价值的著作之一，由拥有20多年教学与研究经验的Java技术专家撰写（获Jolt大奖），与《Java编程思想》齐名，10余年全球畅销不衰，广受好评。第10版根据JavaSE8全面更新，同时修正了第9版中的不足，系统全面讲解了Java语言的核心概念、语法、重要特性和开发方法，包含大量案例，实践性强。</p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">目　　录</span></p><p>目　　录<br/>译者序<br/>前言<br/>第1章　Java SE 8的流库 1<br/>1.1　从迭代到流的操作 1<br/>1.2　流的创建 3<br/>1.3　f?ilter、map和f?latMap方法 6<br/>1.4　抽取子流和连接流 8<br/>1.5　其他的流转换 8<br/>1.6　简单约简 9<br/>1.7　Optional类型 11<br/>1.7.1　如何使用Optional值 11<br/>1.7.2　不适合使用Optional值的方式 12<br/>1.7.3　创建Optional值 13</p><p><a class=\"section_show_more\" style=\"color: rgb(80, 80, 80); padding: 0px 15px; height: 22px; overflow: hidden; line-height: 22px; background: url(&quot;../images/product_sprites.png&quot;) 0px -95px repeat-x; border: 1px solid rgb(230, 230, 230); float: right; border-radius: 3px; margin-left: 10px; font-size: 12px;\">显示全部信息</a></p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">前　　言</span></p><p><span style=\"display: inline;\">前　　言致读者本书是按照Java SE 8完全更新后的《Java核心技术　卷Ⅱ　高级特性（原书第10版）》。卷Ⅰ主要介绍了Java语言的一些关键特性；而本卷主要介绍编程人员进行专业软件开发时需要了解的高级主题。因此，与本书卷Ⅰ和之前的版本一样，我们仍将本书定位于用Java技术进行实际项目开发的编程人员。<br/>编写任何一本书籍都难免会有一些错误或不准确的地方。我们非常乐意听到读者的意见。当然，我们更希望对本书问题的报告只听到一次。为此，我们创建了一个FAQ、bug修正以及应急方案的网站http:// horstmann.com/corejava。你可以在bug报告网页（该网页的目的是鼓励读者阅读以前的报告）的末尾处添加bug报告，以此来发布bug和问题并给出建议，以便我们改进本书将来版本的质量。<br/>内容提要本书中的章节大部分是相互独立的。你可以研究自己最感兴趣的主题，并可以按照任意顺序阅读这些章节。<br/>在第1章中，你将学习Java 8的流库，它带来了现代风格的数据处理机制，即只需指定想要的结果，而无须详细描述应该如何获得该结果。这使得流库可以专注于优化的计算策略，对于优化并发计算来说，这显得特别有利。</span></p><p><a class=\"section_show_more\" style=\"color: rgb(80, 80, 80); padding: 0px 15px; height: 22px; overflow: hidden; line-height: 22px; background: url(&quot;../images/product_sprites.png&quot;) 0px -95px repeat-x; border: 1px solid rgb(230, 230, 230); float: right; border-radius: 3px; margin-left: 10px; font-size: 12px;\">显示全部信息</a></p><p><br/></p>', '2018-11-11 17:13:52', '2018-11-11 17:13:52');
INSERT INTO `product_desc` VALUES ('186', '<ul class=\"key clearfix list-paddingleft-2\" style=\"list-style-type: none;\"><li><p>开 本：16开</p></li><li><p>纸 张：胶版纸</p></li><li><p>包 装：平装-胶订</p></li><li><p>是否套装：否</p></li><li><p>国际标准书号ISBN：9787115488435</p></li><li><p>丛书名：国外著名高等院校信息科学与技术优秀教材</p></li><li><p>所属分类：<span class=\"lie\" style=\"display: block; padding: 0px; font-family: sinsun; clear: both;\"><a target=\"_bland\" href=\"http://category.dangdang.com/cp01.00.00.00.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">图书</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.54.00.00.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">计算机/网络</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.54.92.00.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">人工智能</a>&gt;<a target=\"_bland\" href=\"http://category.dangdang.com/cp01.54.92.02.00.00.html\" class=\"green\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\">机器学习</a></span></p></li></ul><p><a class=\"browser browser_op\" style=\"height: 0px; font-size: 0px; line-height: 0; overflow: hidden; color: rgb(100, 100, 100); position: absolute; right: -90px; top: -58px; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; white-space: normal; background-color: rgb(255, 255, 255);\"></a></p><ul style=\"list-style-type: none;\" class=\" list-paddingleft-2\"><li><p>快速直达</p></li><li><p><a><span class=\"icon\" style=\"position: absolute; left: 0px; top: 15px; display: block; width: 8px; height: 8px; overflow: hidden; background: url(&quot;../images/product_sprites.png&quot;) 0px -500px no-repeat;\"></span>编辑推荐</a></p></li><li><p><a><span class=\"icon\" style=\"position: absolute; left: 0px; top: 15px; display: block; width: 8px; height: 8px; overflow: hidden; background: url(&quot;../images/product_sprites.png&quot;) 0px -500px no-repeat;\"></span>内容简介</a></p></li><li><p><a><span class=\"icon\" style=\"position: absolute; left: 0px; top: 15px; display: block; width: 8px; height: 8px; overflow: hidden; background: url(&quot;../images/product_sprites.png&quot;) 0px -500px no-repeat;\"></span>作者简介</a></p></li><li><p><a style=\"color: rgb(255, 40, 50);\"><span class=\"icon\" style=\"position: absolute; left: -12px; top: 15px; display: block; width: 7px; height: 7px; overflow: hidden; background-image: url(&quot;../images/product_sprites.png&quot;); background-position: -15px -500px; background-size: initial; background-repeat: no-repeat; background-attachment: initial; background-origin: initial; background-clip: initial;\"></span>目　　录</a></p></li></ul><p><a style=\"color: rgb(100, 100, 100);\"><span style=\"display: block; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 18px; font-family: &quot;Microsoft Yahei&quot;; margin: 0px auto; text-align: center;\">免费下载读书APP</span></a></p><p><a href=\"http://book.dangdang.com/20181106_1hu0\" target=\"_blank\" style=\"text-decoration-line: none; color: rgb(26, 102, 179);\"><img src=\"/ueditor/jsp/upload/image/20181111/1541928563897070848.jpg\" alt=\"\"/></a></p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">编辑推荐</span></p><p>图文详细、示例丰富，同时配备诸多附加资源，非常适合作为自学和教学指南。 美国经典教材，在Amazon上，被评价为自Russell &amp; Norvig的《人工智能：一种现代方法》之后更好的教材，更加适合本科生使用。 当前，人工智能的发展进入了新的历史阶段，成为科研、教学和创业等领域关注的热点。我国正在大力培养人工智能领域的专业人才，一些高校成立了人工智能学院，还有许多高校开设了人工智能相关专业。 本书是作者结合多年教学经验、精心撰写的一本人工智能教科书，堪称“人工智能的百科全书”。全书涵盖了人工智能简史、搜索方法、知情搜索、博弈中的搜索、人工智能中的逻辑、知识表示、产生式系统、专家系统、机器学习和神经网络、遗传算法、自然语言处理、自动规划、机器人技术、高级计算机博弈、人工智能的历史和未来等主题。 本书提供了丰富的教学配套资源，适合作为高等院校人工智能相关专业的教材，也适合对人工智能相关领域感兴趣的读者阅读和参考。 ● 基于人工智能的理论基础，展示全面、新颖、丰富多彩且易于理解的人工智能知识体系。 ● 加入关于机器人和机器学习的新章节，并在自然语言处理在自然语言处理部分包括了关于语音理解和隐喻的小节。 ● 给出诸多的示例、应用程序、全彩图片和人物轶事，以激发读者的学习兴趣。 ● 通过实际应用引入重 要的人工智能概念，例如机器人技术、人工智能在视频游戏中的应用、神经网络、机器学习等。 ● 包含300多幅图，详细描述了人工智能方法在实际工作中的问题，并给出了部分习题的解答。 ● 提供本书所涉及的资源、仿真和书中的图。 ● 为采用本书作为教材的教师提供丰富的教学支持资源，包括习题解答、教学PPT等。 配套资源 ● 本书附录D“应用程序和数据”提到的应用程序示例、用于神经网络训练的练习数据和若干高级计算问题概览。 ● 本书附录E“部分练习的答案”的英文版PDF和图解。 ● 本书中的全部彩图文件。 ● 本书的Prolog示例源代码。 ● 供教师使用的教学PPT。 以上资源请到异步社区（www.epubit.com）下载。 为使用本书作为教材的教师提供的教学资源： ● 教学PPT。 ● 教师指导手册（电子版，包括本书配套习题的完整解答）。 请通过contact@epubit.com.cn联系申请。&nbsp;</p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">内容简介</span></p><p>作为计算机科学的一个分支，人工智能主要研究、开发用于模拟、延伸和扩展人类智能的理论、方法、技术及应用系统，涉及机器人、语音识别、图像识别、自然语言处理和专家系统等方向。 本书包括引言、基础知识、基于知识的系统、高级专题以及现在和未来五部分内容。*部分从人工智能的定义讲起，就人工智能的早期历史、思维和智能的内涵、图灵测试、启发法、新千年人工智能的发展进行了简要论述。第二部分详细讲述了人工智能中的盲目搜索、知情搜索、博弈中的搜索、人工智能中的逻辑、知识表示和产生式系统等基础知识。第三部分介绍并探究了人工智能领域的成功案例，如DENDRAL、MYCIN、EMYCIN等经典的专家系统，振动故障诊断、自动牙科识别等新的专家系统，以及受到自然启发的搜索等。第四部分介绍了自然语言处理和自动规划等高级专题。第五部分对人工智能的历史和现状进行了梳理，回顾了几十年来人工智能所取得的诸多成就，并对其未来进行了展望。 本书系统、全面地涵盖了人工智能的相关知识，既简明扼要地介绍了这一学科的基础知识，也对自然语言处理、自动规划、神经网络等内容进行了拓展，更辅以实例，可以帮助读者扎扎实实打好基础。本书特色鲜明、内容易读易学，适合人工智能相关领域和对该领域感兴趣的读者阅读，也适合高校计算机专业的教师和学生参考。</p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">作者简介</span></p><p>作者简介 史蒂芬·卢奇（Stephen Lucci） 拥有纽约市立大学的博士学位，目前在纽约市立大学教授计算机科学课程。他曾在高性能计算领域发表了多篇论文，并且是NASA 发起的MU-SPIN 项目的学术带头人。MU-SPIN 项目旨在为NASA 培养下一代*尖的科学家和工程师。 丹尼·科佩克（Danny Kopec） 拥有爱丁堡大学博士学位，目前在纽约市立大学布鲁克林学院和纽约市立大学研究生中心任教。他发表过多篇论文，并出版过几本书，还是一位国际象棋大师。 译者简介 林赐 软件设计师、网络工程师，毕业于渥太华大学系统科学硕士专业，已翻译出版《Python神经网络编程》等多本技术图书。</p><p><span style=\"float: left; border-left: 2px solid rgb(255, 40, 50); padding: 0px 30px 2px 6px; background: url(&quot;../images/product_sprites.png&quot;) right -525px no-repeat rgb(229, 229, 229); height: 22px; margin-bottom: -2px; position: relative; font-variant-numeric: normal; font-variant-east-asian: normal; font-stretch: normal; font-size: 14px; line-height: 22px; font-family: &quot;Microsoft Yahei&quot;; color: rgb(50, 50, 50);\">目　　录</span></p><p>第 一部分 引 言&nbsp;<br/><br/>第　1章 人工智能概述　2<br/><br/>1.0　引言　2<br/><br/>1.0.1　人工智能的定义　3<br/><br/>1.0.2　思维是什么？智能是什么？　3<br/><br/>1.1　图灵测试　5<br/><br/>1.1.1　图灵测试的定义　6<br/></p><p><a class=\"section_show_more\" style=\"color: rgb(80, 80, 80); padding: 0px 15px; height: 22px; overflow: hidden; line-height: 22px; background: url(&quot;../images/product_sprites.png&quot;) 0px -95px repeat-x; border: 1px solid rgb(230, 230, 230); float: right; border-radius: 3px; margin-left: 10px; font-size: 12px;\">显示全部信息</a></p><p><br/></p>', '2018-11-11 17:29:51', '2018-11-11 17:29:51');
INSERT INTO `product_desc` VALUES ('188', '<p>在这里填写书籍详情</p>', '2018-11-26 22:06:08', '2018-11-26 22:06:08');
INSERT INTO `product_desc` VALUES ('189', '<p><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">1、“万经之王”的典藏版本：中国的智慧书和哲学书，权威的注释，精简的译文，透露人生的智慧和命运的哲理，尤其为现代人解读当下的困惑，参透究极人生意义。</span><br/><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　2、无障碍阅读的经典版本：本书中的注释、翻译都人性化地考量到读者的阅读基础，让人在轻松自在的状态下修习中华至高经典！文字如师如友，让听者如沐春风。</span><br/><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　3、解析高深哲学的导读版本：通过*简单的文字开始修习关于宇宙万物或世界本源的重要理论之一——“道”，对大到人生、命运、思想等或者小到为人、做事、管理等命题都有启发。本书形成一个框架和引导，让人们对很高深的问题都有简单的入门阅读和思考。</span><br/><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　商业与治国之大道：</span><br/><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　马云和各界奇人异士交往，俨然打通了道家、佛教、西方管理、共产党思维，以一本《道德经》建立了一个商业王国。——凤凰网</span><br/><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　《道德经》是我国传统文化经典，其中蕴含着许多治国理政辩证法。“治大国如烹小鲜”这句话，就被*总书记在多个场合强调过。宣传工作，许多宣传理念和方法，也能从《道德经》中找到思想痕迹。——中新网&nbsp;</span></p><p><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\"><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">《道德经》是中华文化的经典著作，历代学者都将研读《道德经》作为必修功课。《道德经》共八十一章，多为韵文，分为“道经”与“德经”两大部分。《道德经》五千言，篇幅不长而论述精辟，其中含义深远，思想广博。其内容从多方面论述宇宙的本体、万物之源、自然规律等等，并将其意义融入到现实自然、社会、国家、民生等众多方面。大致分为：论道、治国、修身、砭时、养生、议兵六大方向。</span><br/><span style=\"color: rgb(101, 101, 101); text-transform: none; text-indent: 0px; letter-spacing: normal; font-family: &quot;Hiragino Sans GB&quot;, Verdana, Simsun; font-size: 14px; font-style: normal; font-weight: 400; word-spacing: 0px; float: none; display: inline !important; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: normal; -webkit-text-stroke-width: 0px; text-decoration-style: initial; text-decoration-color: initial;\">　　本书《道德经》原文遵照中华书局发行的通行版本，每一章以原文开头，之后有“注释”和“译文”两个板块，对字词的注释简明扼要，对原文的翻译精妙准确，同时融入通俗易懂的解读思想。另外，本书除了常有的字词注释和译文之外，还加入了“河上公”对道德经的注解，希望这位黄老学派的集大成者的见解，能为读者们抛砖引玉，以其为伴为镜，协助自我来更好地阅读并理解《道德经》的主旨思想。</span></span></p>', '2018-11-30 12:56:09', '2018-11-30 13:39:39');

-- ----------------------------
-- Table structure for product_info
-- ----------------------------
DROP TABLE IF EXISTS `product_info`;
CREATE TABLE `product_info` (
  `product_id` int(16) NOT NULL AUTO_INCREMENT,
  `product_category_id` int(16) DEFAULT NULL,
  `store_id` int(16) DEFAULT NULL,
  `name` varchar(100) DEFAULT NULL,
  `outline` varchar(255) DEFAULT NULL COMMENT '简介',
  `detail` varchar(500) DEFAULT NULL COMMENT '商品详情',
  `press` varchar(20) DEFAULT NULL COMMENT '出版社',
  `publish_date` datetime DEFAULT NULL,
  `size` varchar(10) DEFAULT NULL,
  `version` varchar(10) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `translator` varchar(30) DEFAULT NULL COMMENT '翻译者',
  `isbn` varchar(50) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `pages` int(10) DEFAULT NULL COMMENT '总页数',
  `catalog` varchar(255) DEFAULT NULL COMMENT '目录',
  `market_price` decimal(10,2) DEFAULT NULL COMMENT '市场价\\定价',
  `member_price` decimal(10,2) DEFAULT NULL COMMENT '会员价格',
  `deal_mount` int(10) DEFAULT NULL COMMENT '成交量',
  `look_mount` int(10) DEFAULT NULL COMMENT '浏览量',
  `discount` decimal(5,2) DEFAULT NULL,
  `image_url` varchar(100) DEFAULT NULL COMMENT '版面图片',
  `store_mount` int(10) DEFAULT NULL COMMENT '库存数量',
  `store_time` datetime DEFAULT NULL COMMENT '入库时间',
  `pack_style` varchar(50) DEFAULT NULL COMMENT '封装方式',
  `is_shelf` int(2) DEFAULT NULL COMMENT '是否上架',
  PRIMARY KEY (`product_id`),
  KEY `product_category_id` (`product_category_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of book_info
-- ----------------------------
INSERT INTO `product_info` VALUES ('1', '2', '1', '新鲜现挖蜜薯', 'Python编程 从入门到实践【图灵程序设计丛书】Python3.5编程入门图书 机器学习 数据处理 网络爬虫热门编程语言 从基本概念到完整项目开发 帮助零基础读者迅速掌握Python编程 附赠源代码文件', '上到有编程基础的程序员，下到10岁少年，想入门Python并达到可以开发实际项目的水平，本书是读者*！ 本书是一本全面的从入门到实践的Python编程教程，带领读者快速掌握编程基础知识、编写出能解决实际问题的代码并开发复杂项目。 书中内容分为基础篇和实战篇两部分。基础篇介绍基本的编程概念，如列表、字典、类和循环，并指导读者编写整洁且易于理解的代码。另外还介绍了如何让程序能够与用户交互，以及如何在代码运行前进行测试。实战篇介绍如何利用新学到的知识开发功能丰富的项目：2D游戏《外星人入侵》，数据可视化实战，Web应用程序。', '人民邮电出版社', '2016-07-01 00:00:00', '128开', null, '[美]埃里克・马瑟斯（Eric Matthes）', null, '9787115428028', '61.50', null, '', '89.00', null, '200', '208', '6.90', 'http://img3m0.ddimg.cn/67/4/24003310-1_b_5.jpg', '199', '2018-11-01 14:58:43', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('2', '2', '1', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）', '深入理解Java虚拟机：JVM高级特性与最佳实践（第2版）超级畅销书全新升级，第1版两年内印刷近10次，Java图书领域公认的经典著作，繁体版台湾发行', '本书第1版两年内印刷近10次，4家网上书店的评论近4?000条，98%以上的评论全部为5星级的好评，是整个Java图书领域公认的经典著作和超级畅销书，繁体版在台湾也十分受欢迎。第2版在第1版的基础上做了很大的改进：根据*的JDK 1.7对全书内容进行了全面的升级和补充；增加了大量处理各种常见JVM问题的技巧和*实践；增加了若干与生产环境相结合的实战案例；对第1版中的错误和不足之处的修正；等等。第2版不仅技术更新、内容更丰富，而且实战性更强。', '机械工业出版社', '2013-06-01 00:00:00', '16开', null, '周志明', null, '9787111421900', '72.90', null, '', '79.00', null, '300', '301', '9.20', 'http://img3m1.ddimg.cn/77/14/23259731-1_b_0.jpg', '200', '2018-11-01 14:58:44', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('3', '2', '1', 'C Primer Plus 第6版 中文版 C语言入门经典教程', 'C Primer Plus 第6版 中文版 C语言入门经典教程畅销30余年的C语言编程入门教程 近百万程序员的C语言编程启蒙教程 技术大牛案头常备的工具书 针对C11标准库更新 蔡学镛 孟岩 高博倾力推荐', '经久不衰的C语言畅销经典教程针对C11标准进行全面更新《C Primer Plus（第6版）中文版》是一本经过仔细测试、精心设计的完整C语言教程，它涵盖了C语言编程中的核心内容。《C Primer Plus（第6版）中文版》作为计算机科学的经典著作，讲解了包含结构化代码和自顶向下设计在内的程序设计原则。与以前的版本一样，作者的目标仍旧是为读者提供一本入门型、条理清晰、见解深刻的C语言教程。作者把基础的编程概念与C语言的细节很好地融合在一起，并通过大量短小精悍的示例同时演示一两个概念，通过学以致用的方式鼓励读者掌握新的主题。每章末尾的复习题和编程练习题进一步强化了重要的信息，有助于读者理解和消化那些难以理解的概念。本书采用了友好、易于使用的编排方式，不仅适合打算认真学习C语言编程的学生阅读，也适合那些精通其他编程语言，但希望', '人民邮电出版社', '2016-04-01 00:00:00', '16开', null, '[美]史蒂芬・普拉达（Stephen Prata）', null, '9787115390592', '79.20', null, '', '89.00', null, '100', '100', '8.90', 'http://img3m2.ddimg.cn/43/13/23958142-1_b_12.jpg', '200', '2018-11-01 14:58:44', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('4', '2', '1', 'C++ Primer Plus(第6版)中文版(畅销30年C++必读经典教程全新升级，蔡学镛、孟岩、高博倾力推荐)', 'C++ Primer Plus(第6版)中文版(畅销30年C++必读经典教程全新升级，蔡学镛、孟岩、高博倾力推荐)畅销20余年的C++编程入门教程 近百万程序员的C++编程启蒙教程 技术大牛案头常备的工具书 针对C++11标准库更新 蔡学镛 孟岩 高博倾力推荐', '一本经久不衰的C 畅销经典教程；首本支持C 11新标准的程序设计图书。 它被誉为 开发人员学习C 的必备教程，没有之一 ！ Amazon网站 Language 类销售排名第三的超级畅销书，之前版本在美国销售超10万！ 《C Primer Plus(第6版)中文版》可以说是一本面向从未学习过C语言甚至是从未学习过编程的人的入门书籍，它的首章从基础内容讲起，先介绍了传统编程的规则，后面才着重讲解有关面向对象 C 的精髓之一 的有关内容。整个书的结构安排较为合理，难度爬升较慢。 如果你是一个从未学过C语言（或者压根没学会C）的读者，那么，我相信这本书更适合你。', '人民邮电出版社', '2012-07-01 00:00:00', '16开', null, '[美]Stephen Prata 著', null, '9787115279460', '88.10', null, '', '99.00', null, '100', '100', '8.90', 'http://img3m4.ddimg.cn/40/14/22783504-1_b_4.jpg', '200', '2018-11-01 14:58:44', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('5', '2', '1', 'Java从入门到精通（第4版）（附光盘）', 'Java从入门到精通（第4版）（附光盘）畅销书全新改版 累计63次重印 30万读者选择的 java入门经典书 持续八年畅销 全行业优秀畅销书 长期位居java 销售排行榜前列 好学、好用 32小时视频 732个经典实例 369项,', '随书附赠小白手册（电子版） 下载链接 http://pan.baidu.com/s/1mhLe8GS 软件开发视频大讲堂 丛书系清华社 视频大讲堂 重点大系之一。该大系包括多个子系列，每个子系列的图书在其同品种的图书中销售名列前茅，其中： 4个品种荣获 全行业优秀畅销品种 1个品种荣获2012年清华大学出版社 专业畅销书 一等奖 绝大多数品种在 全国计算机零售图书排行榜 同品种排行中名列前茅 截至目前该大系累计销售超过130万册 该大系已成为近年来清华社计算机专业基础类零售图书*畅销的品牌之一 软件开发视频大讲堂 系列作为清华社 视频大讲堂 大系的子系列之一，继承和创新了清华社 视频大讲堂 大系的编写模式、写作风格和优良品质。本书突出了以下内容： 总长总时长32小时同步视频演示讲解，可反复观摩，让学习更为快捷', '清华大学出版社', '2016-09-21 00:00:00', '16开', null, '明日科技', null, '9787302444541', '61.20', null, '', '69.60', null, '100', '100', '8.80', 'http://img3m0.ddimg.cn/60/17/24042210-1_b_5.jpg', '200', '2018-11-01 14:58:45', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('6', '2', '1', 'Python从菜鸟到高手', 'Python从菜鸟到高手JetBrains官方推荐图书！JetBrains官大中华区市场部经理赵磊作序！送2400分钟同步视频课程！500个案例，400道Python练习题，电子书，10万行源代码，6个实战项目！', 'JetBrains官方推荐图书！JetBrains官大中华区市场部经理赵磊作序！送2400分钟同步视频课程！500个案例，400道Python练习题，电子书，10万行源代码，6个实战项目！ 李宁 私房菜谱 ： ? Python语法基础 ? Python高级编程 ? Python Web开发 ? Python科学计算与数据分析 ? Python Web爬虫技术 ? Python项目实战 李宁 实战项目 ： ? Web项目实战：基于Flask的美团网 ? Web项目实战：基于Django的58同城 ? 爬虫项目实战：天气预报服务API ? 爬虫项目实战：胸罩销售数据分析 ? GUI项目实战：动态修改域名指向的IP ? 游戏项目实战：俄罗斯方块', '清华大学出版社', '2018-09-01 00:00:00', '16开', null, '李宁', null, '9787302507161', '112.60', null, '', '128.00', null, '100', '100', '8.80', 'http://img3m4.ddimg.cn/6/6/25333314-1_b_2.jpg', '200', '2018-11-01 14:58:45', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('7', '2', '1', '码农翻身（好玩有趣的编程知识）', '码农翻身（好玩有趣的编程知识）用故事给技术加点料，全网阅读量近1000万次的技术故事，讲解Python、Java编程思想、JavaScript、架构、代码管理等，帮你理解技术起源和本质。《Java开发手册》作者孤尽等专家推荐。', '把计算机元素和行为用拟人手法编成一个个精彩纷呈的故事，绘声绘色且深入浅出地演绎晦涩枯燥的编程知识。 编程初学者可以津津有味地学习，老手也能饶有兴致地查漏补缺。 从前端到后端，从原理到编程，脉络清晰，体系完整。', '电子工业出版社', '2018-05-01 00:00:00', '16开', null, '刘欣（@码农翻身）', null, '9787121341175', '66.20', null, '', '69.00', null, '100', '100', '9.60', 'http://img3m4.ddimg.cn/31/12/25276414-1_b_13.jpg', '200', '2018-11-01 14:58:45', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('8', '2', '1', '重构 改善既有代码的设计', '重构 改善既有代码的设计世界知名软件开发大师Martin Fowler的不朽经典 生动阐述重构原理和具体做法 普通程序员进阶到编程高手的修炼秘笈', '软件开发的不朽经典 生动阐述重构原理和具体做法 普通程序员进阶到编程高手必须修炼的秘笈 重构，一言以蔽之，就是在不改变外部行为的前提下，有条不紊地改善代码。多年前，正是本书原版的出版，使重构终于从编程高手们的小圈子走出，成为众多普通程序员日常开发工作中不可或缺的一部分。本书也因此成为与《设计模式》齐名的经典著作，被译为中、德、俄、日等众多语言，在世界范围内畅销不衰。 本书凝聚了软件开发社区专家多年摸索而获得的宝贵经验，拥有不因时光流逝而磨灭的价值。今天，无论是重构本身，业界对重构的理解，还是开发工具对重构的支持力度，都与本书*初出版时不可同日而语，但书中所蕴涵的意味和精华，依然值得反复咀嚼，而且往往能够常读常新。', '人民邮电出版社', '2015-08-01 00:00:00', '16开', null, '[美]Martin Fowler 著，熊节 译', null, '9787115369093', '61.40', null, '', '69.00', null, '100', '100', '8.90', 'http://img3m6.ddimg.cn/79/24/23734636-1_b_1.jpg', '200', '2018-11-01 14:58:47', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('9', '2', '1', 'Python核心编程 第3版', 'Python核心编程 第3版畅销经典的Python基础教程学习手册进阶图书 兼顾Python2和Python3 机器学习 数据处理 网络爬虫热门编程语言 Python开发人员的案头常备', '全面涵盖当今应用开发中的众多领域为中级Python开发人员提供杰出实践方法涵盖大量实用的代码案例每章末尾的习题有助于巩固所学知识 想进一步提升Python编程水平？请深入分析真实应用程序中使用的大量相关主题涵盖了正则表达式、Internet/网络编程、GUI、SQL/数据库/ORM、多线程、Web开发了解当前的开发区域，比如Google 、Twitter、MongoDB、OAuth、Python 3迁移、Java/Jython囊括有关Django、Google App Engine、CSV/JSON/XML和Microsoft Office的全新内容。包含Python 2和Python 3代码，以便立即可以使用提供了代码片段、互动案例和实用练习，旨在巩固Python技能 Python是一种灵活、可靠且具有表现力的编程语言，它将编译语言的强大与脚本语言的简洁性、快速开发特性整合起来。在《 Python核心编程 第3版 》中，杰出Python开发人员兼企业培训师Wesley Chun会帮助您将Python技能提升到更高的水平。《 P', '人民邮电出版社', '2016-05-01 00:00:00', '16开', null, '[美]卫斯理 春（Wesley Chun）', null, '9787115414779', '88.10', null, '', '99.00', null, '100', '100', '8.90', 'http://img3m8.ddimg.cn/85/30/23961748-1_b_10.jpg', '200', '2018-11-01 14:58:47', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('10', '2', '1', 'Java核心技术 卷I：基础知识（原书第10版）', 'Java核心技术 卷I：基础知识（原书第10版）全新第10版！Java领域极具影响力和价值的著作之一，与《Java编程思想》齐名，10余年全球畅销不衰，广受好评', 'Java领域*有影响力和价值的著作之一，与《Java编程思想》齐名，10余年全球畅销不衰，广受好评 根据Java SE 8全面更新，系统全面讲解Java语言的核心概念、语法、重要特性和开发方法，包含大量案例，实践性强 ?? 一直以来，《Java核心技术》都被认为是面向高级程序员的经典教程和参考书，它内容翔实、客观准确，不拖泥带水，是想为实际应用编写健壮 Java代码的程序员的*选。如今，本版进行了全面更新， 以反映近年来人们翘首以待、变革*大的Java版本（Java SE 8）的内容。这一版经过重写，并重新组织，全面阐释了新的Java SE 8特性、惯用法和*佳实践，其中包含数百个示例程序，所有这些代码都经过精心设计，不仅易于理解，也很容易实际应用。 本书为专业程序员解决实际问题而写，可以帮助你深入了解Java语言和库。在卷I中，Horstmann主要强调', '机械工业出版社', '2016-09-19 00:00:00', '16开', null, '（美）凯 S.霍斯特曼（Cay S. Horstmann）', null, '9787111547426', '109.80', null, '', '119.00', null, '800', '400', '9.23', 'http://img3m6.ddimg.cn/86/32/24035306-1_b_6.jpg', '200', '2018-11-01 14:58:48', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('11', '2', '1', 'Python编程（第四版）', 'Python编程（第四版）Python高手进阶宝典，包含大量实用Python编程技巧，涵盖Python编程的方方面面，涵盖Python 3.X，是Python领域经典的开发指南。', '重磅推荐： Python袖珍指南（第五版） 本书是 Python 应用的手册指南，它涵盖了 Python 编程的方方面面，从系统管理到图形界面编程，从文本处理到网络编程，从数据库到语言扩展 这些主题的探讨中，作者提供了大量的实际代码，通过对这些代码的研读，对读者的 Python 编程水平以及实际业务问题的解决都将不无裨益。', '中国电力出版社', '2014-12-01 00:00:00', '大16开', null, 'Mark Lutz', null, '9787512355309', '136.60', null, '', '198.00', null, '100', '100', '6.90', 'http://img3m4.ddimg.cn/42/36/23617284-1_b_2.jpg', '200', '2018-11-01 14:58:49', '平装', '1');
INSERT INTO `product_info` VALUES ('12', '2', '1', 'Python基础教程（第3版）', 'Python基础教程（第3版）【图灵程序设计丛书】Python3.5编程从入门到实践 Python入门佳作 机器学习 人工智能 数据处理 网络爬虫热门编程语言 累计销售20万册', '本书是经典的Python入门教程，层次鲜明、结构严谨、内容翔实，特别是后面几章，作者将前面讲述的内容应用到10个引人入胜的项目中，并以模板的形式介绍了项目的开发过程，手把手教授Python编程实践，让读者从项目中领略Python的真正魅力。 本书既适合初学者夯实基础，又能帮助Python程序员提升技能，即使是中高-级Python程序员，也能从书里找到耳目一新的内容。', '人民邮电出版社', '2018-02-01 00:00:00', '16开', null, '[挪]芒努斯・利・海特兰德（Magnus Lie Hetland）', null, '9787115474889', '68.30', null, '', '99.00', null, '100', '100', '6.90', 'http://img3m5.ddimg.cn/62/19/25218035-1_b_2.jpg', '200', '2018-11-01 14:58:50', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('13', '2', '1', 'Python编程快速上手 让繁琐工作自动化（Python3编程从入门到实践 新手学习必备用书）', 'Python编程快速上手 让繁琐工作自动化（Python3编程从入门到实践 新手学习必备用书）Python3编程从入门到实践美亚畅销Python编程入门图书 Python3实战指南 带你快速实现Python高效编程', '亚马逊畅销Python编程图书，帮助你通过编程快速实现工作自动化在本书中，你将学习利用Python 编程，在几分钟内完成手工需要几小时的工作，而事先却无需具备编程经验。一旦掌握了编程的基础知识，你就可以毫不费力地创建Python 程序，完成高效的自动化工作，包括：● 在一个文件或多个文件中搜索文本；● 创建、更新、移动和重命名文件和文件夹；● 搜索网页和下载的在线内容；● 在任意大小的Excel电子表格中更新和格式化数据；● 拆分、合并PDF文件，以及如何加水印和加密；● 发送提醒邮件和文本通知；● 填写在线表格。本书的作者Al Sweigart是一位杰出Python程序员,他还是《Python 密码学编程》、《Python 游戏编程快速上手》和《Python 和Pygame 游戏开发指南》的作者。', '人民邮电出版社', '2016-06-01 00:00:00', '16开', null, '[美] Al Sweigart 斯维加特', null, '9787115422699', '61.40', null, '', '69.00', null, '100', '100', '8.90', 'http://img3m2.ddimg.cn/1/5/23997502-1_b_6.jpg', '200', '2018-11-01 14:58:50', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('14', '2', '1', '算法（第4版）【Sedgewick之巨著，与高德纳TAOCP一脉相承】', '算法（第4版）【Sedgewick之巨著，与高德纳TAOCP一脉相承】【图灵程序设计丛书】算法领域的经典参考书 众多图例实现图解算法和算法导论 基于Java语言实现算法和数据结构 熟练掌握算法设计与分析', 'Sedgewick之巨著，与高德纳TAOCP一脉相承 几十年多次修订，经久不衰的畅销书 涵盖所有程序员必须掌握的50种算法', '人民邮电出版社', '2012-10-01 00:00:00', '16开', null, '[美]Robert Sedgewick Kevin Wayne 著', null, '9787115293800', '66.40', null, '', '99.00', null, '100', '100', '6.71', 'http://img3m1.ddimg.cn/90/34/22880871-1_b_3.jpg', '200', '2018-11-01 14:58:51', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('15', '2', '1', '笨办法学Python 3', '笨办法学Python 3经典畅销Python入门教程升级版 Python3编程从入门到实践教程 手机扫码看5个小时配套视频 跟着数百万人的Python导师学Python编程入门基础教程 代码基于Python3.6', '知乎、CSDN等各大论坛技术大牛推荐的Python自学入门畅销书《笨办法学Python》重磅升级，所有案例均基于Python3.6编写。 免费提供长达5个小时的配套教学视频，用手机扫码在线观看视频，更方便。 Zed A. Shaw创建了一套非常有效的Python 3学习体系，只要跟着学，你就会像Zed教过的数百万初学者一样获得成功！只要你能自律、投入和坚持！ 在本书中，你将通过完成52个精心设计的习题来学会Python语言。阅读这些习题，照着录入代码（不要复制和粘贴！），修正自己的错误，观察程序的运行。在这个过程中，你将学会计算机的工作原理，知道怎样的程序才算是好程序，以及如何读、写和思考代码。作者还提供了5个多小时的视频，教你如何破坏、修正和调试代码，整个过程就像一边做题一边直播一样。一开始会很难，但很快你就会上手，并且会感觉很棒！ 本书适合以下人群阅', '人民邮电出版社', '2018-06-01 00:00:00', '16开', null, '[美]泽德 A. 肖（Zed A. Shaw）', null, '9787115478818', '56.60', null, '', '59.00', null, '100', '100', '9.60', 'http://img3m2.ddimg.cn/29/31/25286312-1_b_3.jpg', '200', '2018-11-01 14:58:51', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('16', '2', '1', '编程珠玑（第2版・修订版）', '编程珠玑（第2版・修订版）20余年畅销不衰计算机科学的不朽经典 伟大的计算机科学著作之一 程序员推选的心爱计算机图书 讲解如何正确选择和高效地实现算法 基于C和C++语言编写', '历*伟大的计算机科学著作之一 融深邃思想、实战技术与趣味轶事于一炉的奇书 带你真正领略计算机科学之美 多年以来，当程序员们推选出*心爱的计算机图书时，《编程珠玑》总是位于前列。正如自然界里珍珠出自细沙对牡蛎的磨砺，计算机科学大师Jon Bentley以其独有的洞察力和创造力，从磨砺程序员的实际问题中凝结出一篇篇不朽的编程 珠玑 ，成为世界计算机界名刊《ACM通讯》历*受欢迎的专栏，*终结集为两部不朽的计算机科学经典名著，影响和激励着一代又一代程序员和计算机科学工作者。本书为*卷，主要讨论计算机科学中*本质的问题：如何正确选择和高效地实现算法。 在书中，作者选取许多具有典型意义的复杂编程和算法问题，生动描绘了历史上众大师们在探索解决方案中发生的轶事、走过的弯路和不断精益求精的历程，引导读者像真正的程序员和软', '人民邮电出版社', '2015-01-01 00:00:00', '16开', null, '[美]乔恩・本特利（Jon Bentley） 著', null, '9787115357618', '34.70', null, '', '39.00', null, '100', '100', '8.90', 'http://img3m2.ddimg.cn/43/16/23640352-1_b_1.jpg', '200', '2018-11-01 14:58:52', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('17', '2', '1', '机器学习实战【python基础教程指南，python核心编程实例指导，对wxpython数据库充分的讲解，不可错过的编', '机器学习实战【python基础教程指南，python核心编程实例指导，对wxpython数据库充分的讲解，不可错过的编【图灵程序设计丛书】人工智能开发图书 深度学习实践应用 利用Python阐述机器学习算法 配合日常用例 强劲实战导向 程序员人手常备', '介绍并实现机器学习的主流算法 面向日常任务的高效实战内容 《机器学习实战》没有从理论角度来揭示机器学习算法背后的数学原理，而是通过 原理简述 问题实例 实际代码 运行效果 来介绍每一个算法。学习计算机的人都知道，计算机是一门实践学科，没有真正实现运行，很难真正理解算法的精髓。这本书的好处就是边学边用，非常适合于急需迈进机器学习领域的人员学习。实际上，即使对于那些对机器学习有所了解的人来说，通过代码实现也能进一步加深对机器学习算法的理解。 《机器学习实战》的代码采用Python语言编写。Python代码简单优雅、易于上手，科学计算软件包众多，已经成为不少大学和研究机构进行计算机教学和科学计算的语言。相信Python编写的机器学习代码也能让读者尽快领略到这门学科的精妙之处。', '人民邮电出版社', '2013-06-01 00:00:00', '16开', null, '[美]哈林顿', null, '9787115317957', '47.60', null, '', '69.00', null, '100', '100', '6.90', 'http://img3m7.ddimg.cn/43/25/23254747-1_b_3.jpg', '200', '2018-11-01 14:58:52', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('18', '2', '1', 'Effective Java中文版(第2版)', 'Effective Java中文版(第2版)', '相关阅读 Effective Python：编写高质量Python代码的59个有效方法 Effective Ruby：改善Ruby程序的48条建议 我很希望10年前就拥有这本书。可能有人认为我不需要任何Java方面的书籍，但是我需要这本书。 Java之父James Gosling 编码平添乐趣，程序更加完美，高效成为习惯，工作如此轻松。 你是否正在寻找一本能够更加深入地了解Java编程语言的书，以便编写出更清晰、更正确、更健壮且更易于重用的代码。不用找了！本书为我们带来了共78条程序员必备的经验法则，针对你每天都会遇到的编程问题提出了*有效、*实用的解决方案。 这本经典Jolt获奖作品实属众望所归。作者对新版进行了彻底的更新。涵盖了自第l版之后所引入的Java E5和Java SE 6的特性，同时开发了新的设计模式和语言习惯用法，介绍了如何充分利用从泛型到枚举、从注解到自', '机械工业出版社', '2010-09-01 00:00:00', '16开', null, '(美)布洛克|译者:杨春花//俞黎敏', null, '9787111255833', '48.00', null, '', '52.00', null, '100', '100', '9.24', 'http://img3m1.ddimg.cn/48/15/20459091-1_b_0.jpg', '200', '2018-11-01 14:58:53', '平装', '1');
INSERT INTO `product_info` VALUES ('19', '2', '1', 'Spring实战（第4版）', 'Spring实战（第4版）Spring经典图书 针对spring4进行更新 Java web开发从入门到精通 了解Java Spring技术内幕 进行spring源码深度解析 实践Java编程思想', '全球有超过100 000的开发者使用本书来学习Spring中文版累计销售超10万册，畅销经典Spring 技术图书，针对Spring 4 全新升级作者Craig Walls，SpringSource的软件开发人员，也是一位畅销书作者。第3版译者继续翻译新版，品质保障！', '人民邮电出版社', '2016-04-01 00:00:00', '16开', null, '[美] Craig Walls 沃尔斯', null, '9787115417305', '79.20', null, '', '89.00', null, '100', '800', '8.90', 'http://img3m8.ddimg.cn/49/3/23931418-1_b_26.jpg', '200', '2018-11-01 14:58:53', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('20', '2', '1', 'Python 3网络爬虫开发实战', 'Python 3网络爬虫开发实战【图灵原创】博客文章访问量过百万的博主倾力打造，教你学会如何用Python 3开发爬虫', '案例丰富，注重实战 博客文章过百万的静觅大神力作 全面介绍了数据采集、数据存储、动态网站爬取、App爬取、验证码破解、模拟登录、代理使用、爬虫框架、分布式爬取等知识 涉及的库或工具：urllib、requests、Beautiful Soup、XPath、pyquery、redis-py、PyMongo、PyMySQL、Selenium、Splash、Charles、mitmproxy、mitmdump、Appium、pyspider、Scrapy、Scrapy-Redis、Scrapy-Splash、Docker、Bloom Filter、Gerapy等', '人民邮电出版社', '2018-04-01 00:00:00', '16开', null, '崔庆才', null, '9787115480347', '68.40', null, '', '99.00', null, '100', '100', '6.91', 'http://img3m2.ddimg.cn/48/25/25249602-1_b_3.jpg', '200', '2018-11-01 14:58:54', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('21', '2', '1', 'Java并发编程的艺术', 'Java并发编程的艺术', '', '机械工业出版社', '2015-07-01 00:00:00', '16开', null, '方腾飞，魏鹏，程晓明 著', null, '9787111508243', '56.10', null, '', '59.00', null, '600', '102', '9.51', 'http://img3m1.ddimg.cn/25/7/23745571-1_b_1.jpg', '200', '2018-11-01 14:58:54', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('22', '2', '1', '利用Python进行数据分析', '利用Python进行数据分析大量实践案例教会你如何利用Python库高效解决各式各样的数据分析问题', '', '机械工业出版社', '2014-01-01 00:00:00', '16开', null, '（美）麦金尼 著，唐学韬 等译', null, '9787111436737', '82.20', null, '', '89.00', null, '100', '100', '9.24', 'http://img3m9.ddimg.cn/30/36/23368089-1_b_2.jpg', '200', '2018-11-01 14:58:54', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('23', '2', '1', '数据结构与算法分析：Java语言描述（原书第3版）', '数据结构与算法分析：Java语言描述（原书第3版）国际著名计算机教育专家Weiss数据结构与算法Java描述经典教材新版，把算法分析与高效率的Java程序的开发有机地结合起来，深入分析每种算法。', '', '机械工业出版社', '2016-03-07 00:00:00', '16开', null, '[美]马克・艾伦・维斯', null, '9787111528395', '63.70', null, '', '69.00', null, '100', '100', '9.24', 'http://img3m1.ddimg.cn/44/17/23918741-1_b_2.jpg', '200', '2018-11-01 14:58:55', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('24', '2', '1', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了H', 'JavaScript权威指南（第6版）（淘宝前端团队倾情翻译！经典权威的JavaScript犀牛书！第6版特别涵盖了H经典的JavaScript犀牛书！第6版特别涵盖了HTML5和ECMAScript5！', '经典权威的JavaScript工具书 本书是程序员学习核心JavaScript语言和由Web浏览器定义的JavaScript API的指南和综合参考手册。 第6版涵盖HTML5和ECMAScript5 相关阅读 编写高质量代码：改善C程序代码的125个建议 JavaScript编程精解（原书第2版） Effective Python：编写高质量Python代码的59个有效方法 Effective Ruby：改善Ruby程序的48条建议', '机械工业出版社', '2012-04-01 00:00:00', '16开', null, '(美)弗兰纳根', null, '9787111376613', '128.30', null, '', '139.00', null, '100', '100', '9.24', 'http://img3m0.ddimg.cn/13/17/22722790-1_b_6.jpg', '200', '2018-11-01 14:58:56', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('25', '2', '1', '剑指Offer：名企面试官精讲典型编程题（第2版）', '剑指Offer：名企面试官精讲典型编程题（第2版）继英文版登陆全球市场后又迎来重大升级 加大题量+更新题目+优化解法+融合中外 第二版重磅升级', '以面试官视角拆解考题 结合作者在多家名企的经验，从面试官视角剖析考题构思、现场心理、题解优劣与面试心得。 80余道精选编程面试题 从谷歌、微软等知名IT企业的海量面试题中精心筛选出80余道精华题目，提供多角度解题辅导。由于本书流传甚广，这些题已被大量企业真实采用，参考价值颇高。 高标准的系统解题方法 系统总结如何在面试时写出高质量代码，如何优化代码效率，以及分析、解决难题的常用思路和方法。 真实现场体验与生涯感悟 Autodesk 微软中国 思科 美国微软总部，作者一路跳槽一路 面 ，既亲历备考和被考，更做过数次考官，又常年从事一线编程工作，大量面试与实践经验，是本书品质后盾。', '电子工业出版社', '2017-03-01 00:00:00', '16开', null, '何海涛 著', null, '9787121310928', '56.30', null, '', '65.00', null, '100', '100', '8.67', 'http://img3m4.ddimg.cn/0/28/24242724-1_b_6.jpg', '200', '2018-11-01 14:58:56', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('26', '2', '1', '码出高效：Java开发手册', '码出高效：Java开发手册', '重磅新作，阿里人再现精品力作！ 在《阿里巴巴Java开发手册》之后，孤尽、鸣莎不负众望地再次给大家带来了一本能刷新日常、提升意识的Java编程专业书籍，真正来自阿里集团的智慧与经验，是用血淋淋的故障换来的。为了出版本书，作者全年无休，夜以继日。在*后冲刺阶段，作者闭关数月，满背胶布，脑力激荡，字字斟酌，每幅画亲笔绘制，体现出来的毅力和意志，不得不让人钦佩！ 夯实基础，让每一位程序员都有一个正确规范的起跑！ 正如孤尽所言， 对程序员来说，关键是骨子里要意识到：规范也是生产力，让个性化尽量表现在代码可维护性和算法效率的提升上。 本书讲解由浅入深，囊括了一名开发工程师应具备的全部基本素质，如果每一位程序员在职业生涯的开始读懂这本书并切实地将其中理念与规范应用到实际编程工作当中，便让团队如同本', '电子工业出版社', '2018-09-01 00:00:00', '16开', null, '杨冠宝', null, '9787121349096', '95.00', null, '', '99.00', null, '100', '100', '9.60', 'http://img3m8.ddimg.cn/76/35/25346848-1_b_6.jpg', '200', '2018-11-01 14:58:56', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('27', '2', '1', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，html+css+javascript教程精', 'JavaScript高级程序设计(第3版)(JavaScript技术名著，html+css+javascript教程精【图灵程序设计丛书】前端开发经典图书 JavaScript技术名著 web前端开发国内js一书 掌握JavaScript编程艺术', '1995年，Brendan Eich创造了JavaScript。 2005年，席卷全球的 Ajax热 激发了全世界Web开发人员学习JavaScript的热情。与此同时，本书第1版诞生。这一版的中文版狂销4万册，被誉为 *深度的JavaScript经典 ，奠定了其不可替代的权威地位。 2005年到2009年，前端开发社区在实践中充分检验了这门语言的各种实现和扩展，JavaScript从被戏谑的 玩具语言 一跃成为软件业举足轻重的通用编程语言。2009年1月本书第2版应运而生，凝聚作者和社区专家多年宝贵经验的这一技术名著再次得到读者认可和褒扬，中文版销量达到2万册。 2009年到2011年，ECMAScript5和HTML5在标准之争中双双胜出，使大量专有实现和客户端扩展正式进入规范，同时也为这门语言增添了很多适应未来发展的新特性。2012年初本书第3版面世，中文版也紧随其后。第3版除增加5章全新内容外，其他章节也有较大幅度的增补和修', '人民邮电出版社', '2012-03-01 00:00:00', '16开', null, '[美]Nicholas C. Zakas 著', null, '9787115275790', '68.30', null, '', '99.00', null, '100', '100', '6.90', 'http://img3m3.ddimg.cn/2/21/22628333-1_b_2.jpg', '200', '2018-11-01 14:58:58', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('28', '2', '1', '教孩子学编程 Python语言版', '教孩子学编程 Python语言版少儿编程入门书 高中新课标必修编程入门书 中小学编程自学教程 基于Python3编写的程序设计入门书 学习计算机思维方式 构建编程思维 寓教于乐全彩印刷', '本书属于No Starch的经典系列之一，英文版在美国受到读者欢迎。本书全彩印刷，寓教于乐，易于学习；读者可以轻松与快递地掌握解决问题方法和程序设计思维的。 编程从孩子抓起 得到越来越多的人的认同和重视。本书是父母教孩子学习Python程序设计的亲子读物。', '人民邮电出版社', '2016-03-01 00:00:00', '16开', null, '[美] Bryson Payne', null, '9787115416346', '53.10', null, '', '59.00', null, '100', '100', '9.00', 'http://img3m3.ddimg.cn/98/31/23928893-1_b_11.jpg', '200', '2018-11-01 14:58:59', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('29', '2', '1', '精通Python爬虫框架Scrapy', '精通Python爬虫框架Scrapypython3 scrapy教程 全面剖析网络爬虫技术的实现原理 通过爬取示例演示Scrapy的应用 涵盖从桌面端爬取到移动端爬取 实时爬取在内的所有内容', 'Scrapy是一个开源的Python爬虫框架，可以用来轻松提取从页面数据。Scrapy带有丰富的特性，可通过简单的编码或配置来访问，从而可以节省开发人员数周的开发时间，并高效地提取所需数据。Scrapy有一个高度活跃且迅速增长的社区，而且已经成为黑客、创业者和Web爬取专家的首 选框架。 本书讲解了Scrapy的基础知识，讨论了如何从任意源提取数据，如何清理数据，以及如何使用Python和第三方API进行处理，以满足自身需求。本书还讲解了如何将爬取的数据高效地馈入数据库、搜索引擎和流数据处理系统（比如Apache Spark）。在学习完本书后，你将对数据爬取胸有成竹，并将数据应用在自己的应用程序中。 本书内容： 使用HTML和Xpath提取所需的数据； 使用Python编写Scrapy爬虫，并在网络上进行爬取操作； 将数据推送到任意数据库、搜搜引擎或分析系统的方法； 配置爬虫，使其', '人民邮电出版社', '2018-02-01 00:00:00', '16开', null, '[美]迪米特里奥斯 考奇斯-劳卡斯（Dimitrios Kouzis-Loukas）', null, '9787115474209', '53.10', null, '', '59.00', null, '100', '100', '9.00', 'http://img3m2.ddimg.cn/40/15/25227022-1_b_1.jpg', '200', '2018-11-01 14:58:59', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('30', '2', '1', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）', 'Head First Java（中文版）（JAVA经典畅销书 生动有趣 轻松学好JAVA）10年畅销经典，累计印刷30多次，畅销10万余册，计算机图书十大好书之一。', '★第14届Jolt大奖的参赛图书。 ★《HeadFirstJava》使纸质图书成为了你所见过的*接近GUI的事物，使学习Java成为一种风尚。 ★Java技术无所不在 如果你是一个软件开发者且没有学习过Java，那么本书是您不二的选择。 Head First系列其他新书', '中国电力出版社', '2007-02-01 00:00:00', '16开', null, '（美）塞若（Sierra，K.），（美）贝茨（Bates，B.） 著，O’Reilly Taiwan公司 译，张然 等改编', null, '9787508344980', '48.30', null, '', '79.00', null, '100', '100', '6.12', 'http://img3m9.ddimg.cn/56/36/9265169-1_b_5.jpg', '200', '2018-11-01 14:59:00', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('31', '4', '1', '诗经（上下册精装）（中华经典名著全本全注全译）', '诗经（上下册精装）（中华经典名著全本全注全译）中华书局出版。传统经典，伴你一生', '1. 中华经典名著全本全注全译 丛书为全本。所收书目是经史子集中的 经典著作，以权威版本为核校底本，约请业内专家进行注释和翻译。注释准确简明，译文明白晓畅。 2. 采用纸面精装。全套书的装帧设计雅正，精致大方。 3. 定价适合，方便广大读者购买收藏。', '中华书局', '2015-09-01 00:00:00', '32开', null, '王秀梅 译注', null, '9787101111460', '37.20', null, '', '62.00', null, '100', '100', '6.00', 'http://img3m7.ddimg.cn/15/36/23724177-1_b_1.jpg', '200', '2018-11-01 15:03:55', '精装', '1');
INSERT INTO `product_info` VALUES ('32', '4', '1', '诗经（中华国学经典精粹・诗词文论必读本）', '诗经（中华国学经典精粹・诗词文论必读本）', '中国向有 诗的国度 的美称，而《诗经》便是这诗国之诗的伟大源头。 孔子曾说： 不学诗，无以言。 一部文学作品而能由《诗》入 经 ，并曾长期位居儒家五经之首，成为古国精神文明的重要代表，这种现象在世界文化史上也是极为独特的。 《诗经》曾被译为多国文字，日本、朝鲜、越南、法国、德国、英国、俄国都有译本，流传非常广泛。作为创造民族新文化的基石，我们一定要很好地继承这一光辉灿烂的文化遗产。', '北京联合出版公司', '2015-07-01 00:00:00', '32开', null, '李青,译', null, '9787550225909', '9.00', null, '', '12.00', null, '100', '100', '7.50', 'http://img3m7.ddimg.cn/15/36/23724177-1_b_1.jpg', '200', '2018-11-01 15:03:56', '平装-胶订', '0');
INSERT INTO `product_info` VALUES ('33', '4', '1', '论语（中华国学经典精粹・儒家经典必读本）', '论语（中华国学经典精粹・儒家经典必读本）', '作为中国古代儒家的一部重要经典，《论语》是了解孔子哲学、政治、教育、文化等学 说的很重要的资料。 半部《论语》治天下 ，从古至今，《论语》都是一部不能 忽视的经典。作为中华文化的源典，《论语》的主张思想已浸透到到中国两千多年的政 教体制、社会习俗、心理习惯和行为方式里去。', '北京联合出版公司', '2015-07-01 00:00:00', '32开', null, '王超,译', null, '9787550243507', '9.00', null, '', '12.00', null, '100', '100', '7.50', 'http://img3m6.ddimg.cn/4/25/23724166-1_b_1.jpg', '200', '2018-11-01 15:03:57', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('34', '4', '1', '周易(精)--中华经典名著全本全注全译丛书', '周易(精)--中华经典名著全本全注全译丛书中华书局“中华经典名著全本全注全译丛书”系列，点击进入专题》', '', '中华书局', '2011-03-01 00:00:00', '大32开', null, '杨天才，张善文 译注', null, '9787101077377', '32.70', null, '', '49.00', null, '1000', '1000', '6.68', 'http://img3m6.ddimg.cn/78/18/23484066-1_b_0.jpg', '200', '2018-11-01 15:03:57', '精装', '1');
INSERT INTO `product_info` VALUES ('35', '4', '1', '论语・大学・中庸（中华经典名著全本全注全译）', '论语・大学・中庸（中华经典名著全本全注全译）中华书局“中华经典名著全本全注全译丛书”系列，点击进入专题》', '', '中华书局', '2015-02-01 00:00:00', '大32开', null, '陈晓芬，徐儒宗 译注', null, '9787101107241', '17.30', null, '', '26.00', null, '102', '102', '6.66', 'http://img3m7.ddimg.cn/38/14/23688857-1_b_2.jpg', '198', '2018-11-01 15:03:58', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('36', '4', '1', '诗经（中华经典藏书・升级版）', '诗经（中华经典藏书・升级版）“中华经典藏书（升级版）”系列，点击进入专题》', '四书五经 、诸子百家，经典的价值和魅力在流光岁影里永不褪色，先贤圣哲的智慧光芒照耀着我们的现代生活。为在古代经典与现代社会间架起一座沟通的桥梁，中华书局推出 中华经典藏书 丛书。自2006年推出*辑开始，累计销售上千万册，销售码洋突破1.6亿元，成为广大读者阅读学习国学经典名著的主要版本。 为适应时代、市场及广大读者的需求，经过认真调研，中华书局决定推出升级版，从原来的50种调整为60种，其中增补的新书都是堪称经典的名著，其中既有深受读者喜爱的经典名著，也有适合广大师生教学阅读的重要作品。相信书店、读者会更加喜欢升级版的 中华经典藏书 。', '中华书局', '2016-01-01 00:00:00', '32开', null, '王秀梅 译注', null, '9787101114638', '14.70', null, '', '22.00', null, '100', '100', '6.69', 'http://img3m7.ddimg.cn/95/34/23912357-1_b_5.jpg', '200', '2018-11-01 15:03:58', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('37', '4', '1', '论语（中华经典藏书・升级版）', '论语（中华经典藏书・升级版）“中华经典藏书（升级版）”系列，点击进入专题》', '', '中华书局', '2016-01-01 00:00:00', '32开', null, '陈晓芬 译注', null, '9787101113648', '12.00', null, '', '18.00', null, '100', '100', '6.67', 'http://img3m9.ddimg.cn/11/5/23880989-1_b_2.jpg', '200', '2018-11-01 15:03:59', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('38', '4', '1', '大学・中庸（中华经典藏书・升级版）', '大学・中庸（中华经典藏书・升级版）“中华经典藏书（升级版）”系列，点击进入专题》', '《大学》和《中庸》本是《礼记》中的两篇，经宋儒二程和朱熹等人推崇，与《论语》《孟子》合称为 四书 ，虽然篇幅不大却是儒家文化核心经典。 《大学》以人的修养为核心，指出了 自天子以至于庶人，壹是皆以修身为本 提出了从格物致知，诚意正心到修身齐家，治国平天下的完整修养路径，包括了穷究万物事理获得知识，培养道德品性，完善自我人格等方面。 《中庸》同《周易》一样，是儒家的哲学理论渊薮，不过《周易》涵盖面广，《中庸》则集中强调与人的自我认识和社会生活相关的道德哲学，自宋代以后《中庸》成为儒者研读的重点，理学的很多概念命题都出自《中庸》， 中庸 的思维方式成为很多学者的生活信条，对宋代以后中华文明特色的形成具有重要作用。', '中华书局', '2016-01-01 00:00:00', '32开', null, '王国轩 译注', null, '9787101113501', '8.00', null, '', '12.00', null, '100', '100', '6.67', 'http://img3m0.ddimg.cn/13/7/23855350-1_b_2.jpg', '200', '2018-11-01 15:03:59', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('39', '4', '1', '诗经译注', '诗经译注上海古籍出版', '', '上海古籍出版社', '2012-08-01 00:00:00', '16开', null, '程俊英 撰', null, '9787532564002', '28.60', null, '', '32.00', null, '100', '100', '8.94', 'http://img3m2.ddimg.cn/25/23/22845562-1_b_4.jpg', '200', '2018-11-01 15:04:00', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('40', '4', '1', '诗经―中华经典藏书', '诗经―中华经典藏书(无障碍阅读，经典全译本，国内唯美精装插图本，不可不读的国学精髓)（在忠实原诗的基础上，以准确、优美的图文进行诠释，为读者消除阅读障碍，以便能让读者自由徜徉于经典美好的诗歌之中，获得美的愉悦和享受！）', '★《诗经》对后代诗歌发展具有深远的影响，是我国古典文学现实主义传统的源头。 ★精心译注，精美插图，精装珍藏，雅俗共赏，无障碍阅读，经典全译。中华诗歌之源头，华夏文章之根基。 ★绕梁不绝的先人歌咏，袅袅萦绕的古朴颂唱，流淌在血脉中的炎黄之歌！欣赏千古诗行之旋律，体会遥远先民之生活！ ★中国古典诗歌的源头，传统文化的经典读本；翻阅古典文学，就翻阅了人类精神优美而隽永的一面。古典文学，中华文化中的精华。 《中华经典藏书系列》从立项到出版，历时三年，花费大量精力财力，倾力打造。所收书目是传统国学中很经典的著作，以经典版本为核校底本，进行注释和翻译，认真研究，精雕细琢。 【足本定本精心译注】 本书为精装珍藏版，参照国内的原版古籍书，能做足本的绝不删除', '吉林美术出版社', '2015-10-01 00:00:00', '16开', null, '（春秋）孔子 编订 ; 黎波 译注', null, '9787557502119', '28.70', null, '', '39.80', null, '100', '100', '7.22', 'http://img3m1.ddimg.cn/94/15/23786131-1_b_4.jpg', '200', '2018-11-01 15:04:00', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('41', '4', '1', '论语译注――中国古典名著译注丛书', '论语译注――中国古典名著译注丛书', '《中国古典名著译注丛书：论语译注》系名家力作，杨伯峻先生在精研《论语》的基础上，对《论语》二十篇进行了精确细致的注释和翻译。每章分为原文、注释、译文三部分，注释精准，译文流畅明白，不但给专业研究者提供了若干研究线索，更便于普通读者正确理解《论文》，实为雅俗共赏之佳作。', '中华书局', '2009-10-01 00:00:00', '大32开', null, '杨伯峻 译注', null, '9787101070248', '18.80', null, '', '26.00', null, '100', '100', '7.24', 'http://img3m9.ddimg.cn/92/10/23371319-1_b_2.jpg', '200', '2018-11-01 15:04:00', '平装', '1');
INSERT INTO `product_info` VALUES ('42', '4', '1', '诗经注析（中华国学文库）', '诗经注析（中华国学文库）优美深入的赏析，精到博雅的注释，古老的《诗经》回归文学的本质，撷取历代《诗经》注释菁华的总结性著作。中华书局出版。', '1.每首诗首列【题解】一项，不仅对诗歌的文学艺术、修辞意境作优美的揭示，更结合《诗经》时代的历史、制度、社会生活作深入的分析，使知人论世，对全诗有准确把握和感性的认识。 2.本书注释站在前贤奠定的基础上，借鉴毛传、郑笺、朱熹《诗集传》、陈奂《诗毛氏传疏》、王先谦《诗三家义集疏》、解放后甲骨金石出土文物等研究成果，择善而从。 3.本书注释着重揭示《诗经》中字词的本字本义、引申义、假借义等关系，使对古代汉语词义的演变有深入认识。 4.诗歌每章之后列 韵读 一栏，揭示诗经的押韵情况，并标注直音，使本书特别方便讽诵。', '中华书局', '2017-08-01 00:00:00', '32开', null, '程俊英，蒋见元', null, '9787101126914', '41.90', null, '', '58.00', null, '100', '100', '7.23', 'http://img3m4.ddimg.cn/82/33/25168654-1_b_1.jpg', '200', '2018-11-01 15:04:01', '精装', '1');
INSERT INTO `product_info` VALUES ('43', '4', '1', '十三经注疏（清嘉庆刊本）全五册', '十三经注疏（清嘉庆刊本）全五册', '', '中华书局', '2009-10-01 00:00:00', '大16开', null, '（清）阮元 校刻', null, '9787101068443', '774.20', null, '', '980.00', null, '100', '100', '7.90', 'http://img3m1.ddimg.cn/92/19/20747621-1_b_0.jpg', '200', '2018-11-01 15:04:01', '精装', '1');
INSERT INTO `product_info` VALUES ('44', '4', '1', '王阳明全集（全五册）', '王阳明全集（全五册）曾国藩、梁启超、蒋介石终生精神导师，当年明月一生推荐，千古完人王阳明传世经典！全新足本，简体横排，好评如潮！', '- - - - - ◎王阳明是中国历史上罕见的立德、立言、立功三不朽的伟人，也是有明一代*为杰出的政治家、军事家和哲学家。他的一生跌宕起伏，充满了传奇色彩；他的心学思想融合了儒释道三家之精髓，是 酱缸文化 的*后一剂解药。哈佛大学教授杜维明先生预言，21 世纪将是王阳明的世纪。 ◎ 迄今收录*全的王阳明著作全集。 ◎ 简体横排首次出版，更适合现代人阅读。 ◎王阳明一生文治武功俱称于世，对傅承与发展儒学之贡献尤为卓著。其学上承孟子，中继陆象山，而形成为风靡明代中后期并与程朱理学分庭抗礼的阳明心学。其学说，不仅影响及于我国明清两代以至近现代，而且远播日本', '线装书局', '2012-05-01 00:00:00', '大32开', null, '(明)王阳明', null, '9787512005259', '126.80', null, '', '198.00', null, '100', '100', '6.41', 'http://img3m9.ddimg.cn/44/1/22631939-1_b_5.jpg', '200', '2018-11-01 15:04:01', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('45', '4', '1', '四书五经译注（套装全九册）', '四书五经译注（套装全九册）', '', '上海古籍出版社', '2010-09-01 00:00:00', '大32开', null, '程俊英 等撰', null, '9787532555888', '241.30', null, '', '298.00', null, '100', '100', '8.10', 'http://img3m4.ddimg.cn/6/24/20899104-1_b_2.jpg', '200', '2018-11-01 15:04:02', '平装', '1');
INSERT INTO `product_info` VALUES ('46', '4', '1', '礼记（全2册・中华经典名著全本全注全译）', '礼记（全2册・中华经典名著全本全注全译）“三礼”（《周礼》《仪礼》《礼记》）之一；儒家十三经之一。中华书局出版。', '1. 中华经典名著全本全注全译 丛书为全本。所收书目是经史子集中极为经典的著作，以精良版本为核校底本，约请业内专家进行注释和翻译。注释准确简明，译文明白晓畅。 2. 采用纸面精装。全套书的装帧设计雅正，精致大方。 3. 定价适合，方便广大读者购买收藏。', '中华书局', '2017-11-01 00:00:00', '32开', null, '胡平生，张萌 译注', null, '9787101128567', '63.60', null, '', '88.00', null, '100', '100', '7.23', 'http://img3m0.ddimg.cn/87/30/25199250-1_b_3.jpg', '200', '2018-11-01 15:04:03', '精装', '1');
INSERT INTO `product_info` VALUES ('47', '4', '1', '诗经选--余冠英作品集', '诗经选--余冠英作品集', '虽然关于古典文学的注释本有很多，但是余冠英所做的《诗经选》、《三曹诗选》、《乐府诗选》和《汉魏六朝诗选》至今仍被专家公认为选注本中的**之作。余冠英先生善于在纵向的文学发展的历史长河中评价每位作家、每首诗的地位，并在与同时代作家、作品的横向比较中分析其特色，从而客观地评估其历史价值。在每种选本的 前言 部分，余冠英先生都对所选篇目和作家进行了深入的阐发和评析。这几种选注本集中体现了余冠英先生博洽精深、自成一家的学术追求，其翔实的资料、严谨的观点中折射出令人叹服的学术功力和公允、平易的学风。其中的《诗经选》《乐府诗选》被全国高等学校中文学科教学指导委员会指定为大学生必读书目。 此次出版 余冠英作品集 ，以余冠英先生生前*后的修订本为底本重新排版设计，版面更加疏朗大方。对原书除修订部分注', '中华书局', '2012-09-01 00:00:00', '大32开', null, '余冠英', null, '9787101087543', '14.40', null, '', '20.00', null, '100', '100', '7.20', 'http://img3m0.ddimg.cn/83/9/22890170-1_b_1.jpg', '200', '2018-11-01 15:04:03', '平装', '1');
INSERT INTO `product_info` VALUES ('48', '4', '1', '四书章句集注――新编诸子集成', '四书章句集注――新编诸子集成', '', '中华书局', '2003-06-01 00:00:00', '大32开', null, '(宋)朱熹撰', null, '9787101081695', '30.80', null, '', '39.00', null, '100', '100', '7.90', 'http://img3m6.ddimg.cn/86/11/22633466-1_b_1.jpg', '200', '2018-11-01 15:04:04', '平装', '1');
INSERT INTO `product_info` VALUES ('49', '4', '1', '王阳明传习录（全译全注，明隆庆六年初刻版）', '王阳明传习录（全译全注，明隆庆六年初刻版）尘封400余年原貌重现的初始定本！阳明心学正宗读本！纠正现存版本21处文字与体例错误！附录并译注王阳明亲自编定的《朱子晚年定论》。读客熊猫君出品', '◆原汁原味的阳明心学读本！ ◆逐字逐句校对尘封400余年的善刻本，纠正现存版本21处文字与体例错误！ ◆被已故哲学家陈荣捷先生称为 完备而可靠 的《传习录》版本。 ◆首次附录并译注王阳明亲自编定的《朱子晚年定论》。 ◆注释中浓缩汇集陈荣捷先生、邓艾民先生等著名哲学家近几十年来的《传习录》研究成果。 ◆全译全注、简体横排，用通俗易懂的方式展现原汁原味的阳明心学。 ◆张居正、曾国藩、梁启超、孙中山、蒋介石、伊藤博文、稻盛和夫等人的力量源泉。 ◆已故国学大师钱穆将《传习录》列为 中国人所人人必读的书 之一。 推荐您购买读客其他畅销书：', '江苏文艺出版社', '2015-07-01 00:00:00', '16开', null, '王阳明 著；张靖杰 译，读客图书 出品', null, '9787539983240', '23.20', null, '', '36.00', null, '100', '100', '6.45', 'http://img3m7.ddimg.cn/33/22/23722017-1_b_13.jpg', '200', '2018-11-01 15:04:04', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('50', '4', '1', '说文解字注', '说文解字注', '', '上海古籍出版社', '2008-11-01 00:00:00', '16开', null, '[汉]许慎 撰，[清]段玉裁 注', null, '9787532504879', '114.20', null, '', '128.00', null, '100', '103', '8.93', 'http://img3m3.ddimg.cn/89/1/20303603-1_b_3.jpg', '200', '2018-11-01 15:04:04', '精装', '1');
INSERT INTO `product_info` VALUES ('51', '4', '1', '四书五经（精注精译 图文珍藏版）', '四书五经（精注精译 图文珍藏版）', '', '线装书局', '2014-08-01 00:00:00', '16开', null, '', null, '9787512014596', '82.20', null, '', '299.00', null, '100', '100', '2.75', 'http://img3m6.ddimg.cn/60/32/23596116-1_b_5.jpg', '200', '2018-11-01 15:04:05', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('52', '4', '1', '论语译注(精)--国民阅读经典', '论语译注(精)--国民阅读经典', '', '中华书局', '2012-05-01 00:00:00', '大32开', null, '杨伯峻 译', null, '9787101085594', '20.90', null, '', '29.00', null, '100', '101', '7.21', 'http://img3m2.ddimg.cn/51/16/22780842-1_b_0.jpg', '200', '2018-11-01 15:04:05', '精装', '1');
INSERT INTO `product_info` VALUES ('53', '4', '1', '古诗源（中华国学文库）', '古诗源（中华国学文库）古诗是唐诗的源头活水，《古诗源》是解锁唐诗之所以鼎盛的快捷键，《唐诗别裁集》的姊妹篇。中华书局出版。', '1.《古诗源》是唐以前诗歌的精华荟萃，体量适中，是近代以来非常流行的古诗选本。 2.编选者沈德潜是清代格调诗派的领袖，寿高九十七，所选古诗之后大多有扼要点评，片言只语，便将精髓点出，对提高诗歌的鉴赏力，裨益甚大。 3.编者选诗崇尚雅正，尤其注重作品的风骨，提倡自然，反对雕琢。 4.唐诗之所以极盛，是因为在唐以前有着丰沛的源头活水，《古诗源》即着眼于探寻唐诗的发源，使对唐诗乃至全部古典诗歌，有一个顺流而下的全局把握。', '中华书局', '2017-08-01 00:00:00', '32开', null, '【清】沈德潜 选、闻旭初 标点', null, '9787101126532', '22.10', null, '', '28.00', null, '100', '102', '7.90', 'http://img3m7.ddimg.cn/85/36/25168657-1_b_3.jpg', '200', '2018-11-01 15:04:06', '精装', '1');
INSERT INTO `product_info` VALUES ('54', '4', '1', '孟子（中华经典藏书・升级版）', '孟子（中华经典藏书・升级版）“中华经典藏书（升级版）”系列，点击进入专题》', '', '中华书局', '2016-01-01 00:00:00', '32开', null, '万丽华，蓝旭 译注', null, '9787101113655', '15.30', null, '', '23.00', null, '100', '100', '6.66', 'http://img3m7.ddimg.cn/20/14/23855357-1_b_2.jpg', '200', '2018-11-01 15:04:06', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('55', '4', '1', '十三经译注（全十五册）', '十三经译注（全十五册）上海古籍出版社积十年之功，国内权威专家联袂注释和今译', '中国传统文化中， 十三经 地位之尊崇，影响之深广，是其他任何典籍所无法比拟的。但 十三经 大多文辞深奥，为帮助读者读通和理解原著，上海古籍出版社邀请程俊英、黄寿祺等名家分别对各经进行注释、讲解和今译，历经十数年精心打造，汇为这套《十三经译注》，自上市以来，屡获嘉评。现推出**版《十三经译注》优惠套装，回馈广大读者的厚爱。 十三经的历史：十三经是由汉朝的五经逐渐发展而来的，*终形成于南宋。 汉朝：五经。汉朝时，以《易》、《诗》、《书》、《礼》、《春秋》为 五经 ，立于学官。唐朝：九经。唐朝时，《春秋》分为 三传 ，即《左传》、《公羊传》、《谷梁传》；《礼经》分为 三礼 ，即《周礼》、《仪礼》、《礼记》。这六部书再加上《易》、《书》、《诗》，并称为 九经 ，也立于学官，用于开科取士。 晚唐：十二经。唐', '上海古籍出版社', '2009-07-01 00:00:00', '32开', null, '程俊英、黄寿祺 等译注', null, '9787532538171', '420.30', null, '', '519.00', null, '100', '100', '8.10', 'http://img3m3.ddimg.cn/95/0/20598233-1_b_2.jpg', '200', '2018-11-01 15:04:06', '盒装', '1');
INSERT INTO `product_info` VALUES ('56', '4', '1', '宋本礼记（套装全四册）', '宋本礼记（套装全四册）国学基本典籍丛刊', '', '国家图书馆出版社', '2017-10-31 00:00:00', '大32开', null, '（汉）郑玄 注，（唐）陆德明 释文', null, '9787501361588', '63.20', null, '', '80.00', null, '100', '100', '7.90', 'http://img3m4.ddimg.cn/21/6/25182354-1_b_1.jpg', '200', '2018-11-01 15:04:09', '平装-锁线胶订', '1');
INSERT INTO `product_info` VALUES ('57', '4', '1', '三字经・百家姓・千字文・弟子规诵读本--“中华诵・经典诵读行动”读本系列', '三字经・百家姓・千字文・弟子规诵读本--“中华诵・经典诵读行动”读本系列', '', '中华书局', '2013-04-01 00:00:00', '16开', null, '中华诵经典诵读行动读本编委会 编', null, '9787101090031', '13.30', null, '', '20.00', null, '100', '100', '6.65', 'http://img3m8.ddimg.cn/3/16/23256588-1_b_1.jpg', '200', '2018-11-01 15:04:09', '平装', '1');
INSERT INTO `product_info` VALUES ('58', '4', '1', '四书五经（大儒注本）（简体横排点校本，精装全四册）', '四书五经（大儒注本）（简体横排点校本，精装全四册）权威整理，函套精装。全套图书内含：（宋）朱熹注《四书集注》《周易本义》《诗集传》《书集传》；（元）陈�蛔�《礼记集说》；（晋）杜预集解《春秋左传集解》', '《四书五经（大儒注本1）〈四书集注〉〈周易本义〉》，【宋】朱熹 注，王华宝、王玉德 整理； 《四书五经（大儒注本2）〈诗集传〉、〈书集传〉》，【宋】朱熹 注，王华宝、钱宗武、钱忠弼 整理； 《四书五经（大儒注本3）〈礼记集说〉》，【元】陈�� 注，万久富 整理； 《四书五经（大儒注本4）〈春秋左传集解〉》，【春秋】左丘明 撰，【晋】杜预集解，李梦生 整理。', '凤凰出版社', '2015-06-01 00:00:00', '32开', null, '【宋】朱熹、【元】陈�� 等注，王华宝、钱宗武、钱忠弼、王玉德、万久富、李梦生等 整理', null, '9787550621688', '328.80', null, '', '380.00', null, '100', '100', '8.66', 'http://img3m9.ddimg.cn/49/16/23752129-1_b_0.jpg', '200', '2018-11-01 15:04:10', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('59', '4', '1', '四书章句集注（精装・新编诸子集成）', '四书章句集注（精装・新编诸子集成）', '', '中华书局', '2016-04-01 00:00:00', '大32开', null, '（宋）朱熹 撰', null, '9787101116779', '37.60', null, '', '52.00', null, '100', '100', '7.24', 'http://img3m6.ddimg.cn/36/16/24023376-1_b_2.jpg', '200', '2018-11-01 15:04:10', '平装', '1');
INSERT INTO `product_info` VALUES ('60', '4', '1', '诗品译注', '诗品译注', '', '中华书局', '1998-02-01 00:00:00', '大32开', null, '(梁)钟嵘 著，周振甫 译注', null, '9787101015898', '9.40', null, '', '12.00', null, '100', '100', '7.84', 'http://img3m9.ddimg.cn/71/23/20967479-1_b_2.jpg', '200', '2018-11-01 15:04:10', '平装', '1');
INSERT INTO `product_info` VALUES ('61', '7', '1', '三体：全三册 刘慈欣代表作，亚洲首部“雨果奖”获奖作品！', '三体：全三册 刘慈欣代表作，亚洲首部“雨果奖”获奖作品！', '相关推荐：三体中的物理学 《三体》的幻想源于经典物理中的三体问题，即三个体积质量相当的天体，在远离其它星系以致其它星系的引力影响可忽略不计的情况下，三个天体在互相引力的作用下互相围绕运行，其运行轨迹将产生不可预测的混沌。很多年来，数学家们一直希望能建立三体乃至多体问题的数学模型，可遗憾的是，得到的结果仅仅是三体问题在非限制条件下的不可解。刘慈欣正是基于这样的科学事实，用大胆的想象和严谨的推断，在三体星系的行星中构建了一个外星文明形态，并描绘了该文明在如同不可捉摸的命运一般的 恒纪元 与 乱纪元 [ 注 1] 的轮替中，数百次的毁灭和重生。三体的故事有着广袤的时间与空间纬度，其以明暗两条线索发展，一条描述了科学家叶文洁在目睹了文革的疯狂与愚昧之后，痛苦的思索着后工业时代对人本', '重庆出版社', '2010-11-01 00:00:00', '32开', null, '刘慈欣', null, '23579654', '85.80', null, '', '93.00', null, '100', '101', '9.23', 'http://img3m9.ddimg.cn/71/23/20967479-1_b_2.jpg', '200', '2018-11-01 16:18:39', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('62', '7', '1', '活着（2017年新版）', '活着（2017年新版）余华是我国当代著名作家，也是享誉世界的小说家，曾荣获众多国内外奖项。《活着》是其代表作，在全球广泛传播，销量逾千万册，获得了普遍好评，已成为中国乃至世界当代文学的经典。', '余华是我国当代著名作家，也是蜚声国际的小说家，他的作品享誉世界，曾获众多国内外奖项。其中长篇小说《活着》用独特的表述方式，揭示了在困境中求生的理念，展现了生命的顽强与乐观。该小说现已有近50个版本在全球近40个国家和地区出版，并有数种少数民族文字版，以及盲文版在我国出版。自2008年在作家出版社出版以来，数次再版，加印100多次，迄今发行量逾700万册。', '作家出版社', '2012-08-01 00:00:00', '16开', null, '余华', null, '9787506365437', '26.00', null, '', '28.00', null, '100', '100', '9.29', 'http://img3m0.ddimg.cn/7/27/25137790-1_b_2.jpg', '200', '2018-11-01 16:18:39', '平装-胶订', '1');
INSERT INTO `product_info` VALUES ('63', '7', '1', '月亮和六便士（全新导读无删节详注版！ 半年创当当110000名读者五星好评奇迹）看“一本好书”，在当当享阅读之趣', '月亮和六便士（全新导读无删节详注版！ 半年创当当110000名读者五星好评奇迹）看“一本好书”，在当当享阅读之趣口碑爆棚的现象级畅销书！毛姆研究专家苏福忠译作，当当书香节一天狂销10000+！历史销量名列同名书榜首！村上春树连读两遍，张爱玲感动推荐。知乎网友惊叹“可惜我不是在十几岁读的这本书” 。', '一本写给每个人的梦想之书，无关国界，无关年龄。 漫漫人生路，多少人只是怯懦地望一眼月亮，却继续紧握兜里叮当作响的六便士。 其实，追逐理想并非是为自己赢得一场噩运， 在满地都是六便士的街上，他抬头看到了月亮 查尔斯 一个绝望的梦想守护者、一个潦倒落魄的艺术天才， 他的故事发生在世界每个角落，在每个人的身上上演 读时你会羞愧，会心疼，会敬佩，会斗志满满。 他能唤醒麻木，令你重燃理想世界的灯火， 他告诉每个人，你怎样，你的世界便怎样。 纵使你眼中的 珍宝 ，是我手中的 尘埃 ，who care？ ◎ 史上 zui会讲故事的小说家 毛姆经典代表作，一字未删的足本，同名书籍豆瓣评分9.2。 ◎ 村上春树、余华、张爱玲、王安忆、白岩松、杨澜、高晓松、范冰冰、蔡崇达、咪蒙都爱读的佳作。 ◎ 自问世以', '时代文艺出版社', '2017-09-01 00:00:00', '32开', null, '〔英〕毛姆 著 苏福忠 译', null, '9787538754858', '18.60', null, '', '27.00', null, '100', '100', '6.89', 'http://img3m8.ddimg.cn/27/20/25126128-1_b_2.jpg', '200', '2018-11-01 16:18:40', '平装-胶订', '1');

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `comment_id` int(16) NOT NULL,
  `product_id` int(16) DEFAULT NULL,
  `user_id` int(16) DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `flag` varchar(255) DEFAULT NULL COMMENT '审核标志',
  PRIMARY KEY (`comment_id`),
  KEY `product_id` (`product_id`),
  KEY `customer_id` (`user_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`product_id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for global_parameter
-- ----------------------------
DROP TABLE IF EXISTS `global_parameter`;
CREATE TABLE `global_parameter` (
  `para_id` int(10) NOT NULL,
  `web_name` varchar(20) DEFAULT NULL,
  `reg_clause` varchar(100) DEFAULT NULL COMMENT '注册条款',
  `notice` varchar(100) DEFAULT NULL COMMENT '公告',
  `address` varchar(100) DEFAULT NULL,
  `postcode` varchar(20) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `copyright` varchar(20) DEFAULT NULL,
  `weblogo` varchar(20) DEFAULT NULL,
  `afford_method` varchar(100) DEFAULT NULL,
  `shops_stream` varchar(100) DEFAULT NULL,
  `post_method` varchar(100) DEFAULT NULL COMMENT '送货方式',
  `post_price` decimal(10,2) DEFAULT NULL,
  `post_desc` varchar(100) DEFAULT NULL COMMENT '运输说明',
  `work_time` varchar(50) DEFAULT NULL,
  `after_service` varchar(100) DEFAULT NULL,
  `law` varchar(100) DEFAULT NULL,
  `commques` varchar(100) DEFAULT NULL COMMENT '常见问题',
  `deal_rule` varchar(100) DEFAULT NULL COMMENT '交易条款',
  PRIMARY KEY (`para_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of global_parameter
-- ----------------------------
INSERT INTO `global_parameter` VALUES ('1', 'dd图书，买你所想，买你所爱，你值得拥有', '你可以注册', '请注意，这是公告', '广州海珠区仲恺路500号', '50000', '15814516280', '东东', 'img/dd.jpg', null, null, null, null, null, '7X24小时', null, null, '没问题', '没问题');

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `order_id` varchar(60) CHARACTER SET utf8 NOT NULL COMMENT '订单id',
  `user_id` int(20) DEFAULT NULL COMMENT '用户id',
  `payment` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '实付金额。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `payment_type` int(2) DEFAULT NULL COMMENT '支付类型，1、微信，2、支付宝',
  `status` int(5) NOT NULL COMMENT '状态：0、未付款，1、已付款，2、未发货，3、已发货，4、交易成功，5、交易关闭',
  `post_fee` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮费。精确到2位小数;单位:元。如:200.07，表示:200元7分',
  `create_time` datetime DEFAULT NULL COMMENT '订单创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '订单更新时间',
  `order_mount` int(10) DEFAULT NULL,
  `payment_time` datetime DEFAULT NULL COMMENT '付款时间',
  `end_time` datetime DEFAULT NULL COMMENT '交易完成时间',
  `close_time` datetime DEFAULT NULL COMMENT '交易关闭时间',
  `shipping_name` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流名称',
  `shipping_code` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '物流单号',
  `buyer_message` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '买家留言',
  `buyer_rate` int(2) DEFAULT NULL COMMENT '买家是否已经评价',
  PRIMARY KEY (`order_id`),
  KEY `create_time` (`create_time`),
  KEY `payment_type` (`payment_type`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of orders
-- ----------------------------
INSERT INTO `orders` VALUES ('1091780632524578', '15', '132.40', '2', '0', '0.00', '2018-11-26 22:09:44', '2018-11-26 22:09:44', '1', null, null, null, '中通', null, null, '0');

-- ----------------------------
-- Table structure for order_detail
-- ----------------------------
DROP TABLE IF EXISTS `order_detail`;
CREATE TABLE `order_detail` (
  `order_detail_id` int(16) NOT NULL AUTO_INCREMENT,
  `order_number` varchar(60) DEFAULT NULL COMMENT '订单号',
  `order_id` varchar(60) DEFAULT NULL,
  `product_id` int(16) DEFAULT NULL,
  `store_id` int(16) DEFAULT NULL,
  `mount` int(16) DEFAULT NULL COMMENT '卖出数量',
  `unit_price` decimal(10,2) DEFAULT NULL COMMENT '单价',
  `total_price` decimal(10,2) DEFAULT NULL,
  `post_status` varchar(10) DEFAULT NULL COMMENT '支付、发货状态',
  `delivery_time` datetime DEFAULT NULL COMMENT '发货时间',
  `receive_status` varchar(10) DEFAULT NULL COMMENT '收货状态',
  `image_url` varchar(150) DEFAULT NULL,
  `product_name` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `order_id` (`order_id`),
  KEY `product_id` (`product_id`),
  KEY `store_id` (`store_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_detail
-- ----------------------------
INSERT INTO `order_detail` VALUES ('3', '1091780632524578', '1091780632524578', '188', '6', '2', '66.20', '132.40', '0', null, '0', 'upload/images/1035c83ef73b4543.jpg', '码农翻身（好玩有趣的编程知识）');

-- ----------------------------
-- Table structure for order_shipping
-- ----------------------------
DROP TABLE IF EXISTS `order_shipping`;
CREATE TABLE `order_shipping` (
  `order_id` varchar(50) NOT NULL COMMENT '订单ID',
  `receiver_name` varchar(20) DEFAULT NULL COMMENT '收货人全名',
  `receiver_phone` varchar(20) DEFAULT NULL COMMENT '固定电话',
  `receiver_mobile` varchar(30) DEFAULT NULL COMMENT '移动电话',
  `receiver_state` varchar(10) DEFAULT NULL COMMENT '省份',
  `receiver_city` varchar(10) DEFAULT NULL COMMENT '城市',
  `receiver_district` varchar(20) DEFAULT NULL COMMENT '区/县',
  `receiver_address` varchar(200) DEFAULT NULL COMMENT '收货地址，如：xx路xx号',
  `receiver_zip` varchar(6) DEFAULT NULL COMMENT '邮政编码,如：310001',
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of order_shipping
-- ----------------------------
INSERT INTO `order_shipping` VALUES ('1091780632524578', 'hehe', null, '15814516280', '广东', '广州', '海珠区', '广州海珠区', null, '2018-11-26 22:09:44', '2018-11-26 22:09:44');
INSERT INTO `order_shipping` VALUES ('23920885273465502', 'wdd', null, '15814516280', '广东', '广州', '海珠区', '广州仲恺路500号', '55555', '2018-11-24 16:33:56', '2018-11-24 16:33:56');

-- ----------------------------
-- Table structure for privilege
-- ----------------------------
DROP TABLE IF EXISTS `privilege`;
CREATE TABLE `privilege` (
  `priv_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `parent_id` int(16) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  `is_parent` int(2) DEFAULT NULL,
  PRIMARY KEY (`priv_id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of privilege
-- ----------------------------
INSERT INTO `privilege` VALUES ('1', '系统后台管理', 'system', '', '0', '2018-11-11 22:10:57', '2018-11-11 22:11:00', '1');
INSERT INTO `privilege` VALUES ('2', '角色管理', 'role-manage', 'admin/role', '1', '2018-11-11 22:12:16', '2018-11-24 20:32:19', '1');
INSERT INTO `privilege` VALUES ('3', '店铺管理', 'store-manage', 'admin/store', '1', '2018-11-11 22:17:23', '2018-11-24 20:32:15', '1');
INSERT INTO `privilege` VALUES ('4', '用户管理', 'user-manage', 'admin/user', '1', '2018-11-11 22:18:53', '2018-11-24 20:32:10', '1');
INSERT INTO `privilege` VALUES ('5', '权限管理', 'privilege-manage', 'privilege', '1', '2018-11-11 22:19:18', '2018-11-19 20:54:53', '1');
INSERT INTO `privilege` VALUES ('6', '添加角色', 'role-add', 'admin/role/addition', '2', '2018-11-11 22:19:45', '2018-11-19 10:27:02', '0');
INSERT INTO `privilege` VALUES ('7', '角色列表', 'role-list', 'admin/role/list', '2', '2018-11-11 22:20:14', '2018-11-18 23:10:41', '0');
INSERT INTO `privilege` VALUES ('8', '角色修改', 'role-edit', 'admin/role/edit', '2', '2018-11-11 22:20:36', '2018-11-18 23:10:48', '0');
INSERT INTO `privilege` VALUES ('9', '角色删除', 'role-delete', 'admin/role/deletion', '2', '2018-11-11 22:23:13', '2018-11-18 23:10:57', '0');
INSERT INTO `privilege` VALUES ('10', '店铺列表', 'store-list', 'admin/store/list', '3', '2018-11-11 22:23:50', '2018-11-18 23:11:04', '0');
INSERT INTO `privilege` VALUES ('11', '店铺添加', 'store-add', 'admin/store/addition', '3', '2018-11-11 22:24:47', '2018-11-18 23:11:12', '0');
INSERT INTO `privilege` VALUES ('12', '店铺修改', 'store-edit', 'admin/store/edit', '3', '2018-11-11 22:25:41', '2018-11-18 23:11:18', '0');
INSERT INTO `privilege` VALUES ('13', '店铺删除', 'store-delete', 'admin/store/deletion', '3', '2018-11-11 22:26:25', '2018-11-18 23:11:25', '0');
INSERT INTO `privilege` VALUES ('14', '用户修改', 'user-edit', 'admin/user/edit', '4', '2018-11-11 22:27:06', '2018-11-18 23:11:33', '0');
INSERT INTO `privilege` VALUES ('15', '用户删除', 'user-delete', 'admin/user/deletion', '4', '2018-11-11 22:28:21', '2018-11-26 21:12:37', '0');
INSERT INTO `privilege` VALUES ('16', '用户列表', 'user-list', 'admin/user/list', '4', '2018-11-11 22:28:41', '2018-11-18 23:12:03', '0');
INSERT INTO `privilege` VALUES ('17', '用户添加', 'user-add', 'admin/user/addition', '4', '2018-11-11 22:29:04', '2018-11-18 23:12:10', '0');
INSERT INTO `privilege` VALUES ('18', '权限添加', 'privilege-add', 'admin/privilege/addition', '5', '2018-11-11 22:30:05', '2018-11-18 23:22:52', '0');
INSERT INTO `privilege` VALUES ('19', '权限列表', 'privilege-list', 'admin/privilege/list', '5', '2018-11-11 22:40:35', '2018-11-18 23:23:01', '0');
INSERT INTO `privilege` VALUES ('20', '权限修改', 'privilege-edit', 'admin/privilege/edit', '5', '2018-11-11 22:41:02', '2018-11-18 23:23:30', '0');
INSERT INTO `privilege` VALUES ('21', '权限删除', 'privilege-delete', 'admin/privilege/deletion', '5', '2018-11-11 22:41:34', '2018-11-18 23:23:19', '0');
INSERT INTO `privilege` VALUES ('32', '图书管理', 'book-manage', 'admin/book', '1', '2018-11-19 20:53:08', '2018-11-24 20:32:05', '1');
INSERT INTO `privilege` VALUES ('33', '图书添加上架', 'book-add', 'book/addition', '32', '2018-11-19 20:53:12', '2018-11-21 20:41:33', '0');
INSERT INTO `privilege` VALUES ('34', '图书编辑', 'book-edit', 'book/edit', '32', '2018-11-19 20:56:48', '2018-11-19 20:57:44', '0');
INSERT INTO `privilege` VALUES ('35', '图书下架', 'book-shelf', 'admin/book/shelf', '32', '2018-11-19 20:57:49', '2018-11-25 23:33:47', '0');
INSERT INTO `privilege` VALUES ('36', '图书查询', 'book-query', 'book/query', '32', '2018-11-19 20:59:52', '2018-11-19 21:01:48', '0');
INSERT INTO `privilege` VALUES ('39', '个人中心', 'personal-center', 'admin/personal', '1', '2018-11-23 16:06:51', '2018-11-24 20:32:26', '1');
INSERT INTO `privilege` VALUES ('40', '我的信息', 'person-info', '/admin/user/edti', '39', '2018-11-23 16:08:53', '2018-11-23 16:13:45', '0');
INSERT INTO `privilege` VALUES ('42', '我的店铺', 'person-store', '/admin/store/edit', '39', '2018-11-23 16:10:01', '2018-11-23 16:11:09', '0');
INSERT INTO `privilege` VALUES ('43', '我的图书', 'person-book-list', '/admin/book/list', '39', '2018-11-23 16:11:54', '2018-11-23 16:13:38', '0');
INSERT INTO `privilege` VALUES ('44', '订单管理', 'order-manage', 'admin/order', '1', '2018-11-24 20:31:14', '2018-11-24 20:31:47', '1');
INSERT INTO `privilege` VALUES ('45', '订单列表', 'order-list', 'admin/order/list', '44', '2018-11-24 20:31:16', '2018-11-24 20:32:54', '0');
INSERT INTO `privilege` VALUES ('46', '订单修改', 'order-edit', 'admin/order/edit', '44', '2018-11-24 20:32:58', '2018-11-24 20:33:28', '0');
INSERT INTO `privilege` VALUES ('47', '订单删除', 'order-delete', 'admin/order/deletion', '44', '2018-11-24 20:33:31', '2018-11-24 20:34:02', '0');
INSERT INTO `privilege` VALUES ('49', '图书删除', 'book-delete', 'admin/book/deletion', '32', '2018-11-25 23:32:31', '2018-11-25 23:32:51', '0');

-- ----------------------------
-- Table structure for reply
-- ----------------------------
DROP TABLE IF EXISTS `reply`;
CREATE TABLE `reply` (
  `reply_id` int(16) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `title` varchar(20) DEFAULT NULL,
  `content` varchar(100) DEFAULT NULL,
  `user_id` int(16) DEFAULT NULL,
  `username` varchar(20) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `user_ip` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`reply_id`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `reply_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reply
-- ----------------------------

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(16) NOT NULL AUTO_INCREMENT,
  `name` varchar(64) DEFAULT NULL,
  `code` varchar(64) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES ('1', '超级管理员', 'admin', '超级管理员，拥有所有权限', '2018-11-04 22:14:09', '2018-11-04 22:14:11');
INSERT INTO `role` VALUES ('2', '普通用户', 'customer', '一般用户，买东西的', '2018-11-04 22:16:03', '2018-11-04 22:16:06');
INSERT INTO `role` VALUES ('3', '商家', 'business', '个体商家、企业商家，卖家', '2018-11-04 22:17:54', '2018-11-04 22:17:57');
INSERT INTO `role` VALUES ('5', '老板', 'boss', '最高领导人', '2018-11-18 17:50:42', '2018-11-18 17:50:44');
INSERT INTO `role` VALUES ('6', '用户管理员', 'user-manager', '管理系统中的用户', '2018-11-21 20:48:00', '2018-11-21 20:48:04');
INSERT INTO `role` VALUES ('7', '店铺管理员', 'store-manager', '管理在本站注册的店铺', '2018-11-21 20:48:45', '2018-11-21 20:48:47');
INSERT INTO `role` VALUES ('8', 'VIP用户', 'vip-customer', 'VIP用户，买书有折扣', '2018-11-21 21:09:17', '2018-11-21 21:09:20');
INSERT INTO `role` VALUES ('9', '角色权限管理员', 'role-privilege-manager', '管理角色权限信息', '2018-11-23 23:13:51', '2018-11-23 23:13:51');

-- ----------------------------
-- Table structure for role_privilege
-- ----------------------------
DROP TABLE IF EXISTS `role_privilege`;
CREATE TABLE `role_privilege` (
  `role_id` int(16) NOT NULL,
  `privilege_id` int(16) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`role_id`,`privilege_id`),
  KEY `privilege_id` (`privilege_id`),
  CONSTRAINT `role_privilege_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`),
  CONSTRAINT `role_privilege_ibfk_2` FOREIGN KEY (`privilege_id`) REFERENCES `privilege` (`priv_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of role_privilege
-- ----------------------------
INSERT INTO `role_privilege` VALUES ('1', '1', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '2', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '3', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '4', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '5', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '6', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '7', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '8', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '9', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '10', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '11', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '12', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '13', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '14', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '15', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '16', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '17', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '18', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '19', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '20', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '21', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '32', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '33', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '34', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '35', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '36', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '39', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '40', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '42', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '43', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('1', '44', '2018-11-25 23:35:43', '2018-11-25 23:35:43');
INSERT INTO `role_privilege` VALUES ('1', '45', '2018-11-25 23:35:43', '2018-11-25 23:35:43');
INSERT INTO `role_privilege` VALUES ('1', '46', '2018-11-25 23:35:43', '2018-11-25 23:35:43');
INSERT INTO `role_privilege` VALUES ('1', '47', '2018-11-25 23:35:43', '2018-11-25 23:35:43');
INSERT INTO `role_privilege` VALUES ('1', '49', '2018-11-25 23:35:42', '2018-11-25 23:35:42');
INSERT INTO `role_privilege` VALUES ('3', '1', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '3', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '4', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '12', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '14', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '32', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '33', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '34', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '35', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '36', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('3', '39', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '40', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '42', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '43', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '44', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '45', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '46', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '47', '2018-11-25 23:35:35', '2018-11-25 23:35:35');
INSERT INTO `role_privilege` VALUES ('3', '49', '2018-11-25 23:35:34', '2018-11-25 23:35:34');
INSERT INTO `role_privilege` VALUES ('5', '1', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '2', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '3', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '4', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '5', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '6', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '7', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '8', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '9', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '10', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '11', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '12', '2018-11-25 23:35:48', '2018-11-25 23:35:48');
INSERT INTO `role_privilege` VALUES ('5', '13', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '14', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '15', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '16', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '17', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '18', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '19', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '20', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '21', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '32', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '33', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '34', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '35', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '36', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '39', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '40', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '42', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '43', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '44', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '45', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '46', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '47', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('5', '49', '2018-11-25 23:35:49', '2018-11-25 23:35:49');
INSERT INTO `role_privilege` VALUES ('6', '1', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '4', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '14', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '15', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '16', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '17', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '39', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '40', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '42', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('6', '43', '2018-11-23 23:50:58', '2018-11-23 23:50:58');
INSERT INTO `role_privilege` VALUES ('7', '1', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '3', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '10', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '11', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '12', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '13', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '39', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '40', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '42', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('7', '43', '2018-11-23 23:56:20', '2018-11-23 23:56:20');
INSERT INTO `role_privilege` VALUES ('9', '1', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '2', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '5', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '6', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '7', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '8', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '9', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '18', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '19', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '20', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '21', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '39', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '40', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '42', '2018-11-23 23:14:15', '2018-11-23 23:14:15');
INSERT INTO `role_privilege` VALUES ('9', '43', '2018-11-23 23:14:15', '2018-11-23 23:14:15');

-- ----------------------------
-- Table structure for store
-- ----------------------------
DROP TABLE IF EXISTS `store`;
CREATE TABLE `store` (
  `store_id` int(16) NOT NULL AUTO_INCREMENT,
  `store_manager_id` int(16) DEFAULT NULL,
  `store_phone_num` varchar(16) DEFAULT NULL,
  `store_telephone` varchar(16) DEFAULT NULL,
  `store_name` varchar(64) DEFAULT NULL,
  `store_position` varchar(128) DEFAULT NULL,
  `created` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updated` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`store_id`),
  KEY `store_manager_id` (`store_manager_id`),
  CONSTRAINT `store_ibfk_1` FOREIGN KEY (`store_manager_id`) REFERENCES `user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of store
-- ----------------------------
INSERT INTO `store` VALUES ('1', '2', '15814516280', '06685337781', 'dd书城', '广州海珠区', '2018-11-23 17:32:12', '2018-11-23 17:32:12');
INSERT INTO `store` VALUES ('2', '11', '15814516280', '10086', 'zdd书城', '深圳', '2018-11-23 23:57:51', '2018-11-23 23:57:51');
INSERT INTO `store` VALUES ('3', '1', '15814516280', '10086', '管理员商店', '广州', '2018-11-24 20:35:43', '2018-11-24 20:35:46');
INSERT INTO `store` VALUES ('6', '24', null, null, '新店铺', '广州', '2018-11-26 22:05:24', '2018-11-26 22:05:24');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(16) NOT NULL AUTO_INCREMENT,
  `username` varchar(32) DEFAULT NULL,
  `nickname` varchar(32) DEFAULT NULL,
  `password` varchar(32) DEFAULT NULL,
  `gender` char(2) DEFAULT NULL,
  `email` varchar(64) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `zip_code` varchar(16) DEFAULT NULL COMMENT '邮政编码',
  `location` varchar(32) DEFAULT NULL,
  `detail_address` varchar(64) DEFAULT NULL,
  `identity` varchar(32) DEFAULT NULL COMMENT '身份',
  `active` char(1) DEFAULT NULL,
  `code` varchar(100) DEFAULT NULL COMMENT '用户激活码',
  `updated` datetime DEFAULT NULL,
  `created` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '超级管理员', '202cb962ac59075b964b07152d234b70', '1', '414882567@qq.com', '15814516280', '55555', '广州', '广州仲恺路500号阿斯顿', '管理员', '1', null, '2018-11-11 20:14:23', '2018-10-30 17:45:32');
INSERT INTO `user` VALUES ('2', 'zdd', '商家1', '202cb962ac59075b964b07152d234b70', '1', '414882567@qq.com', '15814516280', '55555', '广州', '广州仲恺路500号1', '自由职业', '1', null, '2018-11-24 20:30:17', '2018-10-30 22:25:01');
INSERT INTO `user` VALUES ('11', 'wdd', '商家2', '202cb962ac59075b964b07152d234b70', '0', '1292728797@qq.com', '15814516280', '55555', '广州', '广州仲恺路500号', '自由职业', '1', null, '2018-11-06 16:24:01', '2018-11-06 16:24:01');
INSERT INTO `user` VALUES ('12', 'user-manager', '用户管理员', '202cb962ac59075b964b07152d234b70', '0', '1292728797@qq.com', '15814516280', null, '北京', '北京市海淀区', '管理员', '1', null, '2018-11-24 22:47:34', '2018-11-24 22:47:40');
INSERT INTO `user` VALUES ('13', 'store-manager', '商店管理员', '202cb962ac59075b964b07152d234b70', '1', '414882567@qq.com', '15814516280', null, '上海', '上海', '管理员', '1', null, '2018-11-24 22:47:37', '2018-11-24 22:47:42');
INSERT INTO `user` VALUES ('14', 'xiaoxiao', '买家1', '202cb962ac59075b964b07152d234b70', '1', '414882567@qq.com', '15814623567', null, '深圳', '深圳', '上班族', '1', null, '2018-11-24 22:47:47', '2018-11-24 22:47:45');
INSERT INTO `user` VALUES ('15', 'hehe', '呵呵', '202cb962ac59075b964b07152d234b70', '1', '1292728797@qq.com', '15814516280', null, '广州', '广州海珠区', '自由职业', '1', '333468e3-c383-49d2-83fd-d57c349c9ba4', '2018-11-26 20:45:13', '2018-11-26 20:45:13');
INSERT INTO `user` VALUES ('16', 'xixi', '嘻嘻', '202cb962ac59075b964b07152d234b70', '0', '1292728797@qq.com', '15814516280', null, '广州', '广州海珠区', '自由职业', '1', null, '2018-11-26 21:02:47', '2018-11-26 21:02:47');
INSERT INTO `user` VALUES ('24', 'www', null, '202cb962ac59075b964b07152d234b70', null, '1292728797@qq.com', null, null, '广州', '广州海珠区', 'business', '1', null, '2018-11-26 22:04:48', '2018-11-26 22:04:48');
INSERT INTO `user` VALUES ('25', 'zdd123', null, '202cb962ac59075b964b07152d234b70', null, '1292728797@qq.com', null, null, '广州', '广州海珠区', 'ordinary', '1', null, '2018-11-27 17:26:15', '2018-11-27 17:26:15');

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role` (
  `user_id` int(16) NOT NULL,
  `role_id` int(16) NOT NULL,
  `created` datetime DEFAULT NULL,
  `updated` datetime DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_id` (`role_id`),
  CONSTRAINT `user_role_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`),
  CONSTRAINT `user_role_ibfk_2` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES ('1', '1', '2018-11-24 22:35:40', '2018-11-24 22:35:40');
INSERT INTO `user_role` VALUES ('2', '3', '2018-11-23 23:38:32', '2018-11-23 23:38:32');
INSERT INTO `user_role` VALUES ('11', '3', '2018-11-23 23:59:43', '2018-11-23 23:59:43');
INSERT INTO `user_role` VALUES ('12', '6', '2018-11-23 23:23:51', '2018-11-23 23:23:51');
INSERT INTO `user_role` VALUES ('13', '7', '2018-11-23 23:55:37', '2018-11-23 23:55:37');
INSERT INTO `user_role` VALUES ('14', '2', '2018-11-24 00:01:11', '2018-11-24 00:01:11');
INSERT INTO `user_role` VALUES ('15', '2', '2018-11-26 22:02:52', '2018-11-26 22:02:52');
INSERT INTO `user_role` VALUES ('16', '2', '2018-11-26 22:03:36', '2018-11-26 22:03:36');
INSERT INTO `user_role` VALUES ('24', '3', '2018-11-26 22:05:24', '2018-11-26 22:05:24');
INSERT INTO `user_role` VALUES ('25', '2', '2018-11-27 17:27:22', '2018-11-27 17:27:22');
