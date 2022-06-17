<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
<title>product_view_add</title>
</head>
<body>
<%
if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
{
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="use shoppingcar";
           con.createStatement().execute(sql);
		   request.setCharacterEncoding("UTF-8");
		   String productid=request.getParameter("product_id");
		   String sql1 = "SELECT * FROM `coffee` WHERE `product_id`='" +productid+"'"; //查詢對應商品 
		   ResultSet rs=con.createStatement().executeQuery(sql1); // ResultSet 用來儲存查詢結果，將上一行 SQL 執行後並儲存結果
           String name=request.getParameter("name");
	       String email=request.getParameter("email");	   
		   String content=request.getParameter("message");
		   String star=request.getParameter("star");		   
           java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
//Step 4: 執行 SQL 指令	
           sql="INSERT `message` (`product_id`,`username`, `id`, `msg_content`,`star_number`)";
           sql+="VALUES ('" + productid + "', ";
           sql+="'"+name+"\', ";
		   sql+="'"+email+"\', ";
		   sql+="'"+content+"\', ";
           sql+="'"+star+"') ";   

           con.createStatement().execute(sql);
//Step 6: 關閉連線
           con.close();
//Step 5: 顯示結果 
          //直接顯示最新的資料
           response.sendRedirect("product.jsp?product_id="+productid);
       }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
    }
}
catch (ClassNotFoundException err) {
   out.println("class錯誤"+err.toString());
}
}
	else
	{
		//con.close();
		out.println("<script language='javascript'>alert('您尚未登入，請登入!');window.location.href='login.jsp';</script>");
	}
		
%>
</body>
</html>
