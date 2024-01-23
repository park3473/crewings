<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해당 관련 js 파일 -->
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<!--삭제금지-->
<!-- 
<c:if test="${ssion_langage == 'kr'}">한글</c:if>
<c:if test="${ssion_langage != 'kr'}">영어</c:if>
-->
<!--공통 헤더 시작-->
<%@ include file="../include/user/header.jsp" %>
<%@ include file="../include/user/menu.jsp" %>
<%@ include file="../include/user/top.jsp" %>
<!--공통 헤더 끝-->

<div class="container" id="login_section">
<div class="row d-flex flex-column align-items-center">

	<div class="tit_wrap col-sm-12">
		<div class="b_txt_tit font_noto f_wet_05">Login</div>
		<div class="s_txt_tit">CN패널설문에 오신 것을 환영합니다.</div>
	</div>

	<div id="content" class="col-lg-4 font_noto">
	<form action="${pageContext.request.contextPath }/view/login.do" method="POST" class="pad_30 border_01 row m-0">
		<p class="login_txt">ID</p>
		<input type="text" name="member_id" placeholder="아이디를 입력해주세요" class="pad_10 col-sm-12">
		<div class="pad_10 col-sm-12"></div>
		<p class="login_txt">PASSWORD</p>
		<input type="password" name="password"  placeholder="비밀번호를 입력해주세요" class="pad_10 col-sm-12">
		<div class="pad_15 col-sm-12"></div>
		<button type="button" onclick="login()" class="btn_01">Login</button>
		<div class="col-sm-12 pad_10">
			<div class="d-flex justify-content-end">
				<a href="#" onclick="IdCheck()">아이디 찾기</a><span class="ml-2 mr-2 opa_05">|</span><a href="#" onclick="PwCheck()">비밀번호 찾기</a><span class="ml-2 mr-2 opa_05">|</span><a href="/view/agree.do">회원가입</a>
			</div>
		</div>
	</form>
	</div>

</div>
</div>

<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
<script type="text/javascript">

	function IdCheck(){

		Swal.fire({
        title: '아이디 찾기',
        html:
			'<input id="input1" name="name" class="swal2-input" placeholder="이름 입력">' +
			'<input id="input2" name="phone" class="swal2-input" placeholder="번호 입력">',
		focusConfirm: false,
        showCancelButton: true,
        confirmButtonText: '아이디 찾기',
        cancelButtonText: '취소',
        preConfirm: () => {
            const MemberName = $('[name=name]').val();
			const MemberPhone = $('[name=phone]').val();
            return { MemberName: MemberName, MemberPhone: MemberPhone };
        }
    }).then((result) => {
        if (result.value) {
            console.log('이름' + result.value.MemberName + '전화번호' + result.value.MemberPhone);
        }
    });

	}

	function PwCheck(){

	}

</script>