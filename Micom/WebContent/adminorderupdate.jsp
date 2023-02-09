<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* ,university.*"  %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<%
   request.setCharacterEncoding("euc-kr");
   int onum = Integer.parseInt(request.getParameter("onum"));
   String dstate = request.getParameter("dstate");
   DB.loadConnect();
   DB.updatedstate(onum, dstate);
%>
<script>
location.href="adminorder.jsp"</script>
</body>
</html>