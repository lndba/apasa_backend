# Apasa CMDB后端部署
说明：V1.0版本由于种种限制，只能提供手动录入的功能，自动录入功能将在V2.0中更新。

## Apasa CMDB前后端组件说明
* 开发语言：Python 3.6
* 前端框架：Vue + iview
* 后端框架：Django + RestFramework + MySQL

## 后端代码部署
### 安装python3.6
略
### pip3安装包文件
```
pip3 install --upgrade pip
pip3 install django==1.11.20
pip3 install pymysql
pip3 install djangorestframework
pip3 install uwsgi
# uwsgi软连接
[root@localhost ~]# ln -s /usr/local/python3/bin/uwsgi /usr/local/bin/uwsgi
```

### 代码部署
#### 导入数据库
```
[root@localhost ~]# mkdir /data
# 下载代码步骤略过
[root@localhost ~]# cd /data/apasa_backend/
[root@localhost apasa_backend]# mysql -uroot -p < cmdb.sql
```
#### 编辑settings.py文件，修改数据库连接信息
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cmdb',
        'USER': 'root',
        "PASSWORD": '123456',
        'HOST': '127.0.0.1',
        'PORT': 3306,
    }
}
```

#### 前台启动uwsgi，检查没有报错，转到后台启动uwsgi
```
[root@localhost ~]# uwsgi --ini /data/apasa_backend/apasa_uwsgi_18000.ini
```
#### 后台启动uwsgi方式
```
[root@localhost ~]# uwsgi --ini /data/apasa_backend/apasa_uwsgi_18000.ini &>/dev/null &
```
#### 查看uwsgi是否启动
```
[root@localhost ~]# ps -ef|grep uwsgi|grep -v grep
root       1005    971  0 20:40 pts/1    00:00:00 uwsgi --ini /data/apasa_backend/apasa_uwsgi_18000.ini
root       1006   1005  0 20:40 pts/1    00:00:00 uwsgi --ini /data/apasa_backend/apasa_uwsgi_18000.ini
root       1008   1005  0 20:40 pts/1    00:00:00 uwsgi --ini /data/apasa_backend/apasa_uwsgi_18000.ini
```


