<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*,java.util.* , university.*"%>

<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		String id = (String) session.getAttribute("login");

		DB.loadConnect();
		ResultSet rs = DB.selectcusordertable(id);
	%>
	<table border=1>
	<tr>
		<td>�ֹ� ��ȣ</td>
		<td>�ֹ� ��¥</td>
		<td>��ǰ</td>
		<td>�ֹ� ����</td>
		<td>����</td>
		<td>���</td>
		</tr>
			<%
	while(rs.next()){
	%><tr>
		<td><%=rs.getInt("onum")%></td>
		<td><%=rs.getString("odate")%></td>
		<td><%=rs.getString("pdname")%></td>
		<td><%=rs.getInt("ordercount")%></td>	
		<td><%=rs.getString("dstate")%></td>
		<td><a href=""></a><input type="button" value="�ֹ����"></a></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>