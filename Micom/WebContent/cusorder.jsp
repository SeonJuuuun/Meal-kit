<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>


<!DOCTYPE>
<html>
<head>
    <title>나의 주문내역</title>
</head>
<style type="text/css">
         @import url('http://fonts.googleapis.com/earlyaccess/nanumgothic.css'); 
        @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 100;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Thin.otf) format('opentype');}
        @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 300;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Light.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 400;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Regular.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 500;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Medium.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 700;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Bold.otf) format('opentype');} @font-face {font-family: 'Noto Sans KR';font-style: normal;font-weight: 900;src: url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff2) format('woff2'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.woff) format('woff'),url(//fonts.gstatic.com/ea/notosanskr/v2/NotoSansKR-Black.otf) format('opentype');}

        body{
           margin:0 auto;
        }
        body, table, div, p ,span{font-family:'Nanum Gothic';} 
        body, table, div, p ,span{font-family:'Noto Sans KR';}
        
        a{
            text-decoration: none;
            color:#333;
        }
       #con{
            height: 100vh;
            background-color:#f5f1ee;
            background-image:url("img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-size:cover;
            padding:100;
             top: 100px;
        }
        #insert{
            width: 1000px;
            height: 1000px;
            margin: 0 auto;
             position: relative; 
           
        }
        #insert_form{
            text-align: center;
              
        }
        .insert{
            font-size:25px;
            font-weight: 900;
            color:#333;
        }

        .size{
            width:300px;
            height:30px;
            padding-left:10px;
            background-color: #f4f4f4;
            margin-left:10px; 
            border:none;
            border-radius: 5px;
        }

       
        hr{
            margin-top:20px;
            background:#eee;
            
        }
        .btn{
            width:110px;
            height: 40px;
            font-size:15px;
            background-color: #8aa1a1;
            color:#fff;
            border:none;
            cursor: pointer;
            border-radius: 5px;
        }
        table {
          width: 70%;
          border-top: 1px solid #444444;
          border-collapse: collapse;
          background-color: #fff;
        }
        th, td {
          border-bottom: 1px solid #444444;
          padding: 10px;
        }
     
    </style>
<body>
   
   
    <%
    String id = (String)session.getAttribute("login");
   
    Customer dto = DB.getMember(id); //c
    try{
    %>
 <div id ="con">
    <div id="insert">
    <div id="insert_form">
   <table border="1">
      <tr>
          <td width="10%">주문번호</td>
          <td width="10%">주문시간</td>
          <td width="10%">상품이름</td>
          <td width="10%">주문수량</td>
          <td width="10%">주문상태</td>
          <td width="10%">리뷰작성</td>
          <td width="10%">취소</td>
        <%
      DB.loadConnect();
      ResultSet rs = DB.selectcusordertable(id);
      int onum;
      String state;
      while(rs.next()){
      %><tr>
      <td><%=onum = rs.getInt(1)%></td>
      <td><%=rs.getDate(2)%>/<%=rs.getTime(2)%></td>
      <td><%=rs.getString(4)%></td>
      <td><%=rs.getInt(5)%></td>
      <td><%=state=rs.getString(6)%></td>   
      <td><a href="reviewinsert.jsp?onum=<%=onum %>" target="iframeContent"><input type="button" value="리뷰작성"></a></td>
      <td><form action="cusordercancel.jsp?onum=<%=onum %>" method="POST"><button>주문취소</button></form></td>
      </tr>
      <%
      }
      %>
      </table>
</body>

<%}catch(Exception e){}%>

<script language="JavaScript">
   <!--

   function checkIt(){
          if(document.updateform.pw.value != document.updateform.pw2.value || document.updateform.pw.value=="" || document.updateform.pw2.value=="" ){
            alert("joinform : 비밀번호를 동일하게 입력하세요.");
            return false;
          }
          if(!document.updateform.tel.value){
              alert("joinform : 전화번호를 입력하지 않으셨습니다.");
              return false;
          }
          if(!document.updateform.email.value){
              alert("joinform : 이메일을 입력하지 않으셨습니다.");
              return false;
          }
        }
-->
</script>

</html>