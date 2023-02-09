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
    	  out.println("<script language=javascript> alert('입력하지 않으셨습니다.'); window.history.go(-1);</script>");
      if(result == 1){
    	  out.println("<script language=javascript> alert('로그인 성공');</script>");  
    	  session.setAttribute("login",id);
    	  %><script> location.href="main.jsp" </script><% 
      }else if(result == 2){
    	  out.println("<script language=javascript> alert('로그인 성공');</script>");  
    	  session.setAttribute("login",id);
    	  %><script> location.href="adminmain.jsp" </script><% 
      }
      else if(result == 0){
    	  out.println("<script language=javascript> alert('비밀번호가 틀렸습니다.'); window.history.go(-1);</script>");
      }else if(result == -1){
     
         out.println("<script language=javascript> alert('존재하지 않는 아이디입니다.'); window.history.go(-1);</script>");
      }else if(result == -2){
    	  out.println("<script language=javascript> alert('데이터베이스 오류입니다.'); window.history.go(-1);</script>");
      }
   %>
</body>
</html>