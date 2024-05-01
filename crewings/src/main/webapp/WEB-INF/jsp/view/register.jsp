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
<style>
/* #content { width: 300px; margin: auto; padding: 20px; border: 1px solid #ddd; } */
    form > input, form > select, form > button { display: block; margin-bottom: 10px; width: 100%; }
    button { cursor: pointer; }
    .star_red {
    color: red;
}
</style>


<div class="container" id="register_section">
    <div class="tit_wrap col-sm-12">
        <div class="b_txt_tit font_noto f_wet_05">회원가입</div>
    </div>

<div id="content" class="font_noto">
<form name="register_form" id="register_form" action="${pageContext.request.contextPath }/view/register.do" method="POST">
	<input type="hidden" name="address_local" value="all">
	<input type="hidden" name="level" value="1">
	<input type="hidden" name="type" value="1">
	<input type="hidden" name="age" value="10">
	<input type="hidden" name="sex" value="3">
	<input type="hidden" name="IdCheck" id="idcheck" value="false">
    <table class="table">
        <tbody class="table-group-divider border_02">
          <tr>
            <th scope="row"><span class="star_red">*</span>아이디</th>
            <td id="member_td"><input type="text" name="member_id" class="mr-2" placeholder="아이디 입력" onchange="document.getElementById('idcheck').value = 'false' " >  <button type="button" class="btn_02" onclick="idCheck()">아이디 중복 확인</button></td>
          </tr>
          <tr>
            <th scope="row"><span class="star_red">*</span>비밀번호</th>
            <td>
              <input type="password" name="password" placeholder="비밀번호 입력" class="mr-2 mar_b">
              <input type="password" name="password_check" placeholder="비밀번호 입력확인" class="mr-2 mar_b">
              <button type="button" class="btn_02" onclick="passwordCheck()">확인</button>
            </td>
          </tr>
          <tr>
            <th scope="row"><span class="star_red">*</span>이름</th>
            <td><input type="text" name="name" placeholder="이름 입력"></td>
          </tr>
    <!--
          <tr>
            <th scope="row"><span class="star_red">*</span>성별</th>
            <td>
            	<select name="sex">
                    <option value="" class="pad_5">성별 선택</option>
                    <option value="0">여자</option>
                    <option value="1">남자</option>
                </select>
            </td>
          </tr>
           <tr>
            <th scope="row"><span class="star_red">*</span>나이</th>
            <td>
            	<select name="age">
                    <option value="" class="pad_5">나이 선택</option>
                    <option value="0">0~9세</option>
                    <option value="1">10~19세</option>
                    <option value="2">20~29세</option>
                    <option value="3">30~39세</option>
                    <option value="4">40~49세</option>
                    <option value="5">50~59세</option>
                    <option value="6">60~69세</option>
                    <option value="7">70~79세</option>
                </select>
            </td>
          </tr>
          <tr>
            <th scope="row"><span class="star_red">*</span>직업</th>
            <td>
            	<select name="job">
                    <option value="" class="pad_5">직업 선택</option>
                    <option value="초등학생">초등학생</option>
                    <option value="중학생">중학생</option>
                    <option value="고등학생">고등학생</option>
                    <option value="대학생">대학생</option>
                    <option value="연구원">연구원</option>
                    <option value="일반인/주부">일반인/주부</option>
                    <option value="회사원">회사원</option>
                    <option value="공무원">공무원</option>
                    <option value="군인">군인</option>
                    <option value="소방관">소방관</option>
                </select>
            </td>
          </tr>
          <tr>
            <th scope="row"><span class="star_red">*</span>핸드폰번호</th>
            <td><input type="text" name="phone" placeholder="핸드폰번호 입력"></td>
          </tr>
          <tr>
            <th scope="row"><span class="star_red">*</span>이메일</th>
            <td>
                <input type="text" name="email" placeholder="이메일 입력" class="mar_b"><span class="mr-2 ml-2">@</span>
                <span>
                <select name="email_address">
                    <option value="" class="pad_5">이메일 선택</option>
                    <option value="naver.com">naver.com</option>
                    <option value="daum.net">daum.net</option>
                    <option value="gmail.com">gmail.com</option>
                    <option value="nate.com">nate.com</option>
                </select>
                </span>
            </td>
          </tr>
          <tr>
            <th rowspan="2"><span class="star_red">*</span>주소</th>
            <td>
                <input type="text" name="address" placeholder="주소 입력" class="mr-2 mar_b" ><button type="button" onclick="zipCode()" value="주소검색" class="btn_02">주소검색</button>
            </td>
          </tr>
          <tr>
            <td>
                <input type="text" name="address_detail" placeholder="상세주소 입력">
            </td>
          </tr>
          <!--
          <tr>
            <th scope="row">추천인</th>
            <td>
                <input type="text" name="recommender" placeholder="추천인 입력" class="mr-2 mar_b">
                
            </td>
          </tr>
        -->
        </tbody>
    </table>
