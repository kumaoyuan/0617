<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>產品新增</title>

    <link href="../assets/css/ordersearch.css" rel="stylesheet">

  </head>

  <body>

    <header>
      
        <nav>
          <ul class="drop-down-menu">
            <li><a href="back.jsp" class="meau_choice">後臺管理系統</a></li>
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
        產品新增
      </div>
        <form action="back_product_insert2.jsp">
		
          產品ID:<input type="text" id="orderid" name="id">
          <br>
          <br>
          產品名稱:<input type="text" id="orderid" name="name">
          <br>
          <br>
          產品調性:<input type="text" id="orderid" name="aroma">
          <br>
          <br>
          產品風味:<input type="text" id="orderid" name="flavor">
          <br>
          <br>
          圖片路徑:<input type="text" id="orderid" name="img">
          <br>
          <br>
          產品描述:<input type="text" id="orderid" name="note">
          <br>
          <br>
          產品價格:<input type="text" id="orderid" name="price">
          <br>
          <br>
          產品庫存:<input type="text" id="orderid" name="ipound">
          <br>
          <br>
		  
		  
          <div class="btn_class">
            <input type="reset"  class="btn" value="重設">
            <input type="submit" class="btn" value="新增">
          </div>
          
        </form>
      
    </section>


  </body>
</html>