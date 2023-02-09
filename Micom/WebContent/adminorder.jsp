<%@ page contentType="text/html;charset=euc-kr"
   import="java.sql.*,java.util.* ,university.*"%>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
   <table border="1">
      <tr>
         <td>주문번호</td>
         <td>주문시간</td>
         <td>닉네임</td>
         <td>상품이름</td>
         <td>주문수량</td>
         <td>주문상태</td>

         <%
         request.setCharacterEncoding("euc-kr");
            DB.loadConnect();
            ResultSet rs = DB.selectordertable();
            int onum = 0;
            while (rs.next()) {	
               if (rs.getString(6).equals("준비중") || rs.getString(6).equals("배송완료") || rs.getString(6).equals("배송중")) {
         %>
         
      <tr>

         <td><%=onum = rs.getInt(1)%></td>
         <td><%=rs.getDate(2)%><%=rs.getTime(2)%></td>
         <td><%=rs.getString(3)%></a></td>
         <td><%=rs.getString(4)%></td>
         <td><%=rs.getInt(5)%></td>
         
         <td><form action="adminorderupdate.jsp?onum=<%=onum%>" method="POST"><select name="dstate">
         
               <option value="<%=rs.getString(6)%>"><%=rs.getString(6)%></option>
               <option value="준비중">준비중</option>
               <option value="배송중">배송중</option>
               <option value="배송완료">배송완료</option>
         </select><input type="submit" value="수정"></form></td>
         
      </tr>
      <%
         }
         }
      %>
      
   </table>
   
</body>
</html>