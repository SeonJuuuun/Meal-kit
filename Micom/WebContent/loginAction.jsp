<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* , university.*" %>
         
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>loginAction</title>
</head>
<body>
   <%
      DB.loadConnect();
      DB db= new DB();
      String id=request.getParameter("id");
      int result = db.login(request.getParameter("id"),request.getParameter("pw"));
      if(request.getParameter("id")==""||request.getParameter("pw")=="")
    	  out.println("<script language=javascript> alert('�Է����� �����̽��ϴ�.'); window.history.go(-1);</script>");
      if(result == 1){
    	  out.println("<script language=javascript> alert('�α��� ����');</script>");  
    	  session.setAttribute("login",id);
    	  %><script> location.href="main.jsp" </script><% 
      }else if(result == 2){
    	  out.println("<script language=javascript> alert('�α��� ����');</script>");  
    	  session.setAttribute("login",id);
    	  %><script> location.href="adminmain.jsp" </script><% 
      }
      else if(result == 0){
    	  out.println("<script language=javascript> alert('��й�ȣ�� Ʋ�Ƚ��ϴ�.'); window.history.go(-1);</script>");
      }else if(result == -1){
     
         out.println("<script language=javascript> alert('�������� �ʴ� ���̵��Դϴ�.'); window.history.go(-1);</script>");
      }else if(result == -2){
    	  out.println("<script language=javascript> alert('�����ͺ��̽� �����Դϴ�.'); window.history.go(-1);</script>");
      }
   %>
</body>
</html>