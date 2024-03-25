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
	PreparedStatement pstmt=null;
	String productid=request.getParameter("productid");
	String sql="delete from product0312 where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,productid);
	pstmt.executeUpdate();
%>
<Script>
	alert("제품 삭제 성공");
	location.href="productSelect.jsp"
</Script>
</body>
</html>