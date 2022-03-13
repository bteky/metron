# -*- coding: UTF-8 -*-

import time
import pymysql
import smtplib
from email.mime.text import MIMEText

def send_email(receiver,expireTime):
    # 接收方／发送方，接收方是一个list，可以接受多个数值
    sender = 'yzyyds@ssvipmail.xyz'

    contant = """<div dir="ltr">
        亲亲，您账号已过期，过期时间是：<font color="darkred">%s</font>
		<br><br>
		已经长时间未续费，账户已被系统自动删除<br><br>
		如有需要，请登录官方网站，<font color="red">重新注册后续费！</font><br>
		<br>
		删除原来配置，重新添加线路使用（参考网站第二步教程）<br>
		<br>
		邀请注册链接： <a href="https://www.yzyyds.xyz/auth/register?code=WVpm" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.yzyyds.xyz&amp;source=gmail&amp;ust=1638599219094000&amp;usg=AOvVaw2ZcvjoZ_OBnw_4TE1vJZHf">https://www.yzyyds.xyz/auth/register?code=WVpm</a><div class="yj6qo"></div><div class="adL"> <br> <br>
		官方网址： <a href="https://www.yzyyds.xyz" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://www.yzyyds.xyz&amp;source=gmail&amp;ust=1638599219094000&amp;usg=AOvVaw2ZcvjoZ_OBnw_4TE1vJZHf">https://www.yzyyds.xyz</a><div class="yj6qo"></div><div class="adL"> <br> <br>
        有疑问，请联系网站右下角在线客服 <br>
        <br>
        ﻿<font color="Blue" size=4>柚子加速器 - 专业海外网站加速器，稳定运行六年，海外团队运营 !</font>
		<br><br>
		<font color="Purple" size=4>畅游Google, Youtube, Facebook, Twitter, Instagram, 谷歌学术等海外网站</font
        </div></div>"""%(str(expireTime))


    # 拼接邮件内容
    message = MIMEText(contant, "html", "utf-8")
    message['Subject'] = "柚子加速器 - 账户删除通知!"
    message['From'] = sender
    message['To'] = receiver

    # 关于ssl
    server = smtplib.SMTP_SSL('smtp.zoho.com.cn', 465)
    try:
        # 登陆邮箱，发送邮件退出登陆
        server.login('yzyyds@ssvipmail.xyz', 'yz_Admin123')
        server.sendmail(sender, [receiver], message.as_string())
        server.quit()
    except smtplib.SMTPException:
        print(receiver)

if __name__ == '__main__':
    # 打开数据库连接
    db = pymysql.connect(host='localhost',
                         user='root',
                         password='yz_mysql_Admin6688',
                         database='sspanel')

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    # SQL 查询语句
    sql = """SELECT email,expire_in
            from `user`
            where expire_in < DATE_SUB(curdate(),INTERVAL 30 DAY) ;"""
    try:
       # 执行SQL语句
       cursor.execute(sql)
       # 获取所有记录列表
       results = cursor.fetchall()
       for row in results[1:]:
          email = row[0]
          expireTime = row[1]
          send_email(email, expireTime)
          time.sleep(5 * 60)
    except:
       print ("send delete count mail fail : unable to fetch data")

    # 关闭数据库连接
    db.close()
