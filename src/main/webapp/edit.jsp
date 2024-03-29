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
			<strong>고객 정보</strong>
			<p>고객 정보 수정</p>
		</div>
		<div class="customer_edit_wrap">
			<form action="update?customer_id=${customer.customer_id}"
				method="post" name="frm" enctype="multipart/form-data">
				<div class="customer_edit">
					<div class="name">

						<div style="padding-top: 10px;" class="edit_img">
							<c:if test="${customer.img != null}">
								<img alt="업로드 이미지" width="460px" src="${customer.img}" />
							</c:if>
							<div style="text-align: center;">
								<input type="file" name="file" id="file"
									style="width: 460px; margin: 0 auto;" /> <br /> <input
									type="hidden" name="origin_file" value="${customer.img}" />
							</div>
						</div>
					</div>
					<div class="customer_edit">
						<div class="edit_cont">
							<div>
								<dl class="edit_name">
									<dt>이름</dt>
									<dd>
										<input type="text" name="name" maxlength="50"
											value="${customer.name}" />
									</dd>
								</dl>
							</div>
							<div class="edit_address">
								<dt>사는지역</dt>
								<dd>
									<input type="text" name="address" maxlength="20"
										value="${customer.address}" />
								</dd>
							</div>
							<div class="edit_phone">
								<dt>휴대폰번호</dt>
								<dd>
									<input type="text" name="phone" maxlength="20"
										value="${customer.phone}" />
								</dd>
							</div>
						</div>
					</div>
				</div>
			</form>
			<div class="ct_wrap">
				<a onclick="chkForm(); return false; " class="on">수정</a> <a
					href="index" style="background-color: white;">취소</a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="./js/script.js"></script>
</body>
</html>