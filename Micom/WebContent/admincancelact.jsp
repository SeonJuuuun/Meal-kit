<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
<!DOCTYPE html>
<html>
<head>

<title>취소확인</title>
</head>
<body>
	<%
	request.setCharacterEncoding("euc-kr");
	DB.loadConnect();
	int onum=Integer.parseInt(request.getParameter("onum"));
	DB.cancelAction(onum);
	%>
	
<script>
alert("취소 완료되었습니다.")
location.href="admincancel.jsp"
</script>
</body>
</html>