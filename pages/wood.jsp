<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>私房咖啡豆-木質調性</title>

    <link href="../assets/css/wood.css" rel="stylesheet">

  </head>

  <body>

    <header>
      
        <nav>
          <ul class="drop-down-menu">
            <li><a href="index.jsp" class="meau_choice">好咖在 good coffee</a>
            </li>
            </li>
            <li><a href="team2.jsp" class="meau_choice">團隊介紹</a>
            </li>
            <li><a href="introduce.jsp" class="meau_choice">商品介紹</a>
            </li>
            <li><a href="#" class="meau_choice">商品選購</a>
            
            <ul>
            <li><a href="boutique.jsp" class="meau_choice">精品咖啡豆</a>
            </li>
            <li><a href="" class="drop_choice">私房咖啡豆</a>
              <ul>
                <li><a href="fruit.jsp" >水果調性</a></li>
                <li><a href="wood.jsp" >木質調性</a></li>
                <li><a href="flower.jsp" >花香調性</a></li>
              </ul>
            </li></ul></li>
            <li><a href="question2.jsp" class="meau_choice">聯絡我們</a>
            </li>
            <li>
              <div class="box">
                <div class="container-1">
				<form action="search.jsp" method="get">
                  <span class="icon"><img src="../assets/img/search.png"></span>
                  <input type="search" id="search" placeholder="Search..." name="search"/>
				</form>
                </div>
              </div>
            </li>
			<%
             
	         if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
			 {
		    %>
				<li><a href="logout.jsp" class="meau_choice">登出</a></li>
		    <% 
			 }			
			 else
			 {
		    %>
				<li><a href="login.jsp" class="meau_choice">登入 | 註冊</a></li> 
			<%
	         }
			 
            %>
            <li><a href="member.jsp"><img src="../assets/img/member.png" id="member"></a></li>
            <li><a href="cart.jsp"><img src="../assets/img/cart.png" id="cart" ></a></li>
          </ul>
        </nav>
    
    </header>
    <main> 

        <section class="boutique">
            
            <div class="boutique_box">
                <div class="one">

                    <ul class="coffee_choose_menu">
                        <li><a href="boutique.jsp">精品咖啡豆</a>
                        </li>
                       
                        <li><a href="wood.jsp"><h3>私房咖啡豆-木質調性</h3></a>
                        </li>
                        <li><a href="fruit.jsp">私房咖啡豆-水果調性</h3></a>
                        </li>
                        <li><a href="flower.jsp">私房咖啡豆-花香調性</a>
                        </li>
                    </ul>
                   
                </div>
                <div class="two">

                
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
					sql="select * from `coffee` where `product_id` like 'A%' && `product_aroma` like '木質%'"; // SQL 語法：取得 counter 資料表中的所有資料
					ResultSet rs=con.createStatement().executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
			   while(rs.next())
			   {
				   out.print("<div class='two_box'>");
				   out.print("<div class='two_pic'>");
				   out.print("<img src='"+rs.getString(5)+"'>");//產品圖片
				   out.print("</div>");
				   out.print("<div class='two_title'>");
				   out.print(rs.getString(2));//產品名稱
				   out.print("</div>");
				   out.print("<div class='two_text'>");
				   out.print(rs.getString(6));//產品內容
				   out.print("</div>");
				   out.print("<br>");
				   out.print("<div class='text'>");
				   out.print("風味:"+rs.getString(4)+"<br>");
				   out.print("調味:"+rs.getString(3)+"調性<br>");
				   out.print("價格:"+rs.getString(7));
				   out.print("</div>");
				   out.print("<div class='connect_btn'>");
				   out.print("<button class='btn'> <a href='product.jsp?product_id="+rs.getString(1)+"'>"+"前往商品頁→</a></button>");
				   out.print("</div>");
				   out.print("</div>");
				}
				con.close();
			}}
			catch (SQLException sExec) {
				out.println("警告：MySQL 錯誤！"+sExec.toString()); // MySQL 錯誤警告
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("警告：class 錯誤！"+err.toString()); // JDBC 錯誤警告
		}
	
%>

                    


                </div>

            </div>
        </section>

    </main>

    

    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%@include file="counter.jsp"%>人</h5>
    </footer>
  </body>
</html>