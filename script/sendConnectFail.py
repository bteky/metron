#!/usr/bin/python3

import time
import pymysql
import smtplib
from email.mime.text import MIMEText

def send_email(receiver,regTime):
    # 接收方／发送方，接收方是一个list，可以接受多个数值
    sender = 'hi@nxkys.com'

    contant = """<div dir="ltr">
        ﻿亲亲，灵溪网络提供免费试用服务 !</font>
		<br><br>
		您账号的注册时间是：<font color="darkred">%s</font>
		<br><br>
		<font color="red">支持苹果，安卓， 电脑等客户端</font>
		<br><br>
		连接问题请 <a href="https://nxkys.com" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://nxkys.com&amp;source=gmail&amp;ust=1638599219093000&amp;usg=AOvVaw1_o00JKGkAtJHfAIdy040a">登录官网</a>
		<br> <br>
		有疑问，请联系网站右下角在线客服 <br> <br>
		官方网址： <a href="https://nxkys.com" target="_blank" data-saferedirecturl="https://www.google.com/url?q=https://nxkys.com&amp;source=gmail&amp;ust=1638599219094000&amp;usg=AOvVaw2ZcvjoZ_OBnw_4TE1vJZHf">https://nxkys.com</a><div class="yj6qo"></div><div class="adL"> <br> <br>
        </div></div>"""%(str(regTime))

    # 拼接邮件内容
    message = MIMEText(contant, "html", "utf-8")
    message['Subject'] = "灵溪加速器 - 连接失败，请联系网站右下角在线客服!"
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
    sql = """SELECT email, reg_date
FROM `user`
where t = 0
and reg_date > DATE_ADD(date(now()),INTERVAL -1 DAY)
and reg_date < date(now())"""

    try:
       # 执行SQL语句
       cursor.execute(sql)
       # 获取所有记录列表
       results = cursor.fetchall()
       for row in results:
          email = row[0]
          regTime = row[1]
          send_email(email, regTime)
          time.sleep(3 * 60)
    except:
       print ("send connect fail mail fail : unable to fetch data")

    # 关闭数据库连接
    db.close()
