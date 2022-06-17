<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<%@include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>member</title>

    <link href="../assets/css/member.css" rel="stylesheet">
</head>
<body>
    <div class="member">
	<%
if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
{
	sql="SELECT * FROM `customers` WHERE `id`='"+session.getAttribute("id")+"';";
	PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
	ResultSet rs=pstmt.executeQuery();
	String id="",pwd="",username="",tel="",addr="",birth="",email="";
	while(rs.next())
	{
		id=rs.getString("id");
		pwd=rs.getString("pwd");
		username=rs.getString("username");
		tel=rs.getString("tel");
		addr=rs.getString("addr");
		birth=rs.getString("birth");
		email=rs.getString("email");	
	}
%>
        <form method="post" action="update.jsp" class="form">
            <div class="member_title">
                會員中心
            </div>

            <div class="member_box">
                <label for="name_title">  姓名 &nbsp;&nbsp;  </label><br>
                <input type="text" id="Name" name="username" value="<%=username%>">
            </div>

            <div class="member_box">
                <label for="mail_title"> 信箱 &nbsp;&nbsp;  </label><br>
                <input type="text" id="Mail" name="email" value="<%=email%>">
            </div>

            <div class="member_box">
                <label for="account_title"> 帳號 &nbsp;&nbsp;  </label><br>
                <input type="text" id="Account" name="id" value="<%=id%>">
            </div>

            <div class="member_box">
                <label for="password_title"> 密碼 &nbsp;&nbsp;  </label><br>
                <input type="text" id="Password" name="pwd" value="<%=pwd%>">
            </div>

            <div class="member_box">
                <label for="password_title"> 確認密碼 &nbsp;&nbsp;  </label><br>
                <input type="text" id="Password" name="pwd" value="<%=pwd%>">
            </div>

            <div class="member_box">
                <label for="password_title"> 連絡電話(手機) &nbsp;&nbsp;  </label><br>
                <input type="text" id="phone" name="tel" maxlength="10" value="<%=tel%>">
            </div>    

            <div class="member_box">
                <label for="password_title"> 地址 &nbsp;&nbsp;  </label><br>
                <input type="text" id="tel" name="addr" maxlength="15" value="<%=addr%>">
            </div>

            <div class="member_box">
                <label for="birthday_title"> 生日 &nbsp;&nbsp;  </label><br>
                <input type="text" id="birth"  name="birth" value="<%=birth%>">
			</div>

            <div class="member_btn">
                
                <button class="btn">提交</button>
                <button class="btn"><a href="detail.jsp">會員紀錄</a></button>
                
            </div>
        </form>
        <%}
		else
		{
			con.close();
			out.println("<script language='javascript'>alert('您尚未登入，請登入!');window.location.href='login.jsp';</script>");
		}
		%>
    </div>
 
</body>
</html>