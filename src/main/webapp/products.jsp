<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>

<!DOCTYPE html>
<html>
<head>
<!-- 3/17 추가 -->
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"> -->
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품목록</h1>
		</div>
	</div>
	<%
		ProductRepository dao = ProductRepository.getInstance();
		ArrayList<Product> listOfProducts = dao.getAllProducts();
		//ArrayList<Product> listOfProducts = productDAO.getAllProducts();
	%>
	<div class="container">
		<div class="row" align="center">
			<%
				for(int i = 0; i < listOfProducts.size(); i++){
					Product product = listOfProducts.get(i);
			%>
			<div class="col-md-4">
			<!-- 3/17 추가 ----------------------------------------->
			<!-- <img src ="C:\\upload\<%=product.getFilename()%>" style ="width: 100%">  -->
			<img src ="/upload/<%=product.getFilename()%>" style="width: 100%">
			<!-- <img src="./resources/images/<%=product.getFilename() %>" style="width: 100%"> -->
				<h3><%=product.getPname()%></h3>
				<p><%=product.getDescription()%>
				<p><%=product.getUnitPrice()%>원
				<p><a href="./product.jsp?id=<%=product.getProductId()%>" class="btn btn-secondary" role="button"> 상세 정보 &raquo;</a>
			</div>
			<%
				}
			%>
		</div><hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>
<!-- 프로젝트 디렉토리 구조는 생성 방법과 사용중인 빌드 도구에 따라 다릅니다.
Eclipse에서 파일 ->새로 만들기 -> 동적 웹 프로젝트를 선택하여 생성하면 / WebContent 디렉토리를 찾습니다.
Maven을 사용하여 만든 경우 strutcure 디렉토리는 / src / main / webapp이 됩니다. -->