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
	ResultSet rs=null;
	String orderdate=request.getParameter("orderdate");
	//String productid=request.getParameter("productid");
	//int orderqty=Integer.parseInt(request.getParameter("orderqty"));
	String productid="";
	int orderqty=0;
	try{
	String sql="select productid,orderqty from order0312 where orderdate=? ";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,orderdate);
	rs=pstmt.executeQuery();
	if(rs.next()){
		productid=rs.getString(1);
		orderqty=rs.getInt(2);
	}
	 sql="delete from order0312 where orderdate=?" ;
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,orderdate);
	pstmt.executeUpdate();
	//재고 수량 처리
	sql="update product0312 set unitsinstock=unitsinstock+? where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setInt(1,orderqty);
	pstmt.setString(2,productid);
	pstmt.executeUpdate();
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
alert("삭제 완료");
location.href="orderList.jsp"
</script>
</body>
</html>