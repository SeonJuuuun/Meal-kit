<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
 
<html>
<head>
    <title>로그아웃 처리</title>
</head>
<body>
    <%
        session.invalidate(); // 모든세션정보 삭제
        %>
        <script> 
        alert('로그아웃 되었습니다.');
        location.href="loginForm.html";
        </script>
       
    %>
</body>
</html>


