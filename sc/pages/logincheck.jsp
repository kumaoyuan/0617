<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<%@page contentType="text/html;charset=UTF-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<title>登入檢查</title>
<%

  //帳號密碼正確登入,進入會員資料頁面
if(request.getParameter("id") !=null && request.getParameter("pwd") != null){
      
	  String id=request.getParameter("id");
	  String pwd=request.getParameter("pwd");
    
    //sql = "SELECT * FROM customers WHERE id='" +request.getParameter("id") + 
	//      "'  AND pwd='" + request.getParameter("pwd") + "'"  ; 
    sql = "SELECT * FROM `customers` WHERE `id`=? AND `pwd`=?";
	//' OR 1=1; #
	//out.println(sql);
	//out.close();//程式結束
    PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("id"));
    pstmt.setString(2,request.getParameter("pwd"));
	
	ResultSet paperrs = pstmt.executeQuery();
	//ResultSet paperrs =con.createStatement().executeQuery(sql);
	
	//管理員帳號密碼
    if(paperrs.next()){    
		if(id.equals("1102sc")&&pwd.equals("1102"))
		{
			response.sendRedirect("back.jsp") ;
		}
		else{
        session.setAttribute("id",request.getParameter("id"));
        response.sendRedirect("member.jsp") ;
		}
		
	}
	
    else
        out.print("<script>alert('帳號密碼錯誤');location.href='login.jsp'</script>");
}

 
%>