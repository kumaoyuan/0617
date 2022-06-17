<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<html>
	<head>
		<title>確認產品修改</title>
	</head>
	
	<body>
<%          
            String name=request.getParameter("name");
            String aroma=request.getParameter("aroma");
            String flavor=request.getParameter("flavor");
            String img=request.getParameter("img");
            String note=request.getParameter("note");
            String price=request.getParameter("price");
            String ipound=request.getParameter("ipound");

		   if(name=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！產品名稱不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }
		   if(aroma=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！產品調性不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }
		   if(flavor=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！產品風味不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }
		   if(img=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！圖片路徑不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }
		   if(note=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！產品內容不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }
		   if(price=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！產品價格不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }

		   if(ipound=="")
		   {
			   out.print("<script>alert(decodeURIComponent('修改失敗！產品庫存不能為空!請重新輸入'));location.href='back_product_alter.jsp'</script>");
			   return;
		   }
	
	
			try { // 例外處理
				Class.forName("com.mysql.jdbc.Driver"); // 啟動 JDBC 驅動程式
				try {	// 例外處理
					String url="jdbc:mysql://localhost/?useUnicode=true&characterEncoding=utf-8&serverTimezone=UTC"; // url 是連接 MySQL 的位址（IP 或網域）
					String sql=""; // 建立字串變數 sql
					Connection con=DriverManager.getConnection(url,"root","1234"); // 連接 MySQL 資料庫（帳號：root；密碼：1234）
					if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
					   out.println("警告：連線建立失敗！"); // 連線關閉代表連線沒有被建立
					else { // 連線成功建立就可以開始取得與更新資料庫的資料
						sql="use `shoppingcar`"; // SQL 語法：使用 cych 資料庫
						con.createStatement().executeUpdate(sql); // 執行上一行的 SQL
						int rs=con.createStatement().executeUpdate(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果	
						
						String sql1 = "UPDATE `coffee` SET `product_name`='"+name+"' WHERE`product_name`='"+name+"'"; 
						con.createStatement().executeUpdate(sql1);
						   
						String sql2 = "UPDATE `coffee` SET `product_aroma`='"+aroma+"' WHERE`product_name`='"+name+"'";
						con.createStatement().executeUpdate(sql2);
						   
						String sql3 = "UPDATE `coffee` SET `product_flavor`='"+flavor+"' WHERE`product_name`='"+name+"'";
						con.createStatement().executeUpdate(sql3);
						   
						String sql4 = "UPDATE `coffee` SET `img`='"+img+"' WHERE`product_name`='"+name+"'";
						con.createStatement().executeUpdate(sql4);
							
						String sql5 = "UPDATE `coffee` SET `product_note`='"+note+"' WHERE`product_name`='"+name+"'"; 
						con.createStatement().executeUpdate(sql5);
						   
						String sql6 = "UPDATE `coffee` SET `product_price`='"+price+"' WHERE`product_name`='"+name+"'";
						con.createStatement().executeUpdate(sql6);
						   
						String sql7 = "UPDATE `coffee` SET `ipound`='"+ipound+"' WHERE`product_name`='"+name+"'";
						con.createStatement().executeUpdate(sql7);
													
						out.print("<script>alert('修改成功!');location.href='back_product_alter.jsp'</script>");
							
						
					con.close();						
					}
					}	
				
				catch (SQLException sExec) {
					out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
					}
				}
				catch (ClassNotFoundException err) {
					out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
					}

%>

	</body>
</html>