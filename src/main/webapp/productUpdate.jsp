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
<%@ include file="DBConn.jsp" %>
<%
	String productid=request.getParameter("productid");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	String sql="select * from product0312 where productid=?";
	pstmt=conn.prepareStatement(sql);
	pstmt.setString(1, productid);
	rs=pstmt.executeQuery();
	if(rs.next()){
		String name=rs.getString("name");
		String unitprice=rs.getString("unitprice");
		String description=rs.getString("description");
		String category=rs.getString("category");
		String manufacturer=rs.getString("manufacturer");
		String unitsinstock=rs.getString("unitsinstock");
		String condition=rs.getString("condition");
	
%>
<h2>상품 수정 화면</h2>
<form name="form" method="post"  action="productUprdateProcess.jsp">
<table border="1" id="ap">
<tr>
<th>상품코드</th>
<td><input type="text"  class="a1" name="productid" value="<%=productid %>"></td>
</tr>
<tr>
<th>상품명</th>
<td><input type="text" class="a1" name="name" value="<%=name %>"></td>
</tr>
<tr>
<th>가격</th>
<td><input type="text" class="a1" name="unitprice" value="<%=unitprice %>"></td>
</tr>
<tr>
<th>상세정보</th>
<td><input type="text" class="a1" name="description"value="<%=description %>"></td>
</tr>
<tr>
<th>제조사</th>
<td><input type="text" class="a1"  name="category"value="<%=category %>"></td>
</tr>
<tr>
<th>분류</th>
<td>
<select id="p1"  name="manufacturer"  >
<option value="10" <%if(manufacturer.equals("10")){%>selected<%  } %>>it 제품</option>
<option value="20" <%if(manufacturer.equals("20")){%>selected<%  } %>>주방제품</option>
<option value="30" <%if(manufacturer.equals("30")){%>selected<%  } %>>전자제품</option>
<option value="40" <%if(manufacturer.equals("40")){%>selected<%  } %>>일반잡화</option>
</select>
</td>
<tr>
<th>재고수</th>
<td><input type="text" class="a1" name="unitsinstock"value="<%=unitsinstock%>"></td>
</tr>
<tr>
<th>상태</th>
<td>
<input type=radio name=condition value="신규 제품" <%=condition.equals("신규 제품") ? "checked":""%>> 신규 제품
<input type=radio name=condition value="중고 제품" <%=condition.equals("중고 제품") ? "checked":""%>> 중고 제품
<input type=radio name=condition value="재생 제품" <%=condition.equals("재생 제품") ? "checked":""%>> 재생 제품
</td>
</tr>
<tr>
<th colspan="2">
<button type="button" value="등록" class="b1" onclick="check()">등록</button>
<input type="reset" value="취소" class="b2">
</th>
</tr>
<%
	}
%>
</table>
</form>
</section>
<script>
function check(){
	let input = document.form;
	if(input.productid.value.length==0){	
		alert("상품코드를 입력하세요");
		document.form.productid.focus();
		return false;	
	}
	if(input.name.value.length==0){	
		alert("상품명을 입력하세요.");
		document.form.name.focus();
		return false;
	}
		if(input.name.value.length<4){
		alert("[상품명]\n최소 4자에서 최대50자까지 입력하세요.")
		return false;
		}
	if(input.unitprice.value.length==0){
		alert("가격을 입력하세요.");
		document.form.unitprice.focus();
		return false;
	}
	if(input.description.value.length==0){
		alert("상세정보를 입력하세요.");
		document.form.description.focus();
		return false;
	}		
	if(input.category.value.length==0){
		alert("제조사를 입력하세요.")
		document.form.category.focus();
		return false;
	}
	if(input.unitsinstock.value.length==0){
		alert("재고수를 입력하세요.")
		document.form.unitsinstock.focus();
		return false;
	}
	let cnt=0;
	let rdo=document.getElementsByName("condition")
	for(let i=0;i<rdo.length;i++){
		if(rdo[i].checked==true){
			cnt++;
			break;
		}
	}
	if(cnt==0){
		alert("상태를 체크하세요.");
		return false;
	}
	
		document.form.submit();

}
	</script>
</body>
</html>