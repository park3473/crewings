<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해당 관련 js 파일 -->
<!--<script src="${pageContext.request.contextPath}/resources/js/login.js"></script> -->
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
	<form action="${pageContext.request.contextPath }/view/login.do" method="POST" id="loginForm" class="pad_30 border_01 row m-0">
		<p class="login_txt">ID</p>
		<input type="text" name="member_id" placeholder="아이디를 입력해주세요" class="pad_10 col-sm-12">
		<div class="pad_10 col-sm-12"></div>
		<p class="login_txt">PASSWORD</p>
		<input type="password" name="password"  placeholder="비밀번호를 입력해주세요" class="pad_10 col-sm-12">
		<div class="pad_15 col-sm-12"></div>
		<button type="button" onclick="login()" name="login_btn" class="btn_01">Login</button>
		<div class="col-sm-12 pad_10">
			<div class="d-flex justify-content-end">
				<!--<a href="#" onclick="IdCheck()">아이디 찾기</a><span class="ml-2 mr-2 opa_05">|</span><a href="#" onclick="PwCheck()">비밀번호 찾기</a><span class="ml-2 mr-2 opa_05">|</span><a href="/view/agree.do">회원가입</a>-->
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

document.addEventListener('DOMContentLoaded', function() {
    // Get the form by its ID or any other selector
    var form = document.getElementById('loginForm'); // Replace with your actual form ID or selector

    form.addEventListener('keypress', function(e) {
      // Check if the Enter key was pressed
      if (e.key === 'Enter') {
        e.preventDefault(); // Prevent the default action
        login(); // Execute the login function
      }
    });
  });

function login(){
	var member_id = $('[name=member_id]').val();
	var password = $('[name=password]').val();
	
	if(member_id == ''){
		alert('아이디를 입력하여주세요.');
		return;
	}else if(password == ''){
		alert('비밀번호를 입력하여주세요.');
		return;
	}else{
		
		$.ajax({
		
			type : 'POST',
			url : '/view/login.do',
			data : ({
				member_id : member_id,
				password : password
			}),
			success : function (data , status , xhr){
				console.log(data);
				
				if(data.indexOf('true') > -1){
					
					console.log(data.indexOf('true'));
					
					alert('로그인 성공');
					location.href = '${model.URL}';
				}else if(data.indexOf('false') > -1){
					
					if(data.indexOf('0') > 0){
					
						console.log(data.indexOf('-1'));
						
						alert('완전불일치');
						
					}else if(data.indexOf('2') > -1){
						
						console.log(data.indexOf('2'));
						
						alert('비밀번호가 틀렸습니다.');
						
					}else if(data.indexOf('3') > -1){
						
						console.log(data.indexOf('3'));
						
						alert('로그인 오류 error - 사이트 관리자에게 문의 부탁드립니다.');
						
					}else if(data.indexOf('4') > -1){
						
						console.log(data.indexOf('4'));
						
						alert('삭제처리된 회원입니다. - 사이트 관리자에게 문의 부탁드립니다.');
						
					}
					
				}
			},
			error : function (error , status , xhr){
				
			}
			
		})
		
		
	}
}

function typeChange(type){
	console.log(type);
	$('input[name=password]').prop('type',type);
}

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