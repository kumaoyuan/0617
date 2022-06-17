<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>team</title>

    <link href="../assets/css/team2.css" rel="stylesheet">

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

    <section class="aboutus">
      <div class="aboutus-title">
        <h2>🎯團隊介紹&理念🎯</h2>
      </div>
      <br>
      <br>
      <p>
        品牌命名「好咖在」，除了包含了對品牌商品的期許之外，也有台語諧音的概念表達還好還在、還有我們在的意思，讓大家在疫情之下仍然有可以信賴的咖啡店家。<br>
        同時，疫情當下在戶外脫口罩、用餐有一定風險，好咖在團隊野立志推出不同風味的咖啡豆、外帶咖啡等餐點，讓大家仍然可以好好享受一杯咖啡。<br>
        另外，即使待在家中，也可以體驗親自沖泡咖啡的快樂。
      </p>
      <br>
    </section>

    <section class="we">
      <div class="we_title">
        ✨成員介紹✨
      </div>
      <div class="member">
        <div class="member_box">             
          <img src="../assets/img/lee.jpg" class="member_pic">
          <div class="member_text">
            <div class="member_text_title">
                前端負責夥伴
            </div>
            <p>姓名：李云平</p>
            <p>系級：資管二乙</p>
            <p>學號：10944232</p>
			<p>心得：專案前後端讀整合還是有一定難度，css跟Js也是越寫越有概念，兩個學期都有收穫，感謝我的組員們。</p>
            <br>
            <a href="https://www.instagram.com/lee_yunp_knc/" target="_blank"><img src="../assets/img/ig.png" class="icon"></a>
            <a href="https://www.facebook.com/profile.php?id=100011019242952" target="_blank"><img src="../assets/img/facebook.png" class="icon"></a>
            <a href="mailto:yunp3012@gmail.com" target="_blank"><img src="../assets/img/email.png" class="icon"></a>
          </div>
        </div>
        <div class="member_box">
          <img src="../assets/img/mark.jpg" class="member_pic">
          <div class="member_text">
          <div class="member_text_title">
            前端負責夥伴
            </div>
            <p>姓名：古茂遠</p>
            <p>系級：資管二乙</p>
            <p>學號：10944249</p>
			<p>心得：經過了這次的專案才了解一個網站從無到有的過程，也經歷過跑版，寫的東西呈現不出來的困難，謝謝陪我一起努力的組員們。</p>
            <br>
            <a href="https://www.instagram.com/2002_06_09_/" target="_blank"><img src="../assets/img/ig.png" class="icon"></a>
            <a href="https://www.facebook.com/profile.php?id=100005224807968" target="_blank"><img src="../assets/img/facebook.png" class="icon"></a>
            <a href="mailto:markmark5215@gmail.com" target="_blank"><img src="../assets/img/email.png" class="icon"></a>
          </div>
        </div>
    
        <div class="member_box">
          <img src="../assets/img/yu.jpg" class="member_pic">
          <div class="member_text">
            <div class="member_text_title">
              後端負責夥伴
            </div>
            <p>姓名：黃禹儒</p>
            <p>系級：資管二甲</p>
            <p>學號：10944150</p>
			<p>心得：好難qq但透過這次的期末專案，也了解了前後端整合的困難，還有體驗日夜顛倒的生活，謝謝有幫助我的人ˊˇˋ好人一生平安!</p>
            <br>
            <a href="https://www.instagram.com/ru._.www/" target="_blank"><img src="../assets/img/ig.png" class="icon"></a>
            <a href="https://www.facebook.com/chong.x.ye" target="_blank"><img src="../assets/img/facebook.png" class="icon"></a>
            <a href="mailto:0928rubyruby@gmail.com" target="_blank"><img src="../assets/img/email.png" class="icon"></a>
          </div>
        </div>
    
        <div class="member_box">
          <img src="../assets/img/cloud.jpg" class="member_pic">
          <div class="member_text">
            <div class="member_text_title">
              後端負責夥伴
            </div>
            <p>姓名：黃曉筠</p>
            <p>系級：資管二甲</p>
            <p>學號：10944141</p>
			<p>心得：經過上學期的前端，這次在寫後端的時候就大概知道前端的概念，所以比較好上手，但又是個熬夜熬爆，嘛辛苦組員了！</p>
            <br>
            <a href="https://www.instagram.com/_xiaojun_0603/" target="_blank"><img src="../assets/img/ig.png" class="icon"></a>
            <a href="https://www.facebook.com/profile.php?id=100024796085177" target="_blank"><img src="../assets/img/facebook.png" class="icon"></a>
            <a href="mailto:todayis0117@gmail.com" target="_blank"><img src="../assets/img/email.png" class="icon"></a>
          </div>
        </div>
      </div>
    </section>

    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%@include file="counter.jsp"%>人</h5>
    </footer>
  </body>
</html>