<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>

<title>MI 밀키트</title>
<style>
/* 1. 초기화 */

   a { text-decoration: none; }
   li { list-style: none; }


        body { width:960px; margin:0 auto;
        height: 100vh;
            background-color:#f5f1ee;
            background-image:url("img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-size:cover;
            padding:100;
             top: 100px; }
   .main_name { text-align : center; }
        #main-navigation { 
   border-top: 1px solid silver;
   border-bottom: 1px solid silver;
   margin-bottom- 20px;
   height: 40px;
   }
   .outer-menu-item {
   margin-top: 20px;
    font-family: '맑은고딕';
    font-size: 20px;
    color: black;
    float: right;
   }
   .outer-menu-item:hover {
   background: black;
   color: white;
   }
   .menu-title {
   display: block;
   height: 30px; line-height: 30px;
   text-align: center;
   padding:5px 20px;
   }
   
   .inner-menu {
   display: none;
   
   top: 40px; left: 0;
   width:100%;
   background: white;
   box-shadow:0 2px 6px rgba(5, 5, 5, 0.9);
   z-index: 1000;
   text-align: center
   }
   .inner-menu-item > a {
   display: block;
   padding: 5px 10px;
   color: black;
   }
   .inner-menu-item > a:hover {
   background: gray;
   color: white;
   }
/* 5. 검색 양식 추가하기(내비게이션 내부의 검색) */
   .search-bar {
   height:26px
   padding: 7px;
   }
   #login_form{
             text-align:center; 
            border-radius: 10px;
            padding:30px 50px;
            background: #fff;
            text-align: center;
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%);
        }
   .input-search {
   display: block;
   float:left;
   background-color: #FFFFFF;
   border: 1px solid #CCCCCC;
   border-radius: 15px 0 0 15px;
   width: 300px; height: 24px;
   padding: 0 0 0 10px;
   font-size: 12px;
   color: #555555;
   }
   .logo{
   
   float: left;
    margin: 20px 0 0 20px;
    font-size: 25px;
   
   }
   .ff{
   
   float: right;
    
   
   }

   .input-search-submit {
   float:left;
   width: 50px; height: 26px;
   border-radius: 0 15px 15px 0;
   border: 1px solod #CCCCCC;
   margin-left: -1px;
   vertical-align: top;
   display: inline-block;
   }

</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
</script>
<script>
$(document).ready(function () {
$('.outer-menu-item').hover(function () {
$(this).find('.inner-menu').show();
}, function () {
$(this).find('.inner-menu').hide();
});
});
</script>
</head>
<body>
<div class ="con">
<div id="login_form">
<header>
         <nav>
         <div class= "logo">
    <%=session.getAttribute("login") %>님 환영합니다.
    </div>
   <div class = "ff">
    <a href="cusinformation.jsp" target="iframeContent"><input type="button" value="회원정보조회" ></a>
	 <a href="cusorder.jsp" target="iframeContent"><input type="button" value="주문내역" ></a>
   <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
   </div>
    
   </nav>
   <h1 class="main-name">MI 밀키트</h1>
   
</header>
   
<nav id="main-navigation">
 <div class="pull-left">
  <ul class="outer-menu">
   <li class="outer-menu-item">
    <a href="buy.jsp" target="iframeContent"><span class="menu-title">모든상품</span>    
   </li>
   <li class="outer-menu-item">
    <a href="popular.jsp" target="iframeContent"><span class="menu-title">인기상품</span>    
   </li>
   <li class="outer-menu-item">
    <a href="sale.jsp" target="iframeContent"><span class="menu-title">할인상품</span>    
   </li>
   <li class="outer-menu-item">
    <a href="review.jsp" target="iframeContent"><span class="menu-title">리뷰보기</span></a>   
   </li>
   <li>
   <div class="search-bar">
  </div>
   </li>
   </li>
  </ul>
 </div>
</nav>
<article>
 <iframe src="buy.jsp" width="960px" height="600px" name=iframeContent>
 </iframe>
 </div>
</div>
</body>
</html>