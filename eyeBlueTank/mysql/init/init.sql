-- 
-- 选择数据库
--
use mysql;

--
-- 创建数据库
--
create database tank;

--
-- 新建用户
--
CREATE USER 'tank'@'%' IDENTIFIED BY 'tank';

--
-- 赋予权限
--
GRANT All privileges ON *.* TO 'tank'@'%';

--
-- 修改认证
--
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'tank'@'%' IDENTIFIED WITH mysql_native_password BY 'tank';