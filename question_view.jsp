<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<html>
<head>
<title>question_view</title>
</head>
<body>
<% /* String name=request.getParameter("name");
           String email=request.getParameter("type");
		        String question=request.getParameter("question");
		   out.println(name);
		  */ %>

					   <% 
							try {
							//Step 1: 載入資料庫驅動程式 
								Class.forName("com.mysql.jdbc.Driver");
								try {
							//Step 2: 建立連線 	
									String url="jdbc:mysql://localhost:3306/?serverTimezone=UTC";
									String sql="";
									Connection con=DriverManager.getConnection(url,"root","1234");
									if(con.isClosed())
									   out.println("連線建立失敗");
									else {
							//Step 3: 選擇資料庫   
									   sql="USE `shoppingcar`";
									   con.createStatement().execute(sql);
									   request.setCharacterEncoding("UTF-8");
									   //從表格傳遞中文到資料庫, 必須使用getBytes("ISO-8859-1"),"UTF-8"編碼									   
									   String user_name=request.getParameter("name");
									   String id=request.getParameter("type");
									   String question_content=request.getParameter("question");         
									   java.sql.Date new_date=new java.sql.Date(System.currentTimeMillis());
							//Step 4: 執行 SQL 指令	
							
									   sql="INSERT  `question`(`username`, `id`,`question_content`) ";
									   sql+="VALUES ('" + user_name  + "', '" + id  + "', '" + question_content +"')";     

									   con.createStatement().execute(sql);
							//Step 6: 關閉連線
									   con.close();


							//Step 5: 顯示結果 
									  //直接顯示最新的資料
									  response.sendRedirect("question2.jsp");
								   }
								}
								catch (SQLException sExec) {
									   out.println("SQL錯誤"+sExec.toString());

								}
							}
							catch (ClassNotFoundException err) {
							   out.println("class錯誤"+err.toString());
							}

						%>
</body>
</html>