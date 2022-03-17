#!/usr/bin/python3

import time
import pymysql
import smtplib
from email.mime.text import MIMEText

def send_email(receiver,expireTime):
    # 接收方／发送方，接收方是一个list，可以接受多个数值
    sender = 'znxkys@zohomail.com'

    contant = """<div dir="ltr">
        亲亲，本站线路全部更新完毕，如果连接失败，请按照以下方法更新本地线路，才能不影响您的正常使用！！！
		<br><br>
		<font color="red">更新本地线路方法：</font><br>
		<br>
		<font color="green">电脑用户</font>：打开客户端 -> 点击配置右边第二个更新按钮 -> 启动系统代理<br>
        <font color="green">安卓用户</font>：打开App -> 配置 -> 最新配置右边三个点 -> 更新 -> 点此启动<br>
        <font color="green">苹果用户</font>：打开小火箭 -> 点击灵溪网络右边感叹号 -> 右上角完成 —> 连接<br>
        <br>
        请先断开连接，再更新订阅！<br>
		<br>
		如果连接失败：参考网站第二步教程，重新导入线路进客户端，删除本地配置文件<br>
		<br>
		有疑问，请联系网站右下角在线客服 <br>
		<br>
		官方网址： <a href="https://nxkys.com" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://nxkys.com&amp;source=gmail&amp;ust=1638599219094000&amp;usg=AOvVaw2ZcvjoZ_OBnw_4TE1vJZHf">https://nxkys.com</a><div class="yj6qo"></div><div class="adL"> <br> <br>
        <br>
        您账号已过期，过期时间是：<font color="darkred">%s</font><br>
        <br>
        ﻿<font color="Blue" size=4>灵溪加速器 - 专业海外网站加速器，稳定运行六年，海外团队运营 !</font>
		<br><br>
		<font color="Purple" size=4>畅游Google, Youtube, Facebook, Twitter, Instagram, 谷歌学术等海外网站</font
        </div></div>"""%(str(expireTime))


    # 拼接邮件内容
    message = MIMEText(contant, "html", "utf-8")
    message['Subject'] = "灵溪加速器 - 更新线路通知（重要）!"
    message['From'] = sender
    message['To'] = receiver

    # 关于ssl
    server = smtplib.SMTP_SSL('smtp.zoho.com', 465)
    try:
        # 登陆邮箱，发送邮件退出登陆
        server.login('hi@nxkys.com', 'nx_Admin6688')
        server.sendmail(sender, [receiver], message.as_string())
        server.quit()
    except smtplib.SMTPException:
        print(receiver)

if __name__ == '__main__':
    # 打开数据库连接
    db = pymysql.connect(host='localhost',
                         user='root',
                         password='nx_mysql_Admin6688',
                         database='sspanel')

    # 使用cursor()方法获取操作游标
    cursor = db.cursor()

    # SQL 查询语句
    sql = """SELECT distinct c2.email,c2.expire_in FROM `paylist` c1
            LEFT JOIN(
                select id,email,expire_in
                from `user`
            ) c2
            on c1.userid=c2.id"""
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
       print ("send update node mail fail : unable to fetch data")

    # 关闭数据库连接
    db.close()
