<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
<!DOCTYPE html>
<html>
<head>

<title>���Ȯ��</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	DB.loadConnect();
	int onum=Integer.parseInt(request.getParameter("onum"));
	DB.cancelAction(onum);
	%>
	
<script>
alert("��� �Ϸ�Ǿ����ϴ�.")
location.href="admincancel.jsp"
</script>
</body>
</html>