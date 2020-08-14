-- 
-- 选择数据库
--
use mysql;

--
-- 创建数据库
--
create database office;

--
-- 新建用户
--
CREATE USER 'office'@'%' IDENTIFIED BY 'office';

--
-- 赋予权限
--
GRANT All privileges ON *.* TO 'office'@'%';

--
-- 修改认证
--
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'office'@'%' IDENTIFIED WITH mysql_native_password BY 'office';
