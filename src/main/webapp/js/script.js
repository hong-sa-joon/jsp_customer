
//게시물 등록
function chkForm() {
	var f = document.frm;

	if (f.name.value == '') {
		alert('이름을 입력해주세요');
		return false;
	}
	if (f.address.value == '') {
		alert('사는지역을 입력해주세요');
		return false;
	}
	if (f.phone.value == '') {
		alert('번호를 입력해주세요');
		return false;
	}

	f.submit();
}


function chkDelete(customer_id) {
	const result = confirm("삭제하시겠습니까?");

	if (result) {
		const url = location.origin;
		//페이지 이동 (request)
		location.href = url + "/jsp_customer/delete?customer_id=" + customer_id;
	} else {
		return false;
	}
}