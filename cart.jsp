<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--第二版-->
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>購物車</title>

    <link href="../assets/css/cart.css" rel="stylesheet">

  </head>
<%//登入控制
int a=0;
int total=0;
if(session.getAttribute("id")!=null&&!session.getAttribute("id").equals(""))
{
%>
<%
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed()) // con.isClosed() 回傳 ture 代表連線關閉
				   out.println("警告：連線建立失敗！");
				else { // 連線成功建立就可以開始取得與更新資料庫的資料
					String sql="use `shoppingcar`";
					con.createStatement().execute(sql);
					String userid=(String)session.getAttribute("id");
					String sql1 = "SELECT * FROM `cart` WHERE `id`='" +userid+"'"; //查詢對應使用者 
					ResultSet rs=con.createStatement().executeQuery(sql1); // ResultSet 用來儲存查詢結果，將上一行 SQL 執行後並儲存結果
%>
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
        <section>
			
            <div class="cart">
              <div class="carttitle">
                <h1>購物車</h1>
              </div>
              <form action="cart_update.jsp" method="post">
              
<%
				while(rs.next())
				{
					
					String productid=rs.getString(2);
					String sql_coffee="select * from `coffee` where `product_id` ='"+productid+"'";
					ResultSet rs_coffee=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql_coffee);
					
					while(rs_coffee.next())
					{
						
						out.print("<div class='cartproduct'>");
						out.print("<div class='cartproduct_left'>");
						out.print("<div class='cartproductImg'>");
						out.print("<img src='"+rs_coffee.getString(5)+"'>");//產品圖片
						out.print("</div>");
						out.print("</div>");
						out.print("<div class='cartproduct_right'>");
						out.print("<div class='cartproductDetail'>");
						out.print("<h1>");
						out.print(rs_coffee.getString(2));//產品名稱
						out.print("</h1>");
						out.print("<p>");
						out.print(rs_coffee.getString(6));//產品內容
						out.print("<br>");
						out.print("<br>");
						out.print("風味:"+rs_coffee.getString(4)+"<br>");
						out.print("調性:"+rs_coffee.getString(3)+"調性<br>");
						out.print("價格:$"+rs_coffee.getString(7)+"元<br>");
						out.print("</p>");
						out.print("<br>");
						out.print("<br>");
						out.print("<p>");
						out.print("庫存:"+rs_coffee.getString(8)+"<br>");
						out.print("</p>");
						out.print("<br>");
						out.print("<input type='hidden' name='product_id"+a+"' value='"+rs_coffee.getString(1)+"'>");//隱藏傳遞，跟表單一起傳
						out.print("<input type='button' class='num-button' value='-' onclick='minusNUM("+a+")'>");
                        out.print("<input type='text' class='number' id='num' name='product_number"+a+"' value='"+rs.getString(3)+"'>");
                        out.print("<input type='button' class='num-button' value='+' onclick='addNUM("+a+")'>");			
						out.print("</div>");
						out.print("<br>");out.print("<br>");out.print("<br>");out.print("<br>");
						out.print("<div class='checkout_btn'>");
						out.print("<button class='btn'> <a href='deleteproduct.jsp?product_id="+rs_coffee.getString(1)+"'>"+"刪除</a></button>");
						out.print("</div>");
						out.print("</div>");
						out.print("</div>");
						
					}
					a++;
				}
				
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
                
               
 
            </div>
              
            <div class="checkout">
                <div class="checkout-btn">
                     <input type="submit" class="button" value="結帳" />
                </div>
                <div class="goshop-btn">
                  <button class="button"> <a href="introduce.jsp">繼續選購</a> </button>
                </div>
              
            </div>
		 </form>
			<%}
		else
		{
			//con.close();
			out.println("<script language='javascript'>alert('您尚未登入，請登入!');window.location.href='login.jsp';</script>");
		}
		%>
        </section>
        <script>
			function minusNUM(num){
              let input=Number(document.getElementsByClassName('number')[num].value);
              if(input!=1){
                document.getElementsByClassName('number')[num].value=input-1;
              }
            }
            function addNUM(num){
              let input=Number(document.getElementsByClassName('number')[num].value);
                document.getElementsByClassName('number')[num].value=input+1;
            }       
		</script>
    </main>

    

    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%@include file="counter.jsp"%>人</h5>
    </footer>
  </body>
</html>