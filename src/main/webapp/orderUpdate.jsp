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
<%@ include file="DBConn.jsp" %>
<section>
<%
String orderdate=request.getParameter("orderdate");
PreparedStatement pstmt=null;
ResultSet rs=null;

int price=0;
int pqty=0,total=0;
int newQty=0;
if(request.getParameter("orderqty")==null){
	newQty=0;
}else{
	newQty=Integer.parseInt(request.getParameter("orderqty"));
}
String sql="select ordername,order0312.productid,product0312.name,order0312.unitprice,orderqty,orderaddress from order0312,product0312 where order0312.orderdate=? and order0312.productid=product0312.productid";
pstmt=conn.prepareStatement(sql);
pstmt.setString(1,orderdate);
rs=pstmt.executeQuery();
if(rs.next()){
	String ordername=rs.getString("ordername");
	String productid=rs.getString(2);
	String name=rs.getString(3);
	int unitprice=rs.getInt(4);
	int orderqty=rs.getInt("orderqty");
	String orderaddress=rs.getString("orderaddress");
	System.out.println("pqty : "+newQty+" "+orderqty);
	if(newQty==0||newQty==orderqty){
		pqty=orderqty;
	}else{
		pqty=newQty;
	}
	price=rs.getInt(4);
	total=pqty*price;
%>
<h1>주문 정보 등록</h1>
<form name="form" method="post" action="orderUpdate.jsp">
<table border="1" id="addor">
<tr>
<th>주문일자</th>
<td><input type="text" id="addor1" name="orderdate" value="<%=orderdate%>"></td>
<th>주문자 이름</th>
<td><input type="text" id="addor2" name="ordername" value="<%=ordername%>"></td>
</tr>
<tr>
<th>상품코드</th>
<td><input type="text" id="addor1" name="productid" onchange="changesubmit()"  value="<%=productid%>"></td>
<th>상품명</th>
<td><input type="text" id="addor2"  value="<%=name%>"></td>
</tr>
<tr>
<th>단 가</th>
<td><input type="text" id="addor1" name="unitprice" value="<%=unitprice%>" ></td>
<th>주문수량</th>
<td><input type="text" id="addor2" name="orderqty" onchange="changesubmit()"  value="<%=pqty%>"></td>
</tr>
<tr>
<th>주문금액</th>
<td><input type="text" id="addor1" value="<%=total%>"></td>
<th>주문주소</th>
<td><input type="text" id="addor2" name="orderaddress" value="<%=orderaddress%>"></td>
</tr>
<tr>
<th colspan="4">
<input type="button" id="addorbu" value="목록" onclick="golist()"><input type="submit" id="addorbu" value="수정" onclick="check()"> 
</th>
</tr>
<%
}
%>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>

<script>
function check(){
	let input=document.form;
	if(input.orderdate.value.length==0){
		alert("주문일자를 입력하세요.")
		return false;
	}
	if(input.ordername.value.length==0){
		alert("주문자이름을 입력하세요.")
		return false;
	}
	if(input.productid.value.length==0){
		alert("상품코드를 입력하세요.")
		return false;
	}
	if(input.orderaddress.value.length==0){
		alert("주문주소를 입력하세요.")
		return false;
	}
	form.action="orderUpdateProcess.jsp";
}
function changesubmit(){
	document.form.submit();
}

function golist(){
	location.href="productSelect.jsp"
	
}
</script>
</body>
</html>