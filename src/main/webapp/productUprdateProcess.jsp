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
	String productid=request.getParameter("productid");
	String name=request.getParameter("name");
	String unitprice=request.getParameter("unitprice");
	String description=request.getParameter("description");
	String category=request.getParameter("category");
	String manufacturer=request.getParameter("manufacturer");
	String unitsinstock=request.getParameter("unitsinstock");
	String condition=request.getParameter("condition");
	
	String sql="update product0312 set name=?,unitprice=?,description=?,category=?,manufacturer=?,unitsinstock=?,condition=? where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, name);
	pstmt.setString(2, unitprice);
	pstmt.setString(3, description);
	pstmt.setString(4, category);
	pstmt.setString(5, manufacturer);
	pstmt.setString(6, unitsinstock);
	pstmt.setString(7,condition);
	pstmt.setString(8,productid);
	
	pstmt.executeUpdate();
%>
<Script>
	alert("수정이 완료 되었습니다!");
	location.href="productSelect.jsp";
</Script>
</body>
</html>