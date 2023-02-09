<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*,java.util.* , university.*"%>
<!DOCTYPE html>
<html>
<head>

<title>리뷰 작성 </title>
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
   <h3 align=center>리뷰 작성</h3>
   </td></tr>
   <tr>
   <td>
   
   <form action="reviewAction.jsp" method="POST">
   <%while(rs.next()){ %>
   <p align=center>상품 이름 : <input type=text name="pdname" value="<%=rs.getString("pdname") %>" readonly="readonly" >
   <p align=center>별점 : <input type=text name="stargrade">
   <p align=center>리뷰 내용 : <textarea align=center rows="10" cols="30" name="content" placeholder="리뷰 내용을 입력해주세요....."></textarea>
   <p align=center>아이디 : <input type=text name="id" value="<%=rs.getString("id") %>" readonly="readonly">
   
   <p align=center><input type="submit" value="리뷰 제출">
	<%} %>
   </form>
     
   </td></tr>
    
   </table>

</body></html>