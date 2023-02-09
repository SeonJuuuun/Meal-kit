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
		<td>주문 번호</td>
		<td>주문 날짜</td>
		<td>상품</td>
		<td>주문 개수</td>
		<td>상태</td>
		<td>취소</td>
		</tr>
			<%
	while(rs.next()){
	%><tr>
		<td><%=rs.getInt("onum")%></td>
		<td><%=rs.getString("odate")%></td>
		<td><%=rs.getString("pdname")%></td>
		<td><%=rs.getInt("ordercount")%></td>	
		<td><%=rs.getString("dstate")%></td>
		<td><a href=""></a><input type="button" value="주문취소"></a></td>
		</tr>
		<%
		}
		%>
	</table>

</body>
</html>