<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<%@ page import = "java.io.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8" import = "java.sql.*"%>
<%@include file="config.jsp" %>

<!--更新購物車資料-->
<%
	Enumeration paramNames=request.getParameterNames();//從表單拿到所有變數
	int a=0;
	String product_number="";
	String product_id="";
	while(paramNames.hasMoreElements()){
		if(a%2==0){
		//讀取商品編號	
		String paramName=(String)paramNames.nextElement();
			   product_id=request.getParameter(paramName);
		}
		else
		{
			//讀取商品數量
			String paramName=(String)paramNames.nextElement();
				   product_number=request.getParameter(paramName);
			sql="update `cart` set `product_number`='"+product_number+"' where `id`='"+session.getAttribute("id")+"' and `product_id`='"+product_id+"'";
			con.createStatement().executeUpdate(sql);//以儲存好的變數進行資料更新
		}
		
		a++;
	}
	
	con.close();
	response.sendRedirect("ordercheckout.jsp");
	
%>