<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>精品咖啡豆</title>

    <link href="../assets/css/checkout.css" rel="stylesheet">

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
                  <span class="icon"><img src="../assets/img/search.png"></span>
                  <input type="search" id="search" placeholder="Search..." />
                </div>
              </div>
            </li>
			<%
             int sum=0;
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
            <li><a href="login.jsp"><img src="../assets/img/member.png" id="member"></a></li>
            <li><a href="cart.jsp"><img src="../assets/img/cart.png" id="cart" ></a></li>
          </ul>
        </nav>
    
    </header>
    <main> 
        <div class="checkout">
            <div class="checkouttitle">
              <h2>訂單資料</h2>
            </div>
            
            <div class="form">
            <form method="post" action="addorder.jsp">
              <table class="form">
<%				
					

					String userid=(String)session.getAttribute("id");
					String sql1 = "SELECT * FROM `cart` WHERE `id`='" +userid+"'";
					ResultSet rs1=con.createStatement().executeQuery(sql1);
					
						out.print("<tr>");
						out.print("<td class='t1' rowspan='2'>選購明細</td>");
						out.print("</tr>");
						out.print("<tr>");
						out.print("<td class='t2'>");

					while(rs1.next()){												
						String sql2="SELECT * FROM `cart` WHERE `product_id`='"+rs1.getString(2)+"'";
						ResultSet rs2 =con.createStatement().executeQuery(sql2);
						while(rs2.next()){
							String sql3="select `product_name`,`product_price` from `coffee` where`product_id`='"+rs2.getString(2)+"'";
							ResultSet rs3=con.createStatement().executeQuery(sql3);
							while(rs3.next()){
							int price=rs3.getInt(2);
							int stock2=rs1.getInt(3);
							int total=price*stock2;
							out.print("<p>");
							out.print("產品名稱:"+rs3.getString(1)+",單價:"+rs3.getString(2)+",購買數量:"+rs1.getString(3)+",小計:"+total+"<br>");
							out.print("</p>");

							sum+=(total);
		
							}
							
						}
						
					}		out.print("總額:"+sum);
							out.print("</td>");
							out.print("</tr>");
							
%>
                <tr>
                  <td class="t1">收件者姓名</td>
                  <td class="t2"><input type="text" class="tt2" size="40" name="receivername"placeholder="  請輸入您的姓名" height="40px"></td>
				</tr>
				<tr>
                  <td class="t1">收件者電話(10碼)</td>
                  <td class="t2"><input type="text" class="tt2" size="40" name="tel" maxlength="10" placeholder="  請輸入您的連絡電話"></td>
               </tr>
			   <tr>
                  <td class="t1">付款方式</td>
                  <td colspan="3" td class="t2">
                    &nbsp &nbsp
					<input type="radio" name="pay_way" value="貨到付款" checked>貨到付款
					&nbsp &nbsp
                    <input type="radio" name="pay_way" value="線上匯款">線上匯款
                  </td>
                </tr>
                <tr>
                    <td class="t1"> 聯絡信箱</td>                
                    <td colspan="3" class="t2"> <input type="email" class="tt2" size="50" name="email" placeholder="  請輸入您的gmail"></td>
                </tr>
              <tr>
                  <td class="t1">送件地址</td>
                  <td colspan="3" class="t2">
                      <select name="countyname" class="tt2" >
                          <option>宜蘭縣</option>
                          <option>基隆市</option>
                          <option>臺北市</option>
                          <option>新北市</option>
                          <option selected >桃園市</option>
                          <option>新竹市</option>
                          <option>苗栗縣</option>
                          <option>臺中市</option>
                          <option>彰化縣</option>
                          <option>南投縣</option>
                          <option>雲林縣</option>
                          <option>嘉義縣</option>
                          <option>嘉義市</option>
                          <option>臺南市</option>
                          <option>高雄市</option>
                          <option>屏東縣</option>
                          <option>臺東縣</option>
                          <option>花蓮縣</option>
                          <option>澎湖縣</option>
                          <option>金門縣</option>
                          <option>連江縣</option>
                      </select>
                      <input type="text" class="tt2" size="50" name="addr"placeholder="  請輸入您的地址">
                  </td>
              </tr>
              <tr>
                  <td valign="top" class="t1">備註</td>
                  <td colspan="3" class="t2">
                      <textarea rows="4" cols="50" name="note"></textarea>
                  </td>
              </tr>
              <tr>
                  <td colspan="4" style="text-align: center;">
                    <div class="checkout_btn">
                        <input type="submit" class="btn" value="結帳" />
                        <button type='button' class="btn" ><a href="cart.jsp">返回</button>
                    </div>
                      
                  </td>                
              </tr>
              </table>
            </form>
            </div>
         </div>
    </main>
<%
				sql="select * from counter"; // SQL 語法：取得 counter 資料表中的所有資料
				ResultSet rs=con.createStatement().executeQuery(sql); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
			while(rs.next()) // 一筆一筆讀取資料，回傳 false 表示讀取結束
            {
				String c_S= rs.getString(1); // 取得資料表第一個欄位的資料到 c_S 這個字串中
				int c=Integer.parseInt(c_S); // 將 c_S 這個字串轉成 int 整數並存至 c 變數
				if (session.isNew()) { // 如果使用者是使用新的 Session 連入
					c++; // c 變數 +1
			}

%>
    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%=c%>人</h5>
    </footer>
<%
			sql="update counter set count=\'" + c + "\'"; // SQL 語法：將 c 的數字更新到 counter 資料表中的 count 欄位
			}
			con.createStatement().execute(sql); // 執行剛剛的 SQL 語法
			con.close(); // 關閉 MySQL 連線

%>
  </body>
</html>