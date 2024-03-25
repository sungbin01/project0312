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
	String custid=request.getParameter("custid");
	String sql="delete from customer0305 where custid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,custid);
	pstmt.executeUpdate();
%>
<Script>
	alert("회원 삭제 성공");
	location.href="customerSelcet.jsp"
</Script>
</body>
</html>