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
#content { width: 300px; margin: auto; padding: 20px; border: 1px solid #ddd; }
    form > input, form > select, form > button { display: block; margin-bottom: 10px; width: 100%; }
    button { cursor: pointer; }
</style>
<div class="pad_35"></div>

<div id="content">
<form action="${pageContext.request.contextPath }/view/login.do" method="POST">
	<input type="text" name="member_id" placeholder="아이디 입력">
        <input type="password" name="password" placeholder="비밀번호 입력">
        <input type="text" name="name" placeholder="이름 입력">
        <input type="text" name="phone" placeholder="핸드폰번호 입력">
        <input type="text" name="email" placeholder="이메일 입력">@
        <span>
        <select name="email_address">
            <option value="">이메일 선택</option>
            <option value="naver.com">naver.com</option>
            <option value="daum.net">daum.net</option>
            <option value="gmail.com">gmail.com</option>
            <option value="nate.com">nate.com</option>
        </select>
        </span>
        <input type="text" name="address" placeholder="주소 입력"><button type="button">주소검색</button>
        <input type="text" name="address_detail" placeholder="상세주소 입력">
        <input type="text" name="recommender" placeholder="추천인 입력"><button type="button">추천인 검색</button>
        <button type="button" onclick="register()">회원가입</button>
</form>
</div>

<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<script type="text/javascript">
</script>