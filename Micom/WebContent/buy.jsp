<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* ,university.*"  %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>

<table border="1">
		<tr>
			<td>����</td>
			<td>��ǰ��</td>
			<td>����</td>
			<td>���</td>
			<td>����</td>	

		  <%
		DB.loadConnect();
		ResultSet rs = DB.selectAllProduct();
		
		while(rs.next()){
		%><tr>
		<td><a href="detail.jsp?photo='<%=rs.getString(1)%>'"><img src=<%=rs.getString(1)%> width="300" height="210"> </a></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getInt(3)%></a></td>
		<td><%=rs.getInt(4)%></td>
		<td><a href="reviewcreate.jsp?photo=<%=rs.getString(1)%>"><button>����</button></a></td>	
		</tr>
		<%
		}
		%>
		</table>
</body>
</html>