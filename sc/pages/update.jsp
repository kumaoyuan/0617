<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<title>更新會員資料</title>

<%
	String username=request.getParameter("username");
	String pwd=request.getParameter("pwd");
	String tel=request.getParameter("tel");
	String birth=request.getParameter("birth");
	String email=request.getParameter("email");
	String addr=request.getParameter("addr");
	

if(session.getAttribute("id") != null ){
    if(request.getParameter("username")!=null){
    
	
	sql = "UPDATE `customers` SET `username`='"+request.getParameter("username")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
    sql = "UPDATE `customers` SET `tel`='"+request.getParameter("tel")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `customers` SET `birth`='"+request.getParameter("birth")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
    sql = "UPDATE `customers` SET `email`='"+request.getParameter("email")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `customers` SET `addr`='"+request.getParameter("addr")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	sql = "UPDATE `customers` SET `pwd`='"+request.getParameter("pwd")+"' WHERE `id`='"+session.getAttribute("id")+"'";
	con.createStatement().executeUpdate(sql);
	
	

   
	
    
	
	int no=con.createStatement().executeUpdate(sql);
	if(no>0){
		out.println("<script language='javascript'>alert('更新成功!');window.location.href='member.jsp';</script>");	

	//out.close();
	}
	else{
		//con.close();
	out.print("更新失敗!! 請填寫完整，<a href='member.jsp'>按此</a>回會員頁面!!");
	}

}
}
else{
%>
<h1><font color="red">您尚未登入，請登入！</font></h1>
<form action="logincheck.jsp" method="POST">
帳號：<input type="text" name="id" /><br />
密碼：<input type="password" name="pwd" /><br />
<input type="submit" name="b1" value="登入" />
</form>

<%
}
%>