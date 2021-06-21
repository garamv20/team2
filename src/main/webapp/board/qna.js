function write_ok() {
	if(document.qna_frm.f_title.value.length == 0) {
		alert("제목을 입력해주세요");
		faq_frm.q_title.focus();
		return;
	}
	if(document.qna_frm.q_category.value.length == 0) {
		alert("분류명을 입력해주세요");
		faq_frm.q_category.focus();
		return;
	}
	if(document.qna_frm.q_content.value.length == 0) {
		alert("내용을 입력해주세요");
		faq_frm.q_content.focus();
		return;
	}
	document.qna_frm.submit();
}

function login_rq() {
	alert("로그인이 필요한 서비스입니다.");
	return;
}

function delete_ok() {
	if(confirm("정말 삭제하시겠습니까?") == true) {
		document.show_frm.submit();
	} else {
		return;
	}
}
