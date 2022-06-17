<%@ page import = "java.sql.*, java.util.*"%>
<%@page contentType="text/html" pageEncoding="utf-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
   
    <title>聯絡我們</title>

    <link href="../assets/css/question2.css" rel="stylesheet">

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
      <div class="pageback">
        <div class="question_box">
          <div class="box_left">
            <div class="box_left_title">
              ⚠️常見問題⚠️
            </div>
            <div class="box_left_example">
              <button class="example_accordion"> 問題：產品是否有七天鑑賞期？ </button>
       
              <div class="example_panel">
                <p>
                  我們的回答：產品在未開封下七天內可以無條件進行退換貨，若產品已開封則不受理。<br>
                  (注意! 若是在產品內發現異物，煩請與客服聯絡，我們將迅速為您處理。)
                </p>
              </div>

              <button class="example_accordion"> 問題：網路下單後大約多久會收到貨？ </button>
          
              <div class="example_panel">
                <p>
                  我們的回答：小本經營，努力在3-4天內出貨，配合物流運送大約一周後可以拿到商品。<br>
                  (注意! 下單時間若遇國定假日、連假期間會導致收貨時間延長，不能等勿下。)
                </p>
              </div>

              <button class="example_accordion"> 問題：如何連絡好咖在？ </button>
          
              <div class="example_panel">
                <p>
                  我們的回答：您可以在下方留言板區域留下您想詢問的事情或是意見回饋等，並確實填寫聯絡人資訊，將於上班日盡速回覆!<br>
                </p>
              </div>    
            </div>
          </div>

          <script>
            var acc = document.getElementsByClassName("example_accordion");
            var i;
                
            for (i = 0; i < acc.length; i++) 
            {
                acc[i].addEventListener("click", function() 
                {
                    this.classList.toggle("active");
                    var panel = this.nextElementSibling;
                    if (panel.style.maxHeight) 
                    {
                        panel.style.maxHeight = null;
                    } 
                    else 
                    {
                        panel.style.maxHeight = panel.scrollHeight + "px";
                    } 
                });
            }
    
          </script>

          <div class="box_right">
			<form method="post" action="question_view.jsp">
                <div class="box_right_title">
                  📝意見反饋📝
                </div>
                <div class="formbox">
                  <div class="formbox_information">
                    <label for="formbox_information_name">姓名（如何稱呼您）：</label>
                    <input type="text" name="name" id="name" placeholder="Your name" >
                  </div>
                  <div class="formbox_information">
                    <label for="formbox_information_type">聯絡方式 ：</label>
                    <input type="text" name="type" id="type" placeholder="Your Email Address">
                  </div>
                  <br>
                  <div class="formbox_questionbox">
                      <label for="user_question">問題 / 建議 ：</label>
                      <textarea required name="question" cols="55" rows="10" wrap="hard" class="textarea"></textarea>
                  </div>
                  <div class="formbox_btn">
        
                      <input type="submit" value="送出" class="btn" required="required" onclick=" alert('感謝您的回饋!')" />

                  
                  </div>
                </div>
			</form>

          </div>
        </div>
      </div>

    </main>

    

    <footer>
      <h5>Copyrgiht @ 2022 Design By CYIM <br>瀏覽人數:<%@include file="counter.jsp"%>人</h5>
    </footer>

  </body>
</html>