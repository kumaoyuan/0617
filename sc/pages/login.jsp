<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>login</title>

    <link href="../assets/css/login.css" rel="stylesheet">
</head>

<body>
    <div class="login">
        <form method="post" action="logincheck.jsp" class="form">
            <div class="login_title">
                會員登入
            </div>

            <div class="login_box">
                <label for="account_title"> 帳號 </label>
                <input type="text" name="id" id="Account" placeholder="  請輸入您的帳號">
            </div>
            <div class="login_box">
                <label for="password_title"> 密碼 </label>
                <input type="Password" name="pwd" id="Password" placeholder="  請輸入您的密碼">
            </div>
            <div class="login_btn">
                <button class="btn" type="sumit" value="登入">登入</button>
                <button class="btn"><a href="signup.jsp">註冊</a></button>
            </div>
        </form>
        
    </div>
    
</body>
</html>