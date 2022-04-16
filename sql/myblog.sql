-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: localhost    Database: myblog
-- ------------------------------------------------------
-- Server version	5.7.17-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `t_blog`
--

DROP TABLE IF EXISTS `t_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_blog` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appreciation` bit(1) NOT NULL,
  `commentabled` bit(1) NOT NULL,
  `content` longtext,
  `create_time` datetime DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `first_picture` longtext,
  `flag` varchar(255) DEFAULT NULL,
  `published` bit(1) NOT NULL,
  `recommend` bit(1) NOT NULL,
  `share_statement` bit(1) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `views` int(11) DEFAULT NULL,
  `type_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `comment_count` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `FK292449gwg5yf7ocdlmswv9w4j` (`type_id`) USING BTREE,
  KEY `FK8ky5rrsxh01nkhctmo7d48p82` (`user_id`) USING BTREE,
  CONSTRAINT `FK292449gwg5yf7ocdlmswv9w4j` FOREIGN KEY (`type_id`) REFERENCES `t_type` (`id`),
  CONSTRAINT `FK8ky5rrsxh01nkhctmo7d48p82` FOREIGN KEY (`user_id`) REFERENCES `t_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_blog`
--

LOCK TABLES `t_blog` WRITE;
/*!40000 ALTER TABLE `t_blog` DISABLE KEYS */;
INSERT INTO `t_blog` VALUES (15,_binary '',_binary '','题目来源于 LeetCode 上第 1 道问题：两数之和。题目难度为 Easy。\r\n\r\n题目链接：https://leetcode-cn.com/problems/two-sum/\r\n\r\n## 题目描述\r\n给定一个整数数组 nums 和一个整数目标值 target，请你在该数组中找出 和为目标值 target  的那 两个 整数，并返回它们的数组下标。\r\n\r\n你可以假设每种输入只会对应一个答案。但是，数组中同一个元素在答案里不能重复出现。\r\n\r\n你可以按任意顺序返回答案。\r\n## 示例:\r\n\r\n给定 nums = [2, 7, 11, 15], target = 9\r\n\r\n因为 nums[0] + nums[1] = 2 + 7 = 9\r\n\r\n\r\n所以返回 [0, 1]\r\n\r\n## 代码实现\r\n\r\n### 暴力解法\r\n```java\r\nclass Solution {\r\n\r\n    public int[] twoSum(int[] nums, int target) {\r\n        // 暴力解法：双层for遍历法,时间复杂度较高\r\n        int[] array = new int[2];\r\n        for(int x=0; x<nums.length-1; x++) {\r\n             for(int y=x+1;y<nums.length;y++){\r\n                 if(nums[x]+nums[y]==target) {\r\n                     array[0] = x;\r\n                     array[1] = y;\r\n                     break;\r\n                 }\r\n             }\r\n         }\r\n        return array;\r\n\r\n}\r\n```\r\n\r\n### 哈希表法\r\n\r\n```java\r\nclass Solution {\r\n    public int[] twoSum(int[] nums, int target) {\r\n\r\n        // 哈希表法\r\n        // 注意需要下标，故采用map\r\n        int[] result = new int[2];\r\n        HashMap<Integer,Integer> map = new HashMap<>();\r\n        for(int i=0;i<nums.length;i++) {\r\n            if(map.containsKey(target-nums[i])) {\r\n                result[0] = map.get(target-nums[i]);\r\n                result[1] = i;\r\n                return result;  // 因为只有一种解，故找到了就退出\r\n            }\r\n            map.put(nums[i],i);\r\n        }\r\n        return new int[0]; // 不存在的情况\r\n    }\r\n\r\n}\r\n```','2021-02-21 20:59:41','两数之和：给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。','https://img1.baidu.com/it/u=3646032731,1088774285&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=260','原创',_binary '',_binary '',_binary '','LeetCode-001 两数之和','2022-04-16 06:25:59',109,2,1,2),(16,_binary '\0',_binary '','# 冒泡排序优化\r\n\r\n## 优化思路：\r\n\r\n1.根据一轮内是否发生交换判断是否已经有序，若有序提前结束\r\n\r\n2.根据一轮内最后一次发生交换的位置界定有序区，确定交换范围\r\n\r\n3.鸡尾酒排序：交替方向（每轮内先从左到右，再从右到左）\r\n\r\n## 代码实现：\r\n\r\n```java\r\nimport java.util.Arrays;\r\nimport java.util.Scanner;\r\n\r\npublic class Main {\r\n\r\n// 优化后的冒泡排序算法实现\r\npublic static void bubbleSort(int[] array){\r\n    int temp = 0;\r\n\r\n    int startsortlength = 0;   // 从左往右起始有序区\r\n    int endsortlength = array.length - 1;  // 从右到左起始有序区\r\n    int startExchangeIndex = 0;  // 从左到右发生交换的位置\r\n    int endExchangeIndex = array.length-1;  // 从右到左发生交换的位置\r\n\r\n    // 交替方向：从左到右，从右到左，注意好起末位置！\r\n    for(int i=0;i<array.length/2;i++) {\r\n        boolean isSorted = true;\r\n        for(int j=startsortlength;j<endsortlength;j++) {\r\n            if(array[j] > array[j+1]) {\r\n                temp = array[j];\r\n                array[j] = array[j+1];\r\n                array[j+1] = temp;\r\n                startExchangeIndex = j;\r\n                isSorted = false;\r\n            }\r\n        }\r\n        if(isSorted) break;\r\n        endsortlength = startExchangeIndex;\r\n        for(int k=endsortlength;k>startsortlength;k--) {\r\n            if(array[k] < array[k-1]) {\r\n                temp = array[k];\r\n                array[k] = array[k-1];\r\n                array[k-1] = temp;\r\n                endExchangeIndex = k;\r\n                isSorted = false;\r\n            }\r\n        }\r\n        startsortlength = endExchangeIndex;\r\n        if(isSorted) break;\r\n    }\r\n\r\n}\r\n\r\n// Demo：输入7个数字利用冒泡排序从小到大排序\r\npublic static void main(String[] args) {\r\n    Scanner scanner = new Scanner(System.in);\r\n     int[] arr = new int[7];\r\n    for (int i = 0; i < arr.length; i++) {\r\n        arr[i] = scanner.nextInt();\r\n    }\r\n    scanner.close();\r\n    bubbleSort(arr);\r\n    for (int k = 0; k < arr.length; k++) {\r\n        System.out.print(arr[k]+\" \");\r\n    }\r\n}\r\n```\r\n','2022-04-16 04:54:23','冒泡排序优化思路：每轮根据是否发生交换判断是否有序提前结束、根据发生交换的位置确定有序区范围、鸡尾酒交替交换方向','https://img0.baidu.com/it/u=3719358199,3799907524&fm=253&fmt=auto&app=138&f=JPEG?w=762&h=500','原创',_binary '',_binary '',_binary '','冒泡排序优化','2022-04-16 08:12:48',4,2,1,0),(17,_binary '\0',_binary '','# 二维前缀和\r\n\r\n## 定义和公式\r\n\r\n二维前缀和应用于求一个矩阵内一个任意的子矩阵的数的和\r\n\r\n[![二维前缀和](https://img2022.cnblogs.com/blog/2730053/202202/2730053-20220201113759368-686770293.png \"二维前缀和\")](https://img2022.cnblogs.com/blog/2730053/202202/2730053-20220201113759368-686770293.png \"二维前缀和\")\r\n\r\n首先定义s为前缀和，a为矩阵内某坐标元素。\r\n\r\n从图中我们不难发现， s[i-1][j] 和 s[i][j-i] 有重叠部分（即红色部分）\r\n\r\ns[i−1][j]+s[i][j−1]−s[i−1][j−1] （即：红+黄+红+蓝-红） 得出的即为红色部分加上黄色部分加上蓝色部分的和\r\n\r\n最后再加上绿色部分 a[i][j] （即这个数本身）\r\n\r\n即为 s[i][j]\r\n\r\n因此我们可以推出其递推式：\r\n\r\ns[i,j]= s[i-1,j]+ s[i,j-1]-s[i-1,j-1]+A[i,j]\r\n\r\n\r\n还不理解的小伙伴可以看看二维前缀和讲解视频：https://www.bilibili.com/video/BV1pi4y1j7si?p=3\r\n\r\n## 案例实战\r\n\r\n### CCF202104-2 领域均值\r\n\r\n题目链接：http://118.190.20.162/view.page?gpid=T127\r\n\r\n#### 暴力解法\r\n\r\n```java\r\n	//暴力解法：四重for循环---时间复杂度高大数据情况下超时，70分\r\n	public static void main(String[] args) {\r\n		int count=0;\r\n		Scanner sc=new Scanner(System.in);\r\n		int n=sc.nextInt();\r\n		int L=sc.nextInt();\r\n		int r=sc.nextInt();\r\n		int t=sc.nextInt();\r\n		int[][] nums=new int[n][n];\r\n		for(int i=0;i<n;i++) {\r\n			for(int j=0;j<n;j++) {\r\n				nums[i][j]=sc.nextInt();\r\n			}\r\n		}\r\n		for(int i=0;i<n;i++) {\r\n			for(int j=0;j<n;j++) {\r\n				if(getAverage(nums, r,t, i, j))count++;\r\n			}\r\n		}\r\n		System.out.println(count);\r\n\r\n	}\r\n	//双重for循环求nums[0][0]~nums[raw][col]的总和  与 count* t比较\r\n	public static boolean getAverage(int[][] nums,int r,int t,int raw,int col) {\r\n		int count=0;\r\n		int sum=0;\r\n		for(int i=raw-r;i<=raw+r;i++) {\r\n			for(int j=col-r;j<=col+r;j++) {\r\n				if(i<0||j<0||i>=nums.length||j>=nums[i].length)continue;\r\n				//i或j处于边界时，跳过\r\n				sum+=nums[i][j];\r\n				count++;\r\n			}\r\n		}\r\n\r\n		if(sum<=count*t) return true;\r\n		else return false;\r\n	}\r\n```\r\n\r\n#### 二维前缀和\r\n\r\n```java\r\n	// 二维前缀和解法，满分100分\r\n	public static void main(String[] args) {\r\n		Scanner sc=new Scanner(System.in);\r\n		int n=sc.nextInt();\r\n		int L=sc.nextInt();\r\n		int r=sc.nextInt();\r\n		int t=sc.nextInt();\r\n\r\n		int[][] nums=new int[n+2][n+2];\r\n		int[][] sum=new int[n+2][n+2];//二维前缀和数组\r\n		int result=0;\r\n		for(int i=1;i<=n;i++) {\r\n			for(int j=1;j<=n;j++) {\r\n				nums[i][j]=sc.nextInt();\r\n				// 二维前缀和公式\r\n				sum[i][j]=sum[i-1][j]+sum[i][j-1]-sum[i-1][j-1]+nums[i][j];\r\n			}\r\n		}\r\n\r\n		for(int i=1;i<=n;i++) {\r\n			for(int j=1;j<=n;j++) {\r\n				int iMin=Math.max(1, i-r);  //i的最上界\r\n				int iMax=Math.max(n, i+r);  //i的最下界\r\n				int jMin=Math.max(1, j-r);  //j的最上届\r\n				int jMax=Math.max(n, j+r);  //j的最下届\r\n				int count=(iMax-iMin+1)*(jMax-jMin+1);  //矩形里符合的元素个数\r\n				int temp=sum[iMax][jMax]-sum[iMax][jMin-1]-sum[iMin-1][jMax]+sum[iMin-1][jMin-1];\r\n				if(temp<=count*t) {result++;}\r\n			}\r\n		}\r\n		System.out.println(result);\r\n	}\r\n}\r\n```','2022-04-16 07:51:38','讲解二维前缀和，并以CCF 202104-2 领域均值题为例实战','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fwww.pianshen.com%2Fimages%2F89%2F3e51f0163326b24c212f660ea2370661.png&refer=http%3A%2F%2Fwww.pianshen.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1652687564&t=ffd8327f5f96e32359aa916fa776389f','原创',_binary '',_binary '',_binary '','二维前缀和','2022-04-16 08:12:53',3,2,1,0),(18,_binary '\0',_binary '','# LeetCode-080 删除有序数组中重复项\r\n\r\n### 题目链接：\r\n\r\nhttps://leetcode-cn.com/problems/remove-duplicates-from-sorted-array-ii/\r\n\r\n### 题目要求：\r\n\r\n给你一个有序按升序排列数组 nums ，请你 原地 删除重复出现的元素，使每个元素 最多出现两次 ，返回删除后数组的新长度。\r\n\r\n不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。\r\n\r\n### 案例：\r\n\r\n    输入：nums = [0,0,1,1,1,1,2,3,3]\r\n    输出：7, nums = [0,0,1,1,2,3,3]\r\n    解释：函数应返回新长度 length = 7, 并且原数组的前五个元素被修改为 0, 0, 1, 1, 2, 3, 3 。 不需要考虑数组中超出新长度后面的元素。\r\n\r\n## 通解：\r\n\r\n```java\r\nclass Solution {\r\n    public int removeDuplicates(int[] nums) {\r\n        // 添加了限定条件：每个元素最多出现两次\r\n        // 泛化为k个的处理\r\n        return process(nums,2);\r\n    }\r\n    // 通解\r\n    public int process(int[] nums, int n) {\r\n        int index = 0;\r\n        for (int x : nums) {\r\n            // 初始化 判断\r\n            if(index < n || nums[index-n] != x) nums[index++] = x;\r\n        }\r\n        return index;\r\n    }\r\n}\r\n```','2022-04-16 08:05:44','LeetCode第80题：删除有序数组中重复项通解，给你一个有序按升序排列数组 nums ，请你原地删除重复出现的元素，使每个元素最多出现两次，返回删除后数组的新长度。','https://gimg2.baidu.com/image_search/src=http%3A%2F%2Frank.chinaz.comwelcomesd.rongsoft.com%2Fupload%2Fimg%2F202002%2F785a13ca8cef4d2f907c8b817bbc45cc.jfif&refer=http%3A%2F%2Frank.chinaz.comwelcomesd.rongsoft.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1652688334&t=2b8f0a11cf8db1a514991f618299729a','转载',_binary '',_binary '',_binary '\0','LeetCode-080 删除有序数组中重复项','2022-04-16 08:11:29',2,2,1,0);
/*!40000 ALTER TABLE `t_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_comment`
--

DROP TABLE IF EXISTS `t_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `blog_id` bigint(20) DEFAULT NULL,
  `parent_comment_id` bigint(20) DEFAULT NULL,
  `admin_comment` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_comment`
--

LOCK TABLES `t_comment` WRITE;
/*!40000 ALTER TABLE `t_comment` DISABLE KEYS */;
INSERT INTO `t_comment` VALUES (29,'木华','1075558916@qq.com','来看看鸭！','https://6863-hchhtc123-8glmp9fre558cb50-1304974356.tcb.qcloud.la/author.png?sign=807a2e80c6ae9499cf27eebb09f218ca&t=1649484926','2022-04-13 02:18:50',15,-1,_binary ''),(32,'木华','1075558916@qq.com','快来看看鸭','https://6863-hchhtc123-8glmp9fre558cb50-1304974356.tcb.qcloud.la/author.png?sign=807a2e80c6ae9499cf27eebb09f218ca&t=1649484926','2022-04-13 08:58:11',4,-1,_binary ''),(33,'hch','1075558916@qq.com','不错','/images/avatar.png','2022-04-14 01:06:33',15,29,_binary '\0');
/*!40000 ALTER TABLE `t_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_friend`
--

DROP TABLE IF EXISTS `t_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `blogaddress` varchar(255) NOT NULL,
  `blogname` varchar(255) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `pictureaddress` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_friend`
--

LOCK TABLES `t_friend` WRITE;
/*!40000 ALTER TABLE `t_friend` DISABLE KEYS */;
INSERT INTO `t_friend` VALUES (2,'http://www.ruanyifeng.com/blog/','阮一峰的网络日志','2022-04-13 08:55:26','http://www.ruanyifeng.com/blog/images/person2.jpg'),(3,'https://coolshell.cn/','酷壳-CoolShell','2022-04-13 09:01:48','https://coolshell.cn/wp-content/uploads/2020/03/coolshell.mini_.jpg'),(4,'http://mindhacks.cn/topics/programming/','Mind Hacks','2022-04-13 09:05:38','http://mindhacks.cn/wp-content/uploads/2016/12/card1.png');
/*!40000 ALTER TABLE `t_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_message`
--

DROP TABLE IF EXISTS `t_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_message` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `nickname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `content` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `parent_message_id` bigint(20) DEFAULT NULL,
  `admin_message` bit(1) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_message`
--

LOCK TABLES `t_message` WRITE;
/*!40000 ALTER TABLE `t_message` DISABLE KEYS */;
INSERT INTO `t_message` VALUES (100,'hchhtc123','1075558916@qq.com','畅所欲言','/images/avatar.png','2022-04-13 03:18:51',-1,_binary '\0'),(103,'木华','1075558916@qq.com','哈哈哈','https://6863-hchhtc123-8glmp9fre558cb50-1304974356.tcb.qcloud.la/author.png?sign=807a2e80c6ae9499cf27eebb09f218ca&t=1649484926','2022-04-14 03:48:41',-1,_binary ''),(104,'hch','1075558916@qq.com','很赞','/images/avatar.png','2022-04-14 13:46:14',-1,_binary '\0');
/*!40000 ALTER TABLE `t_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_picture`
--

DROP TABLE IF EXISTS `t_picture`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_picture` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pictureaddress` varchar(255) DEFAULT NULL,
  `picturedescription` varchar(255) DEFAULT NULL,
  `picturename` varchar(255) DEFAULT NULL,
  `picturetime` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_picture`
--

LOCK TABLES `t_picture` WRITE;
/*!40000 ALTER TABLE `t_picture` DISABLE KEYS */;
INSERT INTO `t_picture` VALUES (1,'https://6863-hchhtc123-8glmp9fre558cb50-1304974356.tcb.qcloud.la/%E5%85%A5%E8%AF%BB%E5%8D%8E%E5%B8%88.jpg?sign=f9a51a1cad14b888eeb4aec205b21a5f&t=1649855914','入读华南师范大学软件工程专业','华师我来了','2021/09/01');
/*!40000 ALTER TABLE `t_picture` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_type`
--

DROP TABLE IF EXISTS `t_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_type` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_type`
--

LOCK TABLES `t_type` WRITE;
/*!40000 ALTER TABLE `t_type` DISABLE KEYS */;
INSERT INTO `t_type` VALUES (1,'Java'),(2,'数据结构与算法'),(3,'Linux'),(4,'数据库'),(58,'项目'),(59,'计算机网络'),(60,'操作系统'),(62,'深度学习'),(63,'系统设计'),(64,'生活趣事'),(65,'面经');
/*!40000 ALTER TABLE `t_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `t_user`
--

DROP TABLE IF EXISTS `t_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `t_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `avatar` varchar(255) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `t_user`
--

LOCK TABLES `t_user` WRITE;
/*!40000 ALTER TABLE `t_user` DISABLE KEYS */;
INSERT INTO `t_user` VALUES (1,'https://6863-hchhtc123-8glmp9fre558cb50-1304974356.tcb.qcloud.la/author.png?sign=faeb4dc908b3057e8d5c6b954798aac8&t=1650107584','2022-03-01 15:07:15','1075558916@qq.com','木华','e10adc3949ba59abbe56e057f20f883e',1,'2022-03-01 15:08:15','admin');
/*!40000 ALTER TABLE `t_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'myblog'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-16 19:14:57
