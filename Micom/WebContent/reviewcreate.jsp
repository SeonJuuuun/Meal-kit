<%@ page contentType="text/html;charset=utf-8"
         import="java.sql.*,java.util.* ,university.*"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>리뷰 보기</title>
</head>
<body>
   <table border="1">
      <tr>
         <td>리뷰번호</td>
         <td>별점</td>
         <td>식품 이름</td>
         <td>id</td>
         <td>리뷰 내용</td>

   <%
   request.setCharacterEncoding("utf-8");
   String photo = request.getParameter("photo");
   String pdname="";
   ResultSet rs = DB.protoreview(photo);
   while(rs.next()) {
	         pdname = rs.getString(1);
	         
	      }
	      
   DB.loadConnect();
   rs = DB.selectReviewProduct(pdname);
   while(rs.next()) {
      %><tr>
         <td><%=rs.getInt(1)%></td>
         <td><%=rs.getInt(2)%></td>
         <td><%=rs.getString(3)%></td>
         <td><%=rs.getString(5)%></td>
         <td><%=rs.getString(4)%></td>
        </tr>
      <%
      }
      %>
   </table>
</body>
</html>