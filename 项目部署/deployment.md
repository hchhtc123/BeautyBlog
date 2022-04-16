
# 项目部署说明

## 1.修改配置文件

1.进入BeautyBlog\src\main\resources分别修改application.yml和application-pro.yml配置文件

application.yml修改：由active: dev改为active: pro

application-pro.yml修改：修改datasource中username和password为服务器上要创建的myblog数据库的连接账号和密码

2.先运行maven clean然后ecplise下运行maven install，idea则在在maven选项中点击package

打包完成后在target目录下找到jar后缀文件即为项目打包文件

## 2.服务器部署

1.服务器上安装宝塔便于操作管理，下载地址：https://www.bt.cn/new/download.html

2.在宝塔面板内新建数据库myblog，注意配置正确的账号和密码！

3.在服务器管理界面开放90端口

4.在/www/wwwroot/目录下新建文件夹BeautyBlog上传打包好的jar包

5.后台运行jar包部署：

cd /www/wwwroot/BeautyBlog

nohup java -jar BeautyBlog-0.0.1-SNAPSHOT.jar &

运行完成后访问服务器公网ip:90测试是否正常，异常的话可以查看日志文件debug

6.配置域名访问

申请域名，解析到服务器公网ip。此时访问服务器域名:90查看是否访问正常

修改项目部署文件夹下提供的BeautyBlog.conf文件，修改完成后上传到/etc/nginx/conf.d/目录下

打开nginx的配置文件，在"http{"中添加include /etc/nginx/conf.d/*.conf

修改完成后重载nginx服务

此时直接访问服务器域名即可访问项目，无需再添加端口号！
