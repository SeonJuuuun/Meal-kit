<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import = "university.*" %>
<!DOCTYPE>
<html>
<head>
    <title>ȸ������ ����</title>
</head>

<body>
    <% request.setCharacterEncoding("euc-kr");%>
   
    <jsp:useBean id="dto" class="university.Customer">
        <jsp:setProperty name="dto" property="*" />
    </jsp:useBean>
   
    <%
    String id = (String)session.getAttribute("login");
    dto.setId(id);

   
    DB.updateMember(dto);
    
     %>
     <script>
     alert('���� �����Ǿ����ϴ�.')
     </script>
</body>
</html>