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

<body>
	<div class="customer_wrap">
		<div class="customer_title">
			<strong>고객등록</strong>
			<p>고객정보 등록</p>
		</div>
		<div class="customer_write_wrap">
			<form action="insert" method="post" name="frm"
				enctype="multipart/form-data">
				<div class="customer_write">
					<div class="write_name">
						<dl>
							<dt>이름</dt>
							<dd>
								<input type="text" class="form-control" placeholder="이름을 입력해주세요"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2" name="name">
								<!-- name 속성 추가 -->
							</dd>
						</dl>
					</div>
					<div class="write_address">
						<dl>
							<dt>사는지역</dt>
							<dd>
								<input type="text" class="form-control"
									placeholder="사는곳을 입력해주세요." aria-label="Recipient's username"
									aria-describedby="basic-addon2" name="address">
								<!-- name 속성 추가 -->
							</dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt>핸드폰번호</dt>
							<dd>
								<input type="text" class="form-control"
									placeholder="휴대폰번호를 입력해주세요." aria-label="Recipient's username"
									aria-describedby="basic-addon2" name="phone">
								<!-- name 속성 추가 -->
							</dd>
						</dl>
					</div>
					<dl class="write_gender">
						<dt class="no-border">성별</dt>
						<dd>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="flexRadioDefault1" value="남">
								<!-- name 속성 추가 -->
								<label class="form-check-label" for="flexRadioDefault1">
									남 </label>
							</div>
							<div class="form-check">
								<input class="form-check-input" type="radio" name="gender"
									id="flexRadioDefault2" value="여" checked>
								<!-- name 속성 추가 -->
								<label class="form-check-label" for="flexRadioDefault2">
									여 </label>
							</div>
						</dd>
					</dl>

					<div>
						<dl>
							<dt>나이</dt>
							<dd>
								<input type="text" class="form-control" placeholder="나이를 입력해주세요"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2" name="age">
								<!-- name 속성 추가 -->
							</dd>
						</dl>
					</div>
					<div>
						<dl>
							<dt>포인트</dt>
							<dd>
								<input type="text" class="form-control" placeholder="보유포인트"
									aria-label="Recipient's username"
									aria-describedby="basic-addon2" name="point">
							</dd>
						</dl>
					</div>
					<div>
						<dl class="customer_select">
							<dt>등급</dt>
							<dd>
								<select class="form-select" aria-label="Default select example"
									name="grade">
									<!-- name 속성 추가 -->
									<option selected>선택</option>
									<option value="Silver">Silver</option>
									<option value="Gold">Gold</option>
									<option value="VIP">VIP</option>
									<!-- value 값 수정 -->
								</select>
							</dd>
						</dl>
					</div>
					<div style="padding-top: 10px;" class="write_img">
						<label style="font-size: 1.4rem; padding-right: 20px;" for="file">이미지
							업로드</label> <input type="file" name="file" id="file" />
					</div>
				</div>
			</form>
		</div>
		<div class="ct_wrap">
			<a onclick="chkForm(); return false;" class="on">등록 </a> <a
				href="index">취소</a>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz"
		crossorigin="anonymous"></script>
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>