</form>
</div>

<button class="btn_01" type="button" onclick="register()">회원가입</button>

</div>

<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
//집 주소 검색
function zipCode() {
    new daum.Postcode({
        oncomplete: function(data) {
            console.log(data);
            
            var full_address = data.address + "(" + data.buildingName + ")";
            $('input[name=address]').val(full_address);
            $('input[name=address_local]').val(data.sido);
        }
    }).open();
}

function idCheck(){
	
	var id = $('input[name=member_id]').val()
	
	if(id == ''){
		alert('검사할 아이디를 입력해주세요.');
		return;
		}
	
	$('#idcheck_span').remove();
	
	$.ajax({
	    url : '/view/IdCheck.do',
	    type : 'POST',
	    data : ({member_id : id}),
	    success : function(data){
	        console.log(data);
	        if(data == 'true'){
	        	alert('사용 가능한 아이디입니다.');
	        	var html = `<span id="idcheck_span" style="color: #25a6df;">사용가능한 아이디 입니다.</span>`;
	        	$('#member_td').append(html);
	        	}else{
	        		alert('사용 불가능한 아이디입니다.');
	        		var html = `<span id="idcheck_span" style="color: #ff7a7a;">사용불가능한 아이디 입니다.</span>`;
	        		$('#member_td').append(html);
	        		}
	        $('input[name=IdCheck]').val(data);
	    },
	    error : function(error , status){
console.log(error);}
	})
	
	}
function passwordCheck(){
	
	if($('input[name=password]').val() == $('input[name=password_check]').val() ){
		alert('동일합니다.');
	}else{
		alert('동일하지 않습니다.');
	}
	
}

function register(){
	
	var result = confirm('회원가입을 진행하시겠습니까?'); 
	
	if(!result){
		
		return;
	}
	
	  var idcheck = $('input[name=IdCheck]').val();
	if(idcheck == 'false'){
		alert('아이디 중복확인을 해주세요.');
		return;
		}
	/*
	if($('input[name=recommender]').val() != ''){
		
		var member_id = $('input[name=recommender]').val();
		var recommned_point = '300';
		
		$.ajax({
			url : '/view/recommend.do',
			type : 'POST',
			data : ({
				member_id : member_id,
				point : recommned_point
			}),
			success : function(status , success , xhr){
				
				console.log('recommend_point_up : success');
				
				registerOn();
				
			},
			error : function(status , error , xhr){
				
			}
		})
		
	}else{
		
		registerOn();
		
	}
  */
	registerOn();

}

function registerOn(){
	
	
	
  const inputs = document.querySelectorAll('form input');

  // 필수 입력 필드가 비어있는지 체크
  for (let input of inputs) {
    if (input.value.trim() === '') {
        alert('모든 필수 항목을 입력해주세요.');
        input.focus(); // 비어있는 필드에 포커스
        console.log(input);
        return false; // 폼 제출 중단
      }
  }

	var formData = $('#register_form').serialize();
	
	$.ajax({
		url : '/view/register.do',
		type : 'POST',
		data : formData,
		success : function(status , success , xhr){
			
			console.log('register : success');
			
			alert('회원가입 완료되었습니다.');
			location.href='/index.do';
			
		},
		error : function(status , error , xhr){
			
			console.log('register : fail');
			
		}
	})
	
}

</script>