<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>


<!DOCTYPE>
<html>
<head>
    <title>상품정보 수정</title>
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
    String pdname = (String)request.getParameter("pdname");
    pdname = new String(pdname.getBytes("ISO-8859-1"), "utf-8");
    session.setAttribute("pdname",pdname);
    pdname = (String)session.getAttribute("pdname");
    Product pro = DB.getProduct(pdname);
    try{
    %>
   <div id="con">
    <div id="login">
    <div id="login_form">
    <form name="updateform" action="updateProduct.jsp" method="post" onSubmit="return checkIt()" >
    
       
           <h3 class="login" style="letter-spacing:-1px;">상품정보 수정
        
             <p style="text-align: left; font-size:12px; color:#666">사진 </p>
            
                   <input type="text" name="photo" size="15" maxlength="12" class="size" value="<%=pro.getPhoto()%>"></input> 
              
       
           
             <p style="text-align: left; font-size:12px; color:#666">상품명</p>
          
              <%=pro.getPdname()%> 
                
        
             
              <p style="text-align: left; font-size:12px; color:#666">가격 </p>
           
                <input type="text" name="price" size="15" maxlength="12" class="size" value="<%=pro.getPrice()%>"></input>
                
       
      
          
            <p style="text-align: left; font-size:12px; color:#666">재고</p> 
              <input type="text" name="stock" size="15" maxlength="12" class="size" value="<%=pro.getStock()%>"></input> 
               
         
          <p style="text-align: left; font-size:12px; color:#666">조리시간</p>
              
               <input type="text" name="time" size="15" maxlength="12" class="size" value="<%=pro.getTime()%>"></input> 
             
       
          
            <p style="text-align: left; font-size:12px; color:#666">인분</p>
                 
                <input type="text" name="serving" size="15" maxlength="12" class="size" value="<%=pro.getServing()%>"></input>  
               
        
             
         <p style="text-align: left; font-size:12px; color:#666">할인율</p>
               
                <input type="text" name="sale" size="15" maxlength="12" class="size" value="<%=pro.getSale()%>"></input> 
                
       
      
        
 
        <input type="submit" value="수정" class="btn">
        <input type="button" name="cancel" class="btn" value="변경 취소" onclick="javascript:window.location='adminproduct.jsp'">
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