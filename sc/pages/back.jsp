<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>後臺管理系統</title>

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
			Hello!&nbsp&nbsp&nbsp歡迎來到後台~\=o=/~
		</div>
    </section>


  </body>
</html>