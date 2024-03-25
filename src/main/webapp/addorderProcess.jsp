<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String orderdate=request.getParameter("orderdate");
	String ordername=request.getParameter("ordername");
	String productid=request.getParameter("productid");
	String unitprice=request.getParameter("unitprice");
	String orderqty=request.getParameter("orderqty");
	String orderaddress=request.getParameter("orderaddress");
	String sql="insert into order0312 values(?,?,?,?,?,?)";
	PreparedStatement pstmt=null;
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,orderdate);
	pstmt.setString(2,ordername);
	pstmt.setString(3,productid);
	pstmt.setString(4,unitprice);
	pstmt.setString(5,orderqty);
	pstmt.setString(6,orderaddress);
	pstmt.executeUpdate();
	
	sql="update product0312 set unitsinstock=unitsinstock - ? where productid=? ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,Integer.parseInt(orderqty));
	pstmt.setString(2,productid);
	pstmt.executeUpdate();
%>
<script>
alert("주문 정보를 저장합니다.")
location.href="orderList.jsp"
</script>

날짜 : <%=orderdate %><br>
성명:<%=ordername %><br>
아이디:<%=productid %><br>
단가:<%=unitprice %><br>
수량:<%=orderqty %><br>
주소:<%=orderaddress %><br>
</body>
</html>