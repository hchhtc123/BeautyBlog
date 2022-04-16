
## 数据表：

博客数据表：t_blog

分类数据表：t_type

用户数据表：t_user

评论数据表：t_comment

留言数据表：t_message

友链数据表：t_friend

相册数据表：t_picture

## 数据表间关系：

博客和分类是多对一的关系：一个博客对应一个分类，一个分类可以对应多个博客

博客和用户是多对一的关系：一个博客对应一个用户，一个用户可以对应多个博客

博客和评论是一对多的关系：一个博客可以对应多个评论，一个评论对应一个博客

评论和回复是一对多的关系：一个评论可以对应多个回复，一个回复对应一个评论

## 数据库导入说明

### 1.导入数据库

安装DBeaver或其他支持Mysql的数据库管理软件

新建数据库，数据库名为myblog

在数据库内导入sql文件 "myblog.sql" 后执行添加该sql文件

### 2.管理端账号信息管理

项目管理端默认账号：admin

密码：123456

如需修改，请更改数据库内t_user用户信息表username和password字段

注意password使用了md5加密，密码生成工具详见：BeautyBlog\src\main\java\com\blog\util\MD5Utils.java


