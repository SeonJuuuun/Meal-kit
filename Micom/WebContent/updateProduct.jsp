<%@ page contentType="text/html;charset=euc-kr"
         import="java.sql.*,java.util.* ,university.*"  %>
<!DOCTYPE>
<html>
<head>
    <title>ȸ������ ����</title>
</head>

<body>
    <% request.setCharacterEncoding("euc-kr");%>
   
    <jsp:useBean id="pro" class="university.Product">
        <jsp:setProperty name="pro" property="*" />
    </jsp:useBean>
   
    <%
    
    String pdname = (String)session.getAttribute("pdname");
    pro.setPdname(pdname);
    DB.loadConnect();
    ResultSet rs = DB.findSale(pdname);
    int basic=0;
    while(rs.next()){
    basic = rs.getInt(1);
    }
    DB.updateProduct(pro);
    int sale = Integer.parseInt(request.getParameter("sale"));
    if(basic > sale)
    	DB.DownSaleproduct(pdname,basic,sale);
    else if(basic < sale)
    	DB.UpSaleproduct(pdname,basic,sale);
     %>
     <script>
     alert('���� �����Ǿ����ϴ�.')
     location.href="adminproduct.jsp"
     </script>
</body>
</html>