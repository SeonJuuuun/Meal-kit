<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*,java.util.* , university.*"%>
<!DOCTYPE html>
<html>
<head>

<title>��Ұ���</title>
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
			<td>�ֹ� ��ȣ</td>
			<td>��� ��¥</td>
			<td>���̵�</td>
			<td>��ǰ��</td>
			<td>�ֹ� ����</td>
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
					<button>��� Ȯ��</button>
				</form></td>
		</tr>

		<%
			}
		%>
	</table>
	<%
		} else {
	%>
	<h3>��ҳ����� �������� �ʽ��ϴ�.</h3>
	<%
		}
	%>


</body>
</html>