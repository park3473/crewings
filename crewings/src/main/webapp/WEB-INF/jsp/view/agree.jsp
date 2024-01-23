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
<%@ include file="../include/user/menu.jsp"%>
<%@ include file="../include/user/top.jsp" %>
<!--공통 헤더 끝-->
<style>
 .container { width: 70%; margin: auto; }
    .terms { margin-top: 20px; }
    .terms-content { height: 200px; overflow-y: scroll; border: 1px solid #ddd; padding: 10px; }
    .agree-checkbox { margin-top: 10px; }
    .submit-btn { margin-top: 20px; }

</style>
<div class="container" id="agree_section">
<div class="tit_wrap col-sm-12">
	<div class="b_txt_tit font_noto f_wet_05">회원가입 약관 동의</div>
</div>


<div id="content" class="font_noto">
    <div class="terms">
        <p class="agree_txt">서비스 이용 약관</p>
        <div class="line_gab_15"></div>
        <div class="terms-content">
            <!-- 서비스 이용 약관 내용 -->
            서비스 이용약관 넣을 공간
        </div>
        <div class="agree-checkbox">
            <input type="checkbox" id="termsService" name="termsService">
            <label for="termsService">서비스 이용 약관에 동의합니다.</label>
        </div>
    </div>

    <div class="terms">
        <p class="agree_txt">개인정보 처리방침</p>
        <div class="line_gab_15"></div>
        <div class="terms-content">
            <!-- 개인정보 처리방침 내용 -->
            개인정보 처리방침 넣을 공간
        </div>
        <div class="agree-checkbox">
            <input type="checkbox" id="privacyPolicy" name="privacyPolicy">
            <label for="privacyPolicy">개인정보 처리방침에 동의합니다.</label>
        </div>
    </div>

    <div class="terms">
        <p class="agree_txt">마케팅 정보 수신 동의</p>
        <div class="line_gab_15"></div>
        <div class="terms-content">
            <!-- 마케팅 정보 수신 동의 내용 -->
            마케팅 정보 동의 넣을 공간
        </div>
        <div class="agree-checkbox">
            <input type="checkbox" id="marketing" name="marketing">
            <label for="marketing">마케팅 정보 수신에 동의합니다.</label>
        </div>
    </div>
    <div class="terms">
        <div class="line_gab_15"></div>
        <div class="agree-checkbox">
            <input type="checkbox" id="all_check" name="all_check">
            <label for="all_check">전체 동의</label>
        </div>
    </div>
</div>

<button class="submit-btn btn_01" type="button"  onclick="agree()">회원가입</button>

</div>

<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<script type="text/javascript">
$(document).ready(function() {
    $('#all_check').click(function() {
        $('.terms input[type="checkbox"]').not('#all_check').prop('checked', this.checked);
    $('.terms input[type="checkbox"]').not('#all_check').click(function() {
        var allChecked = $('.terms input[type="checkbox"]').not('#all_check').length === $('.terms input[type="checkbox"]').not('#all_check:checked').length;
        $('#all_check').prop('checked', allChecked);
    });
});
    
});

    function agree(){
    	
    	var allChecked = $('.terms input[type="checkbox"]:checked').not('#all_check').length;
    	
    	if(allChecked == 3){
    	
    		location.href='/view/register.do';
    		
    	}else{
    		
    		alert('동의 해주시기 바랍니다.');
    		
    	}
    	
    }
    
</script>