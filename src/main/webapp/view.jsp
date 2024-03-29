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
	<div class="customer_wrap">
		<div class="customer_title">
			<strong>고객정보</strong>
			<p>고객정보상세보기</p>
		</div>
		<div class="customer_view_wrap">
			<dl>
				<c:if test="${customer.img != null}">
					<div class="cont">
						<img src="${customer.img}" alt="업로드 이미지" style="width: 350px;">
					</div>
				</c:if>
			</dl>
			<div class="view">
				<div>
					<div class="info" style="position: relative;">
						<div class="view_container">
							<dl>
							<dt>수정가능한 정보</dt>
							</dl>
							<div class="view_co">
								<dl>
									<dt>이름</dt>
									<dd>${customer.name}</dd>
								</dl>
								<dl style="width: 304px">
									<dt>사는지역</dt>
									<dd>${customer.address}</dd>
								</dl>
								<dl>
									<dt>휴대폰번호</dt>
									<dd>${customer.phone}</dd>
								</dl>
							</div>
							<div class="view_co">
								<dl>
									<dt>성별</dt>
									<dd>${customer.gender}</dd>
								</dl>
								<dl>
									<dt>나이</dt>
									<dd>${customer.age}</dd>
								</dl>
								<dl>
									<dt>포인트</dt>
									<dd>${customer.point}</dd>
								</dl>
								<dl>
									<dt>고객등급</dt>
									<dd>${customer.grade}</dd>
								</dl>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="ct_wrap">
				<a href="index" class="on">목록</a> <a
					href="edit?customer_id=${customer.customer_id}">수정</a>
			</div>
		</div>

	</div>
	<script>
		// request 객체에 error가 있을 경우 에러메시지 출력
		<c:if test="${error != null}">
			alert("${error}");
		</c:if>
		
		// 쿼리스트링에 error가 있을 경우 에러메시지 출력(request 객체에 포함되므로)
		<c:if test="${param.error != null}">
			alert("${param.error}");
		</c:if>
	</script>
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>