<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,university.*"  %>
 
<HTML> 
    <HEAD><TITLE>�߰�</TITLE></HEAD>

    <BODY>
    		
         <%  
         	request.setCharacterEncoding("euc-kr");
			String igname = request.getParameter("igname"); //�ߺ� üũ
			Ingredient ig = new Ingredient();
			ig.setIgname(request.getParameter("igname"));
			ig.setPrice(request.getParameter("price"));
			ig.setGram(request.getParameter("gram"));
			ig.setKal(request.getParameter("kal"));
			ig.setCountry(request.getParameter("country"));
			
			if(ig.getIgname() == "" || ig.getPrice() == "" || ig.getGram() == "" || ig.getKal() == "" || ig.getCountry() == ""){
	            out.println("<script language=javascript> alert('�Է����� �ʾҽ��ϴ�.'); window.history.go(-1); </script>");
	            return ;
	         }
			
            DB.loadConnect();
	        ResultSet rs = DB.insertIngredient(ig);
	        
	        
	        if (rs == null) {
	   	 		out.println("<script language=javascript> alert('��ᰡ �߰��Ǿ����ϴ�.'); window.history.go(-1); </script>");
	   	 		%>
	   	 		<script>location.href="Ingredients.html"</script>
	   	 		<%
	   	 		return;
	        }
	        else{	       
	        	out.println("<script language=javascript> alert('�ߺ��� ��ǰ�Դϴ�.'); window.history.go(-1);</script>");
	        }
			
	        %> 
	        	        
	       
        
     </BODY>
</HTML>