<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h1>주문 목록</h1>
<form>
<table border="1" id="orli">
<tr>
<th>no</th>
<th>주문일자</th>
<th>주문자 성명</th>
<th>상품번호</th>
<th>상품명</th>
<th>단가</th>
<th>주문수량</th>
<th width="25%">주문자주소</th>
<th>구분</th>
</tr>
<%@include file="DBConn.jsp" %>
<%
PreparedStatement pstmt=null;
ResultSet rs=null;

try{
	String sql="select to_char(orderdate,'yyyy-mm-dd'),ordername,order0312.productid,product0312.name,to_char(product0312.unitprice,'999,999,999'),orderQty,orderAddress from order0312,product0312 where order0312.productid=product0312.productid";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	int no=0;
	while(rs.next()){
		String orderdate=rs.getString(1);
		String ordername=rs.getString(2);
		String productid=rs.getString(3);
		String name=rs.getString(4);
		String unitprice=rs.getString(5);
		String orderqty=rs.getString(6);
		String orderaddress=rs.getString(7);
		no++;

%>
<tr>
<td><%=no %></td>
<td><%=orderdate %></td>
<td><%=ordername %></td>
<td><%=productid %></td>
<td><%=name %></td>
<td><%=unitprice %></td>
<td><%=orderqty %></td>
<td><%=orderaddress %></td>
<td>
<a href="orderUpdate.jsp?orderdate=<%=orderdate%>">수정</a> / <a href="orderDelete.jsp?orderdate=<%=orderdate%>">삭제</a>
</td>
</tr>
<%
	}
}catch(Exception e){
	e.printStackTrace();
}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>