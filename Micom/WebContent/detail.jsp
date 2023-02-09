<%@ page contentType="text/html;charset=utf-8"
         import="java.sql.*,java.util.* ,university.*"  %>
<% request.setCharacterEncoding("utf-8");
 String photo = (String) request.getParameter("photo");%>

<HTML> 
    <HEAD><TITLE>MySQL+JSP Test</TITLE></HEAD>

    <BODY> 
 <table border="1" style="float:left;">
      <tr>
          <td><img src=<%=photo%> width="300" height="290"></td>
          <table border="1" style="float:left; height: 300px; width: 200px;">
             <tr align="center">   
               <td>상품명</td>
            </tr>
            <tr align="center">   
               <td>가격</td>
            </tr>
            <tr align="center">   
               <td>재고</td>
            </tr>
            <tr align="center">   
               <td>조리시간</td>
            </tr>
           <tr align="center">   
               <td>인분</td>
            </tr>
            <tr align="center">   
               <td>할인율</td>
            </tr>
            <tr align="center">   
               <td>주문수</td>
            </tr>
            </table>
            <%  
            
            String pdname = "0";
         
            DB.loadConnect();
            ResultSet rs = DB.selectPhoto(photo);
            
            while(rs.next()){
            %>
             <table border="1" style=" height: 300px; width: 200px;">
                <tr align="center">
                   <td> <%=pdname = rs.getString(2)%></td>
                </tr>
                <tr align="center">
                   <td><%=rs.getInt(3)%></td>
                </tr>
                <tr align="center">
                   <td><%=rs.getInt(4)%></td>
                </tr>
                <tr align="center">
                   <td><%=rs.getString(5)%></td>
                </tr>
                <tr align="center">
                   <td><%=rs.getString(6)%></td>
                </tr>
                <tr align="center">
                   <td><%=rs.getInt(7)%></td>
                </tr>
                <tr align="center">
                   <td><%=rs.getInt(8)%></td>
                </tr>
             </table>
             <%
             }
             %>
             <form action="order.jsp?pdname=<%=pdname%>" method="POST">
             <label for="quantity">주문 수량: </label>         
             <input type="number" name="quantity" min="1" max="10" step="1" value="1">
             <input type="submit" value="주문하기">
             <a href="buy.jsp">상품목록</a>
             </form>
                      
     </table> 
     </BODY>
</HTML>
