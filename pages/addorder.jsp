<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
	
		request.setCharacterEncoding("UTF-8");
					
		String receivername = request.getParameter("receivername");
		String tel = request.getParameter("tel");
		String payway = request.getParameter("pay_way");
		String email = request.getParameter("email");
		String countyname = request.getParameter("countyname");
		String address = request.getParameter("addr");
		String note = request.getParameter("note");
		

	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				   out.println("警告：連線建立失敗！");
				else{
					
					String sql="use `shoppingcar`";
					con.createStatement().execute(sql);
					
					String userid=(String)session.getAttribute("id");
					String productid=request.getParameter("product_id");
					String number=request.getParameter("product_number");
					String order_number=(String)application.getAttribute("order_number");
					int ordernumber=Integer.valueOf(order_number).intValue();
					String sql1 = "SELECT * FROM `cart` WHERE `id`='" +userid+"'"; //抓購物車，查詢對應使用者 
					ResultSet rs1 =con.createStatement().executeQuery(sql1);
					
				while(rs1.next()){
					
					String sql4="SELECT * FROM `coffee` WHERE `product_id`='"+rs1.getString(2)+"'";
					ResultSet rs4=con.createStatement().executeQuery(sql4);
					
					while(rs4.next()){
						int stock=rs4.getInt(8);//原本庫存
						int price=rs4.getInt(7);
						int stock2=Integer.valueOf(rs1.getString(3)).intValue();//購買數量
						int total=price*stock2;
						String sql2="INSERT INTO `orders`(`id`,`product_id`,`product_number`,`receivername`,`tel`,`pay_way`,`email`,`countyname`,`addr`,`note`,`total`,`orders_number`)";
						sql2+=" values('"+userid+"','"+rs1.getString(2)+"','"+rs1.getString(3)+"','"+receivername+"','"+tel+"','"+payway+"','"+email+"','"+countyname+"','"+address+"','"+note+"','"+total+"','"+ordernumber+"')"; 
						con.createStatement().execute(sql2);

						
							
						int c=stock-stock2;//庫存扣除
						String sql5="UPDATE `coffee` SET `ipound`='"+c+"' WHERE`product_id`='"+rs1.getString(2)+"'";//庫存存回去
						con.createStatement().execute(sql5);

						
					}
					String cartid=rs1.getString(4);
					String sql3="DELETE FROM `cart` WHERE `cartid`='"+cartid+"'";//清空購物車
					con.createStatement().execute(sql3);
					
				}		
						ordernumber++;
						order_number = String.valueOf(ordernumber);
						application.setAttribute("order_number", order_number);

						out.print("<script>alert('成功送出訂單');location.href='detail.jsp'</script>");
			   
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