<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
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
					<th>휴대폰번호</th>
					<th>고객등급</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="customer" items="${customerList}">
					<tr>
						<td>${customer.customer_id}</td>
						<td class="name"><a
							href="./view?customer_id=${customer.customer_id}">${customer.name}</a></td>
						<td>${customer.phone}</td>
						<td>${customer.grade}</td>
						<td class="index_del" style="border-top: 1px solid #000;">
							<dl style="position: absolute; right: 0;">
								<dt>
									<a onclick="chkDelete(${customer.customer_id}); return false;">삭제하기</a>
								</dt>
							</dl>
						</td>
				</c:forEach>
			</tbody>
		</table>
		<div class="ct_wrap ct_list">
			<a href="write">고객등록</a>
			<div class="customer_page">
				<a href="#" class="bt first">&lt;&lt;</a> <a href="#"
					class="ct prev">&lt;</a> <a href="#" class="num on">1</a> <a
					href="#" class="num">2</a> <a href="#" class="num">3</a> <a
					href="#" class="num">4</a> <a href="#" class="num">5</a> <a
					href="#" class="ct next">&gt;</a> <a href="#" class="ct last">&gt;&gt;</a>
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
		<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>