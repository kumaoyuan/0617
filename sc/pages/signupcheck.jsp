<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<title>註冊檢查</title>

<%
	//接收前端資料
	
     String account=request.getParameter("id");
     String password=request.getParameter("pwd");
     String name=request.getParameter("username");
     String phone=request.getParameter("tel");
	 String address=request.getParameter("addr");
	 String email=request.getParameter("email");
     String birthday=request.getParameter("birth");
     
    
	
	//查詢使用者名稱是否存在
	 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM customers WHERE id = '" + account + "'");
     ResultSet rs =pstmt.executeQuery();
	
					
	 //如果存在執行以下程式碼
     if(rs.next()){
		out.println("<script language='javascript'>alert('該用戶已存在,請重新註冊!');window.location.href='signup.jsp';</script>");	 
     }
	 
	 //如果不存在,把資料插入到表格中
	 else{
		 PreparedStatement tmt =con.prepareStatement("INSERT into customers VALUES('"+account+"','"+password+"','"+name+"','"+phone+"','"+address+"','"+email+"','"+birthday+"')");//向資料庫存入資料
		 //out.print(sql);
		 //out.close();
         int rst = tmt.executeUpdate();
         if (rst != 0)
         {
         out.println("<script language='javascript'>alert('使用者註冊成功!');window.location.href='login.jsp';</script>");
		 response.setHeader("refresh","5;url=login.jsp");//跳轉介面
         }  
         else
         {
         out.println("註冊失敗");
         }
		 
	 
		 
		 
		 
		 
		 
		 
	 }




%>