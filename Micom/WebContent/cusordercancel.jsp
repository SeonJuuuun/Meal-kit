<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* ,java.time.*,university.*"  %>
<!DOCTYPE html>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
<% 
   request.setCharacterEncoding("euc-kr");
   int onum = Integer.parseInt(request.getParameter("onum"));
   DB.loadConnect();
   ResultSet rs =DB.selectCorder(onum);
   Cancel cancel =new Cancel();
   LocalDateTime now = LocalDateTime.now();
   LocalDateTime ldt = LocalDateTime.of(now.getYear(),
		   now.getMonth(), now.getDayOfMonth(), now.getHour(), now.getMinute(), 0);
   String state="";
   while(rs.next()){
	   cancel.setOnum(rs.getInt("onum"));
		cancel.setId(rs.getString("id"));
		cancel.setPdname(rs.getString("pdname"));
		cancel.setOrdercount(rs.getInt("ordercount"));
		cancel.setDstate(rs.getString("dstate"));
	   state=rs.getString("dstate");
   }
   cancel.setDate(ldt);
   System.out.println(state);
	   
 
   if(state.equals("�غ���")){
   DB.updateOrder(onum);
   
   DB.insertCancel(cancel);
   
   out.println("<script language=javascript> alert('��ҽ�û�� �Ϸ�Ǿ����ϴ�.'); </script>");
   
%>
<script>location.href="cusorder.jsp"</script>
<%}else{
	out.println("<script language=javascript> alert('����� �� �����ϴ�.'); </script>");
	
	%>
	<script>location.href="cusorder.jsp"</script>
	<%} %>
</body>
</html>