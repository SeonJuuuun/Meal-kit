<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*,java.util.* , university.*"%>
<!DOCTYPE html>
<html>
<head>

<title>취소관리</title>
</head>
<body>
	<%
		request.setCharacterEncoding("euc-kr");
		DB.loadConnect();
		ResultSet rs = DB.selectCancel();
		ResultSet rs1 = DB.selectCancel();
		int onum;
		if (rs1.next()) {
			
	%>
	<table border=1>
		<tr>
			<td>주문 번호</td>
			<td>취소 날짜</td>
			<td>아이디</td>
			<td>상품명</td>
			<td>주문 수량</td>
		</tr>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=onum = rs.getInt(1)%></td>
			<td><%=rs.getDate(2)%></td>
			<td><%=rs.getString(3)%></td>
			<td><%=rs.getString(4)%></td>
			<td><%=rs.getInt(5)%></td>
			<td><form action="admincancelact.jsp?onum=<%=onum%>"
					method="POST">
					<button>취소 확인</button>
				</form></td>
		</tr>

		<%
			}
		%>
	</table>
	<%
		} else {
	%>
	<h3>취소내역이 존재하지 않습니다.</h3>
	<%
		}
	%>


</body>
</html>