<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>首頁</title>

    <link href="../assets/css/index.css" rel="stylesheet">

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
        <div id="container">
        
            <ul class="parent" style="left: 0;">
            
                <li><img src="../assets/img/balama.png"></li>
                <li><img src="../assets/img/champion.png"></li>
                <li><img src="../assets/img/colombia.png"></li>
                <li><img src="../assets/img/deep.png"></li>
                <li><img src="../assets/img/fruit.png"></li>
                <li><img src="../assets/img/gold.png"></li>
                <li><img src="../assets/img/inni.png"></li>
                <li><img src="../assets/img/water.png"></li>
                <li><img src="../assets/img/three.png"></li>
                <li><img src="../assets/img/super.png"></li>
                <li><img src="../assets/img/perfect.png"></li>
                <li><img src="../assets/img/pacamara.png"></li>
                <li><img src="../assets/img/mentening.png"></li>
                <li><img src="../assets/img/kenya.png"></li>
                <li><img src="../assets/img/menba.png"></li>
            </ul>
            
            
            
            <div class="btnLeft">&lt;</div>
            
            <div class="btnRight">&gt;</div>
            
                       
            <div class="modal">

                <div class="dots">
                
                    <ul class="clearfix">
                
                        <li class="on"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                      
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
                        
                        <li class="off"></li>
    
                        <li class="off"></li>
                        
                        <li class="off"></li>
    
                        <li class="off"></li>
                    
                    </ul>
                
                </div>
            
            </div>
            
        </div>
            
        <script type="text/javascript">
          
            var imgShow = document.getElementsByClassName('parent')[0],dotList = document.querySelectorAll('.dots >.clearfix > li');
            
            var btnLeft = document.getElementsByClassName('btnLeft')[0],btnRight = document.getElementsByClassName('btnRight')[0];
            
            var dotLen = dotList.length,index = 0; 

            //圓點
            
            function showRadius() 
            {
            
                for(var i = 0; i < dotLen; i++) 
                    {
                        if(dotList[i].className === "on")
                        {                        
                        dotList[i].className = "off";               
                        }
                    }
            
                dotList[index].className = "on";
            }
            btnLeft.onclick = function() 
            {            
                index--;
            
                if(index < 0)
                { 
                
                    index = 14;
                
                }
        
                showRadius();
            
                var left;
            
                var imgLeft = imgShow.style.left;
            
                if(imgLeft === "0px") 
                { /*當是第1張時，每張圖片左移，移14張圖，位置為-(14*500)*/
            
                    left = -6500;
                }
            
                else
                {
            
                    left = parseInt(imgLeft) + 500; /*由於left為負數，每左移一張加500*/
            
                }
            
                imgShow.style.left = left + "px";
            
            }
            
           
            
            btnRight.onclick = function() 
            {
            
             index++;
            
                if(index > 14)
                { 
                
                    index = 0;
                
                }
                
                showRadius();
                
                var right;
                
                var imgLeft = imgShow.style.left;
                
                if(imgLeft === "-7000px")
                { 
                
                right = 0;
                
                }
                
                else
                {
                right = parseInt(imgLeft) - 500; /*由於left為負數，每右移一張減500*/
                }
    
                imgShow.style.left = right + "px";
            
            }
            
             
            
         
             
            
          </script>
           
            
          <div class="hotsell-title">
            <h1>好咖在年度熱銷榜</h1>
          </div>
          <br>
          <div class="hotsell">
    
            <div class="no2">
              <h2 class="no1-title">🥈第二名🥈</h2>
              <div class="no1_pic">
                <img src="../assets/img/balama.png" class="no1_pic" alt="" >
              </div>
              <!--<h4 class="no1_text">好咖在年度熱銷第一名</h4>-->
              <h4 class="no1_text">巴拿馬藝伎 日曬</h4>
              <h4 class="no1_text">NT $1,360</h4>
            </div>
    
            <div class="no1">
              <h2 class="no1-title">🥇第一名🥇</h2>
              <div class="no1_pic">
                <img src="../assets/img/gold.png"  class="no1_pic" alt="">
              </div>
              <!--<h4 class="no1_text">好咖在年度熱銷第二名</h4>-->
              <h4 class="no1_text">黃金曼特寧 G1-三次手選</h4>
              <h4 class="no1_text">NT $520</h4>
            </div>
    
            <div class="no3">
              <h2 class="no1-title">🥉第三名🥉</h2>
              <div class="no1_pic">
                <img src="../assets/img/inni.png" class="no1_pic" alt="">
              </div>
              <!--<h4 class="no1_text">好咖在年度熱銷第三名</h4>-->
              <h4 class="no1_text">印尼 林東之金</h4>
              <h4 class="no1_text">NT $520</h4>
            </div>
    
          </div>
    </main>

    

    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%@include file="counter.jsp"%>人</h5>
    </footer>
  </body>
</html>