<%@ page import = "java.sql.*, java.util.*"%>
<!-- 引入資源 -->
<%@page contentType="text/html" pageEncoding="utf-8"%>
<html lang="en">
	<head>
		<meta charset="UTF-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	   
		<title>列出所有留言</title>

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
			<div class="we_box">
				<div class="we_title">
					留言紀錄<br>
				</div>
				
<%
try {
//Step 1: 載入資料庫驅動程式 
    Class.forName("com.mysql.jdbc.Driver");
    try {
//Step 2: 建立連線 	
        String url="jdbc:mysql://localhost:3306/?serverTimezone=UTC";
        String sql="";
        Connection con=DriverManager.getConnection(url,"root","1234");
        if(con.isClosed())
           out.println("連線建立失敗");
        else {
//Step 3: 選擇資料庫   
           sql="USE `shoppingcar`";//取用test資料庫
           con.createStatement().execute(sql);
//Step 4: 執行 SQL 指令, 若要操作記錄集, 需使用executeQuery, 才能傳回ResultSet	
           sql="SELECT * FROM `question`"; //從test table board去算出共幾筆留言
		   ResultSet rs=con.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY).executeQuery(sql);
           //先移到檔尾, getRow()後, 就可知道共有幾筆記錄
           	rs.last();
		    int total_content=rs.getRow();


// current_page... SELECT * FROM `question` ORDER BY `question_id` DESC LIMIT
//      current_page=1: SELECT * FROM `question` ORDER BY `question_id` DESC LIMIT 0, 5
//      current_page=2: SELECT * FROM `question` ORDER BY `question_id` DESC LIMIT 5, 5
//      current_page=3: SELECT * FROM `question` ORDER BY `question_id` DESC LIMIT 10, 5
           rs=con.createStatement().executeQuery(sql);
//  逐筆顯示, 直到沒有資料(最多還是5筆)
           while(rs.next())
            {
				out.println("<div class='we_content'>");					
                out.println("<img class='we_img' src='../assets/img/favourites.png'>&nbsp&nbsp");				 				 
                out.println("留言順序:&nbsp"+rs.getString(1)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                out.println("訪客姓名:&nbsp"+rs.getString(2)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                out.println("Email:&nbsp"+rs.getString(3)+"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");
                out.println("留言內容:&nbsp"+rs.getString(4)+"&nbsp&nbsp&nbsp<br>");
                out.println("</div>");	
				 
                 
          }
		  out.println("<div class='we_view_count'>");
		  out.println("共"+total_content+"筆留言&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp");

           //每頁顯示5筆, 算出共幾頁
           int page_num=(int)Math.ceil((double)total_content/5.0); //無條件進位
           out.println("請選擇頁數");
           //使用超連結方式, 呼叫自己, 使用get方式傳遞參數(變數名稱為page)
           for(int i=1;i<=page_num;i++) //建立1,2,...頁超連結
		   {  
        		   out.print("<a href='question_view2.jsp?page="+i+"'>"+i+"</a>&nbsp;"); //&nbsp;html的空白
		   }
           out.println("</div>");
		   out.println("</div>");												 
		   
           out.println("<p>");
           //讀取page變數
           String page_string =  request.getParameter("page");
           if (page_string == null) 
		       page_string = "0";          
           int current_page=Integer.valueOf(page_string);
           if(current_page==0) //若未指定page, 令current_page為1
	          current_page=1;
	       //計算開始記錄位置   
//Step 5: 顯示結果 
           int start_record=(current_page-1)*5;
           //遞減排序, 讓最新的資料排在最前面
           sql="SELECT * FROM `question` ORDER BY `question_id` DESC LIMIT ";
           sql+=start_record+",5";
           out.println("</div>");								

//Step 6: 關閉連線
          con.close();
      }
    }
    catch (SQLException sExec) {
           out.println("SQL錯誤"+sExec.toString());
		   
    }
}
catch (ClassNotFoundException err) {
      out.println("class錯誤"+err.toString());
}
%>
		</section>

	</body>
	
</html>