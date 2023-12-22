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
<!--공통 헤더 끝-->

<!-- 메인배너 -->
<div id="cnpnel" class="carousel slide" data-ride="carousel">
    <ul class="carousel-indicators">
        <li data-target="#cnpnel" data-slide-to="0" class="active"></li>
        <li data-target="#cnpnel" data-slide-to="1"></li>
    </ul>
    <div class="carousel-inner">
        <div class="carousel-item active">
            <div class="carousel-caption t_spa_00">
                <div class="font_noto f_wet_01 gray_00">
                    <div class="txt_32">창날 패널이라면 누구나</div>
                    <div class="txt_64">국내.해외<span class="f_wet_05 blue_01">통합설문조사</span> 플랫폼</div>
                    <div class="txt_32">창의와날개 패널이 제공하는 다양한 설문조사에 참여하고<br>포인트를 쌓아보세요.</div>
                </div>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/main_bg_01.jpg">
        </div>
        <div class="carousel-item">
            <div class="carousel-caption t_spa_00">
                <div class="font_noto f_wet_01 gray_00">
                    <div class="txt_32">회원가입만 해도</div>
                    <div class="txt_64">포인트<span class="f_wet_05 orange_01">바로증정</span>합니다.</span></div>
                    <div class="txt_32">회원가입하고 포인트도 받고 또 설문조사 참여하고<br>포인트 받자.</div>
                </div>
            </div>
            <img src="${pageContext.request.contextPath}/resources/img/main_bg_02.jpg">
        </div>
    </div>
    <a class="carousel-control-prev" href="#cnpnel" role="button" data-slide="prev"><i class="la la-angle-left" aria-hidden="true"></i></a>
    <a class="carousel-control-next" href="#cnpnel" role="button" data-slide="next"><i class="la la-angle-right" aria-hidden="true"></i></a>
</div>
<!-- 메인배너끝 -->
<div class="pad_35"></div>

<div id="content">
<form action="${pageContext.request.contextPath }/view/login.do" method="POST">
	<input type="text" name="member_id">
	<input type="text" name="password">
	<button type="button" onclick="login()">전송</button>
</form>
</div>

<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<script type="text/javascript">