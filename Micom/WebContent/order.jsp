<%@ page contentType="text/html; charset=euc-kr"
    import="java.sql.*,java.time.*,java.util.*,university.*"%>
<html>
<head> <title>상품 주문</title> </head>
<body>
   
   <%
   // getParameter 로 받아오기 (전에 있던 값들)
   request.setCharacterEncoding("euc-kr");
   
   int quantity = Integer.parseInt(request.getParameter("quantity"));
   String pdname = request.getParameter("pdname");
   pdname = new String(pdname.getBytes("ISO-8859-1"), "utf-8");
   String id = (String)session.getAttribute("login");
   LocalDateTime now = LocalDateTime.now();
   LocalDateTime ldt = LocalDateTime.of(now.getYear(),
		   now.getMonth(), now.getDayOfMonth(), now.getHour(), now.getMinute(), 0);
   
   System.out.println(pdname);
   
  
   corder corder = new corder();
   
   corder.setOdate(ldt);
   corder.setId(id);
   corder.setPdname(pdname);
   corder.setOrdercount(quantity);
   corder.setDstate("준비중");
   
   DB.loadConnect();
   ResultSet rs = DB.insertCorder(corder);
   rs = DB.selectCorder();
   rs.last();
   int ordercount = rs.getInt(5);
   Product product = new Product();
   DB.MinusStock(pdname, ordercount);
   DB.Plusordercount(pdname, ordercount);
   if(rs == null){
      out.println("<script language=javascript> alert('주문에 실패했습니다.'); window.history.go(-1); </script>");
      
      return;
}
else{
out.println("<script language=javascript> alert('주문이 완료되었습니다.'); window.history.go(-1); </script>");
%><script>location.href="buy.jsp"</script>
<%
}
   %>
   
   
</body>
</html>