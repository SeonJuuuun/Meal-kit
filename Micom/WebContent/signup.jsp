<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
         
<html>
<head><title> 회원가입</title>

</head>
<body>
<%  
   	        request.setCharacterEncoding("euc-kr");

			String id=request.getParameter("id");
			Customer cus =new Customer();
			cus.setName(request.getParameter("name"));
			cus.setId(request.getParameter("id"));
			cus.setPw(request.getParameter("pw"));
			cus.setAddress(request.getParameter("address"));
			cus.setPhnumber(request.getParameter("phnumber"));
			cus.setEmail(request.getParameter("email"));
			cus.setDate(request.getParameter("date"));
			if(cus.getName()==""||cus.getId()==""||cus.getPw()==""||cus.getAddress()==""||cus.getPhnumber()==""||cus.getEmail()==""||cus.getDate()==""){
				out.println("<script language=javascript> alert('입력하지 않았습니다.'); window.history.go(-1); </script>");
				return ;
			}
			DB.loadConnect();
			ResultSet rs=DB.insertCustomer(cus);
			
	        if (rs == null) {
	   	 		out.println("<script language=javascript> alert('회원가입이 완료되었습니다.');</script>");
	   	 		%>
	   	 		<script>location.href="loginForm.html"</script>
	   	 		<%
	   	 		return;
	        }
	        else{	       
	        	out.println("<script language=javascript> alert('아이디가 중복됩니다.'); window.history.go(-1);</script>");
	        }
       %>   
</body>
</html>