<%@page import="org.apache.tomcat.jakartaee.commons.io.Charsets"%>
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
	String id=request.getParameter("id");
	String sql="delete from member0312 where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.executeUpdate();
%>
<Script>
	alert("회원 삭제 성공");
	location.href="memberList.jsp"
</Script>
</body>
</html>