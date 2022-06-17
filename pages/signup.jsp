<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>signup</title>

    <link href="../assets/css/signup.css" rel="stylesheet">
</head>

<body>
    <div class="signup">
        <form method="post" action ="signupcheck.jsp" class="form">
            <div class="signup_title">
                會員註冊
            </div>
			
			<div class="signup_box">
                <label for="account_title"> 帳號 &nbsp;&nbsp;  </label>
                <input type="text" name="id" id="Account" placeholder="  請輸入您的帳號(gmail)" required>
            </div>
            <div class="signup_box">
                <label for="password_title"> 密碼 &nbsp;&nbsp;  </label>
                <input type="text" name="pwd" id="Password" placeholder="  請輸入您的密碼" required>
            </div>
            <div class="signup_box">
                <label for="name_title">  姓名 &nbsp;&nbsp;  </label>
                <input type="text" name="username" id="Name" placeholder="  請輸入您的姓名" required>
            </div>
			<div class="signup_box">
                <label for="password_title"> 電話 &nbsp;&nbsp;  </label>
                <input type="text" name="tel" id="Password" placeholder="  請輸入您的連絡電話" required>
            </div>
			<div class="signup_box">
                <label for="password_title"> 地址 &nbsp;&nbsp;  </label>
                <input type="text" name="addr" id="Password" placeholder="  請輸入您的地址" required>
            </div>
            <div class="signup_box">
                <label for="mail_title"> 信箱 &nbsp;&nbsp;  </label>
                <input type="text" name="email" id="Mail" placeholder="  請輸入您的gmail" required>
            </div>
			<div class="signup_box">
                <label for="password_title"> 生日 &nbsp;&nbsp;  </label>
                <input type="text" name="birth" id="Password" placeholder="  請輸入您的生日(如2022/06/10)" required>
            </div>
            <div class="signup_btn">
                
                <button class="btn">註冊</button>
            </div>
        </form>
        
    </div>
    
</body>
</html>