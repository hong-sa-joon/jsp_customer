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
	<div class="customer_wrap">
		<div class="customer_title">
			<strong>고객정보</strong>
			<p>고객정보상세보기</p>
		</div>
		<div class="customer_view_wrap">
			<div class="view">
				<div class="name">${customer.name}</div>
				<div class="info" style="position: relative;">
				<dl>
				<dt>아이디</dt>
				<dd>${customer.customer_id}</dd>
				</dl>
				<dl>
				<dt>이름</dt>
				<dd>${customer.name}</dd>
				</dl>
				<dl>
				<dt>사는지역</dt>
				<dd>${customer.address}</dd>
				</dl>
				<dl>
				<dt>휴대폰번호</dt>
				<dd>${customer.phone}</dd>
				</dl>
				<dl>
				<dt>성별</dt>
				<dd>${customer.gender}</dd>
				</dl>
				<dl>
				<dt>나이</dt>
				<dd>${customer.age}</dd>
				</dl>
				<dl>
				<dt>사진</dt>
				<dd>${customer.img}</dd>
				</dl>
				<dl>
				<dt>포인트</dt>
				<dd>${customer.point}</dd>
				</dl>
				<dl>
				<dt>고객등급</dt>
				<dd>${customer.grade}</dd>
				</dl>
				<dl>
				<dt></dt>
				
				</dl>
				</div>
			</div>

		</div>


	</div>























	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
</body>
</html>