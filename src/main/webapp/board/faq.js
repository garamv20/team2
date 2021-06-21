function write_ok() {
	if(document.faq_frm.f_title.value.length == 0) {
		alert("제목을 입력해주세요");
		faq_frm.f_title.focus();
		return;
	}
	if(document.faq_frm.f_category.value.length == 0) {
		alert("분류명을 입력해주세요");
		faq_frm.f_category.focus();
		return;
	}
	if(document.faq_frm.f_content.value.length == 0) {
		alert("내용을 입력해주세요");
		faq_frm.f_content.focus();
		return;
	}
	document.faq_frm.submit();
}

function login_rq() {
	alert("로그인이 필요한 서비스입니다.");
	return;
}

function manager_rq() {
	alert("관리자만 글을 작성할 수 있습니다.");
	return;
}

function delete_ok() {
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.show_frm.submit();
	} else {
		return;
	}
}
