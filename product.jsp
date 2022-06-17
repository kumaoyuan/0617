<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>product</title><!--單一頁面-->

    <link href="../assets/css/product.css" rel="stylesheet">

    
</head>

<body>
    <div class="boxback">
			
            
<%
			String productid=request.getParameter("product_id");
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
					sql="select * from `coffee`"; // SQL 語法：取得 counter 資料表中的所有資料
					sql+="where `product_id`='"+productid+"'";
					ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
			   while(rs.next())
			   {
				   out.print("<form method='post' action='addproduct.jsp'  class='box'>");
				   out.print("<div class='box_left'>");
				   out.print("<div class='product_pic'>");
				   out.print("<img src='"+rs.getString(5)+"'>");//產品圖片
				   out.print("</div>");
				   out.print("</div>");
				   out.print("<div class='box_right'>");
				   out.print("<div class='product_title'>");
				   out.print(rs.getString(2));//產品名稱
				   out.print("</div>");
				   out.print("<div class='product_text'>");
				   out.print("風味:"+rs.getString(4)+"<br>");
				   out.print("調性:"+rs.getString(3)+"調性<br>");
				   out.print("價格:"+rs.getString(7));
				   out.print("庫存:"+rs.getString(8));
				   out.print("</div>");
				   out.print("<br>");
				   out.print("<div class='product_btn_text'>");
				   out.print("請選擇購買數量後加入購物車");
				   out.print("</div>");
				   out.print("<div class='product_btn'>");
				   out.print("<input type='button' class='num-button' value='-' onclick='minusNUM()'>");;
				   out.print("<input type='text' class='number' id='num' value='1' name='product_number'>");
				   out.print("<input type='button' class='num-button' value='+' onclick='addNUM()'>");
				   out.print("<input type='hidden' name='product_id' value='"+rs.getString(1)+"'>");
				   out.print("</div>");
				   out.print("<br>");
				   out.print("<div class='product_cart_btn'>");
				   out.print("<input type='submit' class='btn' value='加入購物車'>");
				   out.print("<button class='btn'><a href='introduce.jsp'>回去購物</a></button>");
				   out.print("</div>");
				   out.print("<div class='comment'>");
				   out.print("<div class='commenttitle'>");
				   out.print("<h5>歷史評價</h5>");
				   out.print("</div>");
				   out.print("<div class='commentp'>");
				   String sql1="select * from `message`";
				   sql1+="where `product_id`='"+productid+"'";
				   sql1+="order by `msg_id` desc";
				   ResultSet rs1=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql1);
				   while(rs1.next()){
					   out.print(rs1.getString(3)+":"+rs1.getString(4)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp星星評價:&nbsp&nbsp"+rs1.getString(5)+"&nbsp&nbsp顆<br>");
				   }
				   
				   out.print("</div>");
				   out.print("</div>");
				   out.print("</div>");

				   out.print("</form>");
				}
				}
				con.close();
			}
			catch (SQLException sExec) {
				out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
		}
		
		out.print("</form>");
		out.print("<form action='product_view_add.jsp' method='post'class='basic-grey'>");
		out.print("<input type='hidden' name='product_id' value='"+productid+"'>");                   

%>
            <h1>商品留言</h1>
            <label>
                <div class="grey_text">Your Name:</div>
                <input id="name" type="text" name="name" placeholder="Your Full Name"/>
            </label>
            <label>
                <div class="grey_text">Your Email:</div>
                <input id="email" type="email" name="email" placeholder="Your Email Address"/>
            </label>
            <label>
                <div class="grey_text">Message:</div>
                <textarea id="message" name="message" placeholder="You Message To Us"/>
            </textarea>
            </label>
            <label>

                <span>&nbsp;</span>
                <input type="submit" class="button" value="Send"/>
            </label>
            
            <div class="STAR">
                        <input type="radio" name="star" id="star1" value="5">
                        <label for="star1"></label>
                            <input type="radio" name="star" id="star2" value="4">
                            <label for="star2"></label>
                            <input type="radio" name="star" id="star3" value="3">
                            <label for="star3"></label>
                            <input type="radio" name="star" id="star4" value="2">
                            <label for="star4"></label>
                            <input type="radio" name="star" id="star5" value="1">
                            <label for="star5"></label>
                        </div>                       
        
			</div>
		</form>
	</div>
    
    <script>
            function minusNUM(){
              let value=Number(document.getElementById('num').value);
              if(value!=1){
                document.getElementById('num').value=value-1;
              }
            }
            function addNUM(){
              let value=Number(document.getElementById('num').value);
                document.getElementById('num').value=value+1;
      
            }
        </script>
    </script>

    
    
</body>
</html>