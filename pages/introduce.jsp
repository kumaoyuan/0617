<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>商品介紹</title>

    <link href="../assets/css/introduce.css" rel="stylesheet">

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
        <div class="title">
            ✨商品介紹✨
        </div>
        <section class="introduce_up">
            <div class="coffeebox">
                <div class="coffeebox_left">
                    <div class="coffeebox_pic">
                        <img src="../assets/img/coffee.jpg">
                    </div>
                </div>
                <div class="coffeebox_right">
                    <div class="coffee_title">
                        精品咖啡豆
                    </div>
                    <div class="coffee_text">
                        好咖在團隊親自挑選每一款咖啡豆，深入種植地進行整體評估。
                        經過多次烘焙與測試我們保留最美好且純粹的風味。
                    </div>
                    <div class="connect_btn">
                        <button class="btn"> <a href="boutique.jsp">前往商品頁→</a></button>
                    </div>
                </div>
            </div>
                
        </section>
        
        <section class="introduce_down">
            
            <div class="private">
                <div class="private_box">     
                    <div class="private_pic">
                        <img src="../assets/img/wood_coffee.jpg" >
                    </div>      
                    
                
                    <div class="private_title">
                        私房咖啡豆-木質調性
                    </div>

                    <div class="private_text">
                        優秀的木質調，是一股清新、沉穩、安定的氣息，並非劣質咖啡豆中聞到的「潮濕、腐爛」的木頭味，這樣的木質香氣相當難得。
                    </div>

                    <div class="connect_btn">
                        <button class="btn"> <a href="wood.jsp">前往商品頁→</a></button>
                    </div>
                  
                    
                    
                </div>

                

                <div class="private_box">     
                    <div class="private_pic">
                        <img src="../assets/img/fruit_coffee.jpg" >
                    </div>      
                    
                
                    <div class="private_title">
                        私房咖啡豆-水果調性
                    </div>

                    <div class="private_text">
                        因為產地、品種不同、種植方式、處理方法、海拔而產生不同的味道，調性香甜迷人，口感酸甜、富有層次。
                    </div>

                    <div class="connect_btn">
                        <button class="btn"> <a href="fruit.jsp">前往商品頁→</a></button>
                    </div>
                  
                    
                    
                </div>
                
                <div class="private_box">     
                    <div class="private_pic">
                        <img src="../assets/img/flower_coffee.jpg" >
                    </div>      
                    
                
                    <div class="private_title">
                        私房咖啡豆-花香調性
                    </div>

                    <div class="private_text">
                        濃烈的花香，層次豐富與多變奔放的花香調性，採用日曬處理、淺中焙度，口感乾淨明亮，聞得到花香、喝得到熱帶水果的甜韻。
                    </div>

                    <div class="connect_btn">
                        <button class="btn"> <a href="flower.jsp">前往商品頁→</a></button>
                    </div>
                  
                    
                    
                </div>


            </div>
        </section>

    </main>

    

    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%@include file="counter.jsp"%>人</h5>
    </footer>
  </body>
</html>