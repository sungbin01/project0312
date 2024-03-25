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
<section >
<h2>상품 목록</h2>
<form action="addProduct.jsp" name="form">
<table border=1 id="list2">
<tr>
<th>상품코드</th>
<th>상품명</th>
<th>단가</th>
<th>상세정보</th>
<th>제조사</th>
<th>분류</th>
<th>재고수</th>
<th>상태</th>
<th>구분</th>
</tr>
<%@ include file="DBConn.jsp" %>
<%
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from product0312";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String productid=rs.getString("productid");
		String name=rs.getString("name");
		String unitprice=rs.getString("unitprice");
		String description=rs.getString("description");
		String category=rs.getString("category");
		String manufacturer=rs.getString("manufacturer");
		String unitsinstock=rs.getString("unitsinstock");
		String condition=rs.getString("condition");

%>
<tr>
<td><a href="productUpdate.jsp?productid=<%=productid%>"><%=productid%></a></td>
<td><%=name %></td>
<td><%=unitprice%></td>
<td><%=description %></td>
<td><%=category %></td>
<td><%=manufacturer %></td>
<td><%=unitsinstock%></td>
<td><%=condition %></td>
<td>

		<a href="productDelete.jsp?productid=<%=productid %>" onclick="if(!confirm('정말로 삭제하겠습니까?'))return false;">삭제</a></td>
</tr>
<%
	}
%>
</table>
<div id="d1">
<input type="button" value="작성" id="addprobu" onclick="check()">
</div>
</form>
</section>
<%@ include file="footer.jsp" %>
<script>
function check(){
	alert("상품 등록을 하시겠습니까?")
	document.form.submit();
	
}
</script>
</body>
</html>