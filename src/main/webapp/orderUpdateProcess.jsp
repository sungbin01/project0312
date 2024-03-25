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
	ResultSet rs=null;
	String orderdate=request.getParameter("orderdate");
	String ordername=request.getParameter("ordername");
	String productid=request.getParameter("productid");
	String unitprice=request.getParameter("unitprice");
	String orderqty=request.getParameter("orderqty");
	String orderaddress=request.getParameter("orderaddress");
	int newqty=Integer.parseInt(orderqty);
	int oldqty=0;
	
	try{
	String sql="select orderqty from order0312 where orderdate=? and ordername=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,orderdate);
	pstmt.setString(2,ordername);
	rs=pstmt.executeQuery();
	if(rs.next()){
		oldqty=rs.getInt(1);
	}
	int cqty=0;
	cqty=newqty-oldqty;
	System.out.println("newqty: "+newqty+"  oldqty: "+oldqty);
	 sql="update order0312 set productid=?,unitprice=?,orderqty=?,orderaddress=? where orderdate=? and ordername=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productid);
	pstmt.setString(2, unitprice);
	pstmt.setString(3, orderqty);
	pstmt.setString(4,  orderaddress);
	pstmt.setString(5, orderdate);
	pstmt.setString(6, ordername);
	pstmt.executeUpdate();
	
	
	if(cqty !=0){
		sql="update product0312 set unitsinstock=unitsinstock-? where productid=?";
		pstmt=conn.prepareStatement(sql);
		pstmt.setInt(1,cqty);
		pstmt.setString(2,productid);
		pstmt.executeUpdate();
	}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<Script>
	alert("주문정보 수정 성공");
	location.href="orderList.jsp";
</Script>
</body>
</html>