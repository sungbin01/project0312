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
PreparedStatement pstmt=null;
ResultSet rs=null;
String productid=request.getParameter("productid");
String qty=request.getParameter("orderqty");
String orderdate=request.getParameter("orderdate");
String ordername=request.getParameter("ordername");
String name="";
int price=0;
int pqty=0,total=0;
if(qty==null || qty==""){
	pqty=0;
}else{
	pqty=Integer.parseInt(qty);
}
try{
	String sql="select productid,unitprice,name,unitsinstock from product0312 where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1,productid);
	rs=pstmt.executeQuery();
	if(orderdate==null){
		orderdate=" ";
	}
	if(ordername==null){
		ordername=" ";
	}
	if(rs.next()){
		price=rs.getInt(2);
		name=rs.getString(3);
		total=pqty*price;
		int unitsinstock=rs.getInt(4);
	if(pqty>unitsinstock){
		%>
		<Script>
		alert("주문수량이 재고수량 보다 많습니다")
		history.back(-1);
		</script>
		<% 
	}
	}else if(productid==null){
		productid="" ;
	}
	else{
		%>
		<script>
		alert("등록되지않은 상품입니다.");
		history.back(-1);
		</script>
		
		<%

		}
	}catch(Exception e){
	e.printStackTrace();
 	}
%>
<h1>주문 정보 등록</h1>
<form name="form" method="post" action="addOrder.jsp">
<table border="1" id="addor">
<tr>
<th>주문일자</th>
<td><input type="text" id="addor1" name="orderdate" value="<%=orderdate%>"></td>
<th>주문자 이름</th>
<td><input type="text" id="addor2" name="ordername" value="<%=ordername%>"></td>
</tr>
<tr>
<th>상품코드</th>
<td><input type="text" id="addor1" name="productid" onchange="changesubmit()" value="<%=productid%>"></td>
<th>상품명</th>
<td><input type="text" id="addor2"  value="<%=name%>"></td>
</tr>
<tr>
<th>단 가</th>
<td><input type="text" id="addor1" name="unitprice" value="<%=price%>" ></td>
<th>주문수량</th>
<td><input type="text" id="addor2" name="orderqty" onchange="changesubmit()" value="<%=pqty%>"></td>
</tr>
<tr>
<th>주문금액</th>
<td><input type="text" id="addor1" value="<%=total%>"></td>
<th>주문주소</th>
<td><input type="text" id="addor2" name="orderaddress"></td>
</tr>
<tr>
<th colspan="4">
<input type="button" id="addorbu" value="목록" onclick="golist()"><input type="submit" id="addorbu" value="저장" onclick="check()"> 
</th>
</tr>
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
	form.action="addorderProcess.jsp";
}
function changesubmit(){
	document.form.submit();
}
function golist(){
	location.href="orderList.jsp"
}
</script>
</body>
</html>