<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>產品修改2</title>

    <link href="../assets/css/ordersearch.css" rel="stylesheet">

  </head>

  <body>

    <header>
      
        <nav>
          <ul class="drop-down-menu">
            <li><a href="back.jsp" class="meau_choice">後臺管理系統</a></li>
            <li><a href="question_view2.jsp" class="meau_choice">意見回饋紀錄</a></li>			
            <li><a href="ordersearch.jsp" class="meau_choice">訂單</a></li>
            <li><a href="back_product_alter.jsp" class="meau_choice">產品修改</a></li>
            <li><a href="back_product_insert.jsp" class="meau_choice">產品新增</a></li>
            <li><a href="back_product_delete.jsp" class="meau_choice">產品刪除</a></li>
            <li><a href="index.jsp">登出</a></li>
          </ul>
        </nav>
    
    </header>

    <section class="we">
      <div class="we_title">
        產品修改
      </div>
        <form action="back_product_alter2-2.jsp">
<%
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
					con.createStatement().execute(sql); // 執行上一行的 SQL
					String name=request.getParameter("ProductName");
					sql="select `product_aroma`,`product_flavor`,`img`,`product_note`,`product_price`,`ipound` from `coffee`WHERE `product_Name`='"+name+"'"; // SQL 語法：取得 counter 資料表中的所有資料
					ResultSet rs=con.createStatement().executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					if(rs.next())
					{
%>	

          產品名稱:<input type="text" id="orderid" name="name" value="<%=name%>">
          <br>
          <br>
		  產品調性:<input type="text" id="orderid" name="aroma" value="<%=rs.getString(1)%>">
          <br>
          <br>
		  產品風味:<input type="text" id="orderid" name="flavor" value="<%=rs.getString(2)%>">
          <br>
          <br>
          圖片路徑:<input type="text" id="orderid" name="img" value="<%=rs.getString(3)%>">
          <br>
          <br>
          產品描述:<input type="text" id="orderid" name="note" value="<%=rs.getString(4)%>">
          <br>
          <br>
          產品價格:<input type="text" id="orderid" name="price" value="<%=rs.getString(5)%>">
          <br>
          <br>
          產品庫存:<input type="text" id="orderid" name="ipound" value="<%=rs.getString(6)%>">
          <br>
          <br>
<%				
				con.close();
					}
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

          <div class="btn_class">
            <input type="reset"  class="btn" value="重設">
            <input type="submit" class="btn" value="修改">
          </div>
          
        </form>
      
    </section>


  </body>
</html>