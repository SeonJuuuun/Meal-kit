
<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
 

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원 정보 조회</title>
</head>
<style type="text/css">
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
        #login{
            width:600px;
            height: 600px;
            margin:0 auto;
             position: relative; 
           
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
        .login{
            font-size:25px;
            font-weight: 900;
            color:#333;
        }

        .size{
            width:300px;
            height:30px;
            padding-left:10px;
            background-color: #f4f4f4;
            /margin-left:10px; 
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
</style>
<body>
 <%
 Customer cus=new Customer();
 cus=DB.getMember((String)session.getAttribute("login")); 
 %>
 
 <div id="con">
    <div id="login">
    <div id="login_form">
 
    <h3 class="login" style="letter-spacing:-1px;">내 정보</h3>
   


   
   <p style="text-align: left; font-size:12px; class="size" color:#666">이름 : <%=cus.getName() %></p>
  
   <p style="text-align: left; font-size:12px; class="size"color:#666">아이디 : <%=cus.getId() %></p> 
 
   <p style="text-align: left; font-size:12px;class="size" color:#666">패스워드 : <%=cus.getPw() %></p>
 
   <p style="text-align: left; font-size:12px; class="size" color:#666">주소 : <%=cus.getAddress() %></p> 
  
       <p style="text-align: left; font-size:12px;class="size" color:#666">전화번호 : <%=cus.getPhnumber() %></p>
      
    <p style="text-align: left; font-size:12px; class="size"color:#666">이메일 : <%=cus.getEmail() %></p>
   
   <p style="text-align: left; font-size:12px; class="size" color:#666">생년월일 : <%=cus.getDate() %></p>
 
  
 
   <input type="button" value="수정" class="btn" onclick="location.href='updateForm.jsp'">
   <input type="button" align=center value="회원탈퇴" class="btn" onclick="location.href='deleteForm.jsp'">
   
   
   <hr>
       </div>
    
    </div>
   </div>
 
</body>
</html>