<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*,java.util.* , university.*"%>
<!DOCTYPE html>
<html>
<head>

<title>���� �ۼ� </title>
</head>
<body>
	<%
	   request.setCharacterEncoding("euc-kr");
	 DB.loadConnect();
	 int onum = Integer.parseInt(request.getParameter("onum"));
	 ResultSet rs =DB.selectCorder(onum);
	%>
   <p>
   <table align=center border = 1 cellpadding=20>
   <tr>
   <td>
   <h3 align=center>���� �ۼ�</h3>
   </td></tr>
   <tr>
   <td>
   
   <form action="reviewAction.jsp" method="POST">
   <%while(rs.next()){ %>
   <p align=center>��ǰ �̸� : <input type=text name="pdname" value="<%=rs.getString("pdname") %>" readonly="readonly" >
   <p align=center>���� : <input type=text name="stargrade">
   <p align=center>���� ���� : <textarea align=center rows="10" cols="30" name="content" placeholder="���� ������ �Է����ּ���....."></textarea>
   <p align=center>���̵� : <input type=text name="id" value="<%=rs.getString("id") %>" readonly="readonly">
   
   <p align=center><input type="submit" value="���� ����">
	<%} %>
   </form>
     
   </td></tr>
    
   </table>

</body></html>