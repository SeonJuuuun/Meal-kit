<%@ page contentType="text/html;charset=euc-kr"
	import="java.sql.*,java.util.* ,university.*" %>
	
<HTML>
	<HEAD><TITLE>상품추가</TITLE></HEAD>
	
	<BODY>
	
		<%
			request.setCharacterEncoding("euc-kr");
				String pdname = request.getParameter("pdname");
				Product pro = new Product();
				pro.setPhoto(request.getParameter("photo"));
				pro.setPdname(request.getParameter("pdname"));
				pro.setPrice(request.getParameter("price"));
				pro.setStock(request.getParameter("stock"));
				pro.setTime(request.getParameter("time"));
				pro.setServing(request.getParameter("serving"));
				pro.setSale(request.getParameter("sale"));
				pro.setOrdercount(request.getParameter("ordercount"));
				
				
			DB.loadConnect();
				ResultSet rs = DB.insertProduct(pro);
				
				if(rs == null){
								out.println("<script language=javascript> alert('상품이 추가되었습니다.'); window.history.go(-1); </script>");
								%>
								<script>location.href="Product.html"</script>
								<%
								return;
				}
				else{
					out.println("<script language=javascript> alert('중복된 상품입니다.'); window.history.go(-1); </script>");
					}
					
					%>
	</BODY>
</HTML>