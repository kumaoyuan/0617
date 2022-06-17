<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>


<head><title>訂單計數器init</title></head>
<body>
<%
     application.setAttribute("order_number", "1");
     out.print("訂單編號初始值設定為1");
%>
</body>





