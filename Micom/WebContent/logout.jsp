<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
 
<html>
<head>
    <title>�α׾ƿ� ó��</title>
</head>
<body>
    <%
        session.invalidate(); // ��缼������ ����
        %>
        <script> 
        alert('�α׾ƿ� �Ǿ����ϴ�.');
        location.href="loginForm.html";
        </script>
       
    %>
</body>
</html>


