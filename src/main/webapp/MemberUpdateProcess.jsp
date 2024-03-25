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
	PreparedStatement pstmt=null;
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String gender=request.getParameter("gender");
	String password=request.getParameter("password");
	String email=request.getParameter("email")+"@"+request.getParameter("email2");
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String address=request.getParameter("address");
	
	String sql="update member0312 set name=?,gender=?,password=?,email=?,phone=?,address=? where id=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, gender);
	pstmt.setString(3, password);
	pstmt.setString(4, email);
	pstmt.setString(5, phone);
	pstmt.setString(6, address);
	pstmt.setString(7,id);
	
	pstmt.executeUpdate();
%>
<Script>
	alert("회원 수정 성공");
	location.href="memberList.jsp";
</Script>
</body>
</html>