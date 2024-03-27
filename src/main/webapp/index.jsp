<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
</head>
<body>
	<div class="wrap">
		<table class="customer_list">
			<caption>
				<h1>고객리스트</h1>
			</caption>
			<thead>
				<tr>
					<th>아이디</th>
					<th>이름</th>
					<th>사는지역</th>
					<th>휴대폰번호</th>
					<th>성별</th>
					<th>나이</th>
					<th>사진</th>
					<th>포인트</th>
					<th>고객등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}">
					<tr>
						<td>${customer.id}</td>
						<td class="name"><a href="./view?customer_id=${customer_id}">${customer.name}</a></td>
						<td>${customer.address}</td>
						<td>${customer.phone}</td>
						<td>${customer.gender}</td>
						<td>${customer.age}</td>
						<td>${customer.img}</td>
						<td>${customer.point}</td>
						<td>${customer.grade}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<div class="ct_wrap ct_list">
			<a href="write">등록하기</a>
			<div class="customer_page">
				<a href="#" class="bt first">&lt;&lt;</a> <a href="#"
					class="bt prev">&lt;</a> <a href="#" class="num on">1</a> <a
					href="#" class="num">2</a> <a href="#" class="num">3</a> <a
					href="#" class="num">4</a> <a href="#" class="num">5</a> <a
					href="#" class="bt next">&gt;</a> <a href="#" class="bt last">&gt;&gt;</a>
			</div>
		</div>
		<script>
			<c:if test="${error != null}">
			alert("${error}")
			</c:if>
			<c:if test="${param.error != null}">
			alert("${param.error}");
		</c:if>
		</script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
			crossorigin="anonymous">
	</script>
</body>
</html>