<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<!--  dao.ProductRepository 임포트하므로 유즈빈은 주석처리
<jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session" />
-->
<!DOCTYPE html>
<html>
<head>
<!-- 3/17 추가 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<!-- /*3/23 추가*/ -->
<script type="text/javascript">
	function addToCart() {
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div>
	</div>
	<%
		String id = request.getParameter("id");
		ProductRepository dao = ProductRepository.getInstance();
		Product product = dao.getProductById(id); 
		//Product product = productDAO.getProductById(id); --> productRepositor 임포트로 유즈빈태그는 주석처리 되므로 위 코드로 변경
//userBean태그에서 id값을 통해 ProductRepository 클래스의 getProductById() 메소드를 호출하여 반환된 값을 product에 저장
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
			<!-- 상대경로
<img src="./resources/images/<%=product.getFilename() %>" style="width: 100%">  -->
 <!-- 절대경로(크롬엑박)
 <img src="C:\\upload\<%=product.getFilename() %>" style="width: 100%"> -->
 <!-- server 코드 추가로 크롬엑박없는 경로 -->
			
				 <img src ="/upload/<%=product.getFilename()%>" style="width: 100%">
			</div>
			<div class="col-md-6">
				<h3><%=product.getPname() %></h3>
				<p><%=product.getDescription() %>
				<p><b>상품 코드 : </b><span class="badge badge-danger"><%=product.getProductId() %></span>
				<p><b>제조사</b> : <%=product.getManufacturer() %>
				<p><b>분류</b> : <%=product.getCategory() %>
				<p><b>재고 수</b> : <%=product.getUnitsInStock() %>
				<h4><%=product.getUnitPrice() %>원</h4>
				<!-- /*3/23 추가*/ -->
				<p><form name="addForm" action="./addCart.jsp?id=<%=product.getProductId() %>" method="post">
					<a href="#" class="btn btn-info" onclick="addToCart()"> 상품 주문 &raquo;</a>
					<a href="./cart.jsp" class="btn btn-warning">장바구니 &raquo;</a>
					<a href="./products.jsp" class="btn btn-secondary"> 상품 목록 &raquo;</a>
				</form>
			</div>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>