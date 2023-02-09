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
			<td>사진</td>
			<td>상품명</td>
			<td>가격</td>
			<td>재고</td>
			<td>리뷰</td>	

		  <%
		DB.loadConnect();
		ResultSet rs = DB.selectAllProduct();
		
		while(rs.next()){
		%><tr>
		<td><a href="detail.jsp?photo='<%=rs.getString(1)%>'"><img src=<%=rs.getString(1)%> width="300" height="210"> </a></td>
		<td><%=rs.getString(2)%></td>
		<td><%=rs.getInt(3)%></a></td>
		<td><%=rs.getInt(4)%></td>
		<td><a href="reviewcreate.jsp?photo=<%=rs.getString(1)%>"><button>리뷰</button></a></td>	
		</tr>
		<%
		}
		%>
		</table>
</body>
</html>