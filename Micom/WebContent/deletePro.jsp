<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="university.*" %>
<!DOCTYPE>
<html>
<head>
    <title>탈퇴 완료</title>
</head>

<body>
    
    <%
    String id = (String)session.getAttribute("login");
    String pw  = request.getParameter("pw");
    //member = dto    manager - dao
    
    boolean check = DB.deleteMember(id, pw);
   
    if(check==true){
        session.invalidate();
        
%>


    <table width="270" border="1" cellspacing="0" cellpadding="5" align="center">
        <tr>
            <td height="39" align="center">
            <font size="+1" ><b>회원정보가  완전히 삭제되었습니다.</b></font>
      
        	<br>
        	
                <a href="loginForm.html" target="_parent"><input type="button" value="확인"></a>
                
            </td>
        </tr>
    </table>


<%}else {%>
    <script>
      alert("비밀번호가 맞지 않습니다.");
      history.go(-1);
    </script>
<%}%>
   
</body>
</html>