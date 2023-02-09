<%@ page language="java" contentType="text/html; charset=EUC-KR"
    import="java.sql.*,java.time.*, university.*" pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>¸®ºä ÀÛ¼º »ğÀÔ</title>
</head>
<body>
<%
   request.setCharacterEncoding("euc-kr");

   Review review = new Review();
   //review.setReviewNum("0");
   review.setStarGrade(request.getParameter("stargrade"));
   review.setPdname(request.getParameter("pdname"));
   review.setContent(request.getParameter("content"));
   review.setId(request.getParameter("id"));
   
   DB.loadConnect();
   ResultSet rs = DB.insertReview(review);

%>

<script>location.href="main.jsp"</script>
</body>
</html>