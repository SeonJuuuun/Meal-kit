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
         <td>�ֹ���ȣ</td>
         <td>�ֹ��ð�</td>
         <td>�г���</td>
         <td>��ǰ�̸�</td>
         <td>�ֹ�����</td>
         <td>�ֹ�����</td>

         <%
         request.setCharacterEncoding("euc-kr");
            DB.loadConnect();
            ResultSet rs = DB.selectordertable();
            int onum = 0;
            while (rs.next()) {	
               if (rs.getString(6).equals("�غ���") || rs.getString(6).equals("��ۿϷ�") || rs.getString(6).equals("�����")) {
         %>
         
      <tr>

         <td><%=onum = rs.getInt(1)%></td>
         <td><%=rs.getDate(2)%><%=rs.getTime(2)%></td>
         <td><%=rs.getString(3)%></a></td>
         <td><%=rs.getString(4)%></td>
         <td><%=rs.getInt(5)%></td>
         
         <td><form action="adminorderupdate.jsp?onum=<%=onum%>" method="POST"><select name="dstate">
         
               <option value="<%=rs.getString(6)%>"><%=rs.getString(6)%></option>
               <option value="�غ���">�غ���</option>
               <option value="�����">�����</option>
               <option value="��ۿϷ�">��ۿϷ�</option>
         </select><input type="submit" value="����"></form></td>
         
      </tr>
      <%
         }
         }
      %>
      
   </table>
   
</body>
</html>