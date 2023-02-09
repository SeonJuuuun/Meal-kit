<%@ page contentType="text/html;charset=utf-8"
         import="java.sql.*,java.util.* , university.*" %>


<!DOCTYPE>
<html>
<head>
    <title>회원정보 수정</title>
</head>
<style type="text/css">
 body{
           margin:0 auto;
        }
        body, table, div, p ,span{font-family:'Nanum Gothic';} 
        body, table, div, p ,span{font-family:'Noto Sans KR';}
        
        a{
            text-decoration: none;
            color:#333;
        }
       #con{
            height: 100vh;
            background-color:#f5f1ee;
            background-image:url("img/bg.jpg");
            background-position: center center;
            background-repeat: no-repeat;
            background-size:cover;
            padding:100;
             top: 100px;
        }
        #login{
            width:600px;
            height: 600px;
            margin:0 auto;
             position: relative; 
           
        }
        #login_form{
             text-align:center; 
            border-radius: 10px;
            padding:30px 50px;
            background: #fff;
            text-align: center;
            position: absolute;
            top:50%;
            left:50%;
            transform: translate(-50%, -50%);
        }
        .login{
            font-size:25px;
            font-weight: 900;
            color:#333;
        }

        .size{
            width:300px;
            height:30px;
            padding-left:10px;
            background-color: #f4f4f4;
            /margin-left:10px; 
            border:none;
            border-radius: 5px;
        }

       
        hr{
            margin-top:20px;
            background:#eee;
            
        }
        .btn{
            width:110px;
            height: 40px;
            font-size:15px;
            background-color: #8aa1a1;
            color:#fff;
            border:none;
            cursor: pointer;
            border-radius: 5px;
        }
</style>
<body>

   <table border="1" style="text-align: left; font-size:12px; class="size" color:#666">
		<tr>
			<td>사진</td>
			<td>상품명</td>
			<td>가격</td>
			<td>제고</td>
			<td>조리시간</td>
			<td>인분</td>
			<td>할인율</td>
			<td>주문수</td>
			<td>수정</td>

		  <%
		request.setCharacterEncoding("utf-8");
		DB.loadConnect();
		ResultSet rs = DB.selectadminproduct();
		String pdname="0";
		
		while(rs.next()){
		%><tr>
		<td><img src=<%=rs.getString(1)%> width="300" height="210"></td>
		<td><%=pdname = rs.getString(2)%></td>
		<td><%=rs.getInt(3)%></td>
		<td><%=rs.getInt(4)%></td>
		<td><%=rs.getString(5)%></td>
		<td><%=rs.getString(6)%></td>
		<td><%=rs.getInt(7)%></td>
		<td><%=rs.getInt(8)%></td>
		<td><form action="proupdateform.jsp?pdname=<%=pdname%>" method="POST">
		<input type="submit" value="수정하기">
		</form></td>	
		</tr>
		<%
		}
		%>
		</table>

    </form>
   
       <hr>
       </div>
    
    </div>
   </div>
</body>
</html>