<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="config.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    
    <title>member</title>

    <link href="../assets/css/detail.css" rel="stylesheet">
</head>

<body>
    <div class="detail">
        <form class="form">
            <div class="detail_title">
                會員紀錄
            </div>

            <div class="detail_box">
                <div class="title">  消費紀錄</div><br>
                <div class="text">
<%
                            String id=(String)session.getAttribute("id");
                            sql="select * from `orders` where `id`='"+id+"'";
                            ResultSet rs=con.createStatement().executeQuery(sql);//依照訂單編號查詢訂單
                            int x=0;                            
                            if(rs.next()){
                                out.print("訂單流水號:"+rs.getString(13)+"<br>");
                                out.print("購買者ID:"+rs.getString(2)+"<br>");
                                out.print("收件者名稱:"+rs.getString(5)+"<br>");
                                out.print("收件者電話:"+rs.getString(6)+"<br>");
                                String  sql4="select * from `orders` where `id`='"+id+"'";
                                ResultSet rs4=con.createStatement().executeQuery(sql4); 
                                while(rs4.next())
                                {   
                                    out.print("產品ID:"+rs4.getString(3)+"&nbsp &nbsp");
                                    out.print("購買數量:"+rs4.getString(4)+"&nbsp &nbsp");
                                    out.print("小計:"+rs4.getInt(12)+"<br>");
                                    x+=rs4.getInt(12);
                                }
                                out.print("訂單總額:"+x+"<br>");
                            }
						
%>

				</div>
            </div>

            <hr>

            <div class="detail_box">
                <div class="title">留言紀錄</div>
                <div class="text">	
<%
					String sql1="select * from `message` where `id`='"+id+"'"; // SQL 語法：取得資料表中的所有資料
					ResultSet rs1=con.createStatement().executeQuery(sql1); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					
			   
			   while(rs1.next())
			   {
					out.print("<div class='text2'>");					
					out.print("留言者:&nbsp"+rs1.getString(3)+"&nbsp&nbsp&nbsp&nbsp");					
				   
				   	String productid=rs1.getString(1);
					String sql2="select `product_id` from `message` where `product_id` ='"+productid+"'";
					ResultSet rs2=con.createStatement().executeQuery(sql2); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					
					while(rs2.next())
					{
					String productid2=rs2.getString(1);
					String sql3="select `product_name` from `coffee` where `product_id` ='"+productid2+"'";
					ResultSet rs3=con.createStatement().executeQuery(sql3); // ResultSet 用來儲存查詢結果 (*註解1)，將上一行 SQL 執行後並儲存結果
					
						while(rs3.next())
						{
							out.print("產品名稱:&nbsp"+rs3.getString(1)+"&nbsp&nbsp&nbsp&nbsp");
						}
		   
					}
					
					out.print("留言內容:&nbsp"+rs1.getString(4));
					out.print("星星評價::&nbsp"+rs1.getString(5));					
					out.print("</div>");					
										   
				}
				con.close();
%>
				
					<br>
				</div>
            </div>

           
            <div class="detail_btn">
                
                <button class="btn"><a href="introduce.jsp">回去購物</a></button>
                <button class="btn"><a href="member.jsp">回會員中心</a></button>
                
            </div>
        </form>
        
    </div>
    
</body>
</html>