<!--刪除產品頁面的商品-->
<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>產品刪除</title>

    <link href="../assets/css/ordersearch.css" rel="stylesheet">

  </head>

  <body>

    <header>
      
        <nav>
          <ul class="drop-down-menu">
            <li><a href="back.jsp " class="meau_choice">後臺管理系統</a></li>
			<li><a href="question_view2.jsp" class="meau_choice">意見回饋紀錄</a></li>			
            <li><a href="ordersearch.jsp" class="meau_choice">訂單紀錄</a></li>
            <li><a href="back_product_alter.jsp" class="meau_choice">產品修改</a></li>
            <li><a href="back_product_insert.jsp" class="meau_choice">產品新增</a></li>
            <li><a href="back_product_delete.jsp" class="meau_choice">產品刪除</a></li>
            <li><a href="index.jsp">登出</a></li>
          </ul>
        </nav>
    
    </header>

    <section class="we">
      <div class="we_title">
        產品刪除
        <form action="back_delete.jsp">
          選擇要刪除的產品:
          <select name="ProductName">
            <%
				Class.forName("com.mysql.jdbc.Driver");
                String url="jdbc:mysql://localhost/?serverTimezone=UTC";
                Connection con=DriverManager.getConnection(url,"root","1234");
                String sql="use `shoppingcar`";
                con.createStatement().execute(sql);
                String sql1 = "SELECT`product_name`FROM `coffee`";
                ResultSet rs1 =con.createStatement().executeQuery(sql1);
				int i=1;
				while(rs1.next()){
				
                    out.print("<option value='"+rs1.getString(i)+"'>"+rs1.getString(i)+"</option>");
					
			    }  
				con.close();%>
          </select>
          <br>
          <div class="btn_class">
            
            <button class="btn">確定刪除</button>
          </div>
         
        </form>
      </div>
    </section>


  </body>
</html>