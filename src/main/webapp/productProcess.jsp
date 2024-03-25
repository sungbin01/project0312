<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String productid=request.getParameter("productid");
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String category=request.getParameter("category");
	String manufacturer=request.getParameter("manufacturer");
	String unitsinstock=request.getParameter("unitsinstock");
	String condition=request.getParameter("condition");
	
	String sql="insert into product0312 values(?,?,?,?,?,?,?,?)";
	PreparedStatement pstmt=null;
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,productid);
	pstmt.setString(2, name);
	pstmt.setString(3, unitprice);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setString(7, unitsinstock);
	pstmt.setString(8,condition);
	pstmt.executeUpdate();
%>
<script>
alert("완료되었습니다.")
location.href="productSelect.jsp";
</script>
아이디 : <%=productid %><br>
성명:<%=name %><br>
비밀번호:<%=unitprice %><br>
비밀번호 확인:<%=description %><br>
성별:<%=category %><br>
이메일:<%=manufacturer %><br>
연락처:<%=unitsinstock %><br>
주소:<%=condition %><br>
</body>
</html>