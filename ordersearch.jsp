<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>訂單紀錄</title>

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
        訂單紀錄
      </div>
	  <div class="we_content">
<%
						String order_number=(String)application.getAttribute("order_number");
                        int ordernumber=Integer.valueOf(order_number).intValue();
                        for(int i=1;i<ordernumber;i++){//拿到application設定的訂單編號到第幾號
                            String id=request.getParameter("id");
                            sql="select * from `orders` where `orders_number`="+i; 
                            ResultSet rs=con.createStatement().executeQuery(sql);//依照訂單編號查詢訂單
                            int x=0;                            
                            if(rs.next()){
                                out.print("訂單流水號:"+rs.getString(13)+"<br>");
                                out.print("購買者ID:"+rs.getString(2)+"<br>");
                                out.print("收件者名稱:"+rs.getString(5)+"<br>");
                                out.print("收件者電話:"+rs.getString(6)+"<br>");
                                String  sql1="select * from `orders` where `orders_number`="+i; 
                                ResultSet rs1=con.createStatement().executeQuery(sql1); 
                                while(rs1.next())
                                {   
                                    out.print("產品ID:"+rs1.getString(3)+"&nbsp &nbsp");
                                    out.print("購買數量:"+rs1.getString(4)+"&nbsp &nbsp");
                                    out.print("小計:"+rs1.getInt(12)+"<br>");
                                    x+=rs1.getInt(12);
                                }
                                out.print("訂單總額:"+x+"<br>");
                                out.print("付款方式:"+rs.getString(7)+"<br>");
                                out.print("購買者Email:"+rs.getString(8)+"<br>");
                                out.print("收件者地址:"+rs.getString(9)+rs.getString(10)+"<br>");
                                out.print("備註:"+rs.getString(11)+"<br>");   
                                out.print("-------------------------------------------<br>");
                            }
                            else{
                                continue;
                            }
						}
%>
	</div>
      
    </section>


  </body>
</html>