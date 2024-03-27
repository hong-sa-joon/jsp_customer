<%@ page language="java" contentType="text/html; charset=UTF-8"
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
</head>
<body>
	<div class="customer_wrap">
		<div class="customer_title">
			<strong>고객등록</strong>
			<p>고객 정보입니다.</p>
		</div>
		<div class="customer_write_wrap">
			<form action="insert" method="post" name="frm"
				enctype="multipart/form-data">
				<div class="customer_write">
					<div class="name">
						<dl>
							<dt>이름</dt>
							<dd>
								<input type="text" class="form-control" placeholder="이름을 입력해주세요"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</dd>
						</dl>
					</div>
					<div class="info">
						<dl>
							<dt>사는지역</dt>
							<dd>
								<input type="text" class="form-control"
									placeholder="사는곳을 입력해주세요." aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt>핸드폰번호</dt>
							<dd>
								<input type="text" class="form-control"
									placeholder="휴대폰번호를 입력해주세요." aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</dd>
						</dl>
					</div>
					<div>
						<dl class="customer_select">
							<dt>성별</dt>
							<dd>
								<select class="form-select" aria-label="Default select example">
									<option selected>성별</option>
									<option value="1">남</option>
									<option value="2">여</option>
								</select>
							</dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt>나이</dt>
							<dd>
								<input type="text" class="form-control" placeholder="나이를 입력해주세요"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2">
							</dd>
						</dl>
					</div>
					<div style="padding-top: 10px;">
						<label style="font-size: 1.4rem; padding-right: 20px;" for="file">이미지
							업로드</label> <input type="file" name="file" id="file" />
					</div>
				</div>
			</form>
			<div class="ct_wrap">
				<a onclick="chkForm(); return false; " class="on">등록</a> <a
					href="index">취소</a>
			</div>
		</div>
	</div>
</body>
</html>