<%@page import = "java.sql.*"%>
<%@page language="java" contentType="text/html"  pageEncoding="UTF-8"%>	

<html>
<head>
<title>deleteproduct</title>
</head>
<body>
<%
            Class.forName("com.mysql.jdbc.Driver");
            String url="jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
            Connection con=DriverManager.getConnection(url,"root","1234");
			String sql="use `shoppingcar`";
			con.createStatement().execute(sql);
			String name=request.getParameter("ProductName");
			String sql1="DELETE FROM `coffee` WHERE `product_name`='"+name+"'";
		    con.createStatement().execute(sql1);
			out.print("<script>alert('刪除成功');location.href='back.jsp'</script>");
            con.close();
		   
%>
</body>
</html>