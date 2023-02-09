<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>


<!DOCTYPE>
<html>
<head>
    <title>회원정보 수정</title>
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
    String id = (String)session.getAttribute("login");
   
    Customer dto = DB.getMember(id); //c
    try{
    %>
   <div id="con">
    <div id="login">
    <div id="login_form">
    <form name="updateform" action="updateMember.jsp" method="post" onSubmit="return checkIt()">
    
       
           <h3 class="login" style="letter-spacing:-1px;">계정정보 수정</td>
        
             <p style="text-align: left; font-size:12px; color:#666">이름 </p>
            
                   <input type="text" name="name" size="15" maxlength="12" class="size" value="<%=dto.getName()%>"></input> 
              
       
           
             <p style="text-align: left; font-size:12px; color:#666">아이디</p>
          
              <%=dto.getId()%> 
                
        
             
              <p style="text-align: left; font-size:12px; color:#666">패스워드 </p>
           
                <input type="password" name="pw" size="15" maxlength="12" class="size" value="<%=dto.getPw()%>"></input>
                
       
      
          
            <p style="text-align: left; font-size:12px; color:#666">주소</p> 
              <input type="text" name="address" size="15" maxlength="12" class="size" value="<%=dto.getAddress()%>"></input> 
               
         
          <p style="text-align: left; font-size:12px; color:#666">전화번호</p>
              
               <input type="text" name="phnumber" size="15" maxlength="12" class="size" value="<%=dto.getPhnumber()%>"></input> 
             
       
          
            <p style="text-align: left; font-size:12px; color:#666">이메일</p>
                 
                <input type="text" name="email" size="15" maxlength="12" class="size" value="<%=dto.getEmail()%>"></input>  
               
        
             
         <p style="text-align: left; font-size:12px; color:#666">생년월일</p>
               
                <input type="text" name="date" size="15" maxlength="12" class="size" value="<%=dto.getDate()%>"></input> 
                
       
      
        
 
        <input type="submit" value="수정" class="btn">
        <input type="button" name="cancel" class="btn" value="변경 취소" onclick="javascript:window.location='cusinformation.jsp'">
    </form>
   
       <hr>
       </div>
    
    </div>
   </div>
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