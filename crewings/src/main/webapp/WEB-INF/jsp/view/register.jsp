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
</style>


<div class="container" id="register_section">
    <div class="tit_wrap col-sm-12">
        <div class="b_txt_tit font_noto f_wet_05">회원가입</div>
    </div>

<div id="content" class="font_noto">
<form action="${pageContext.request.contextPath }/view/login.do" method="POST">
    <table class="table">
        <tbody class="table-group-divider border_02">
          <tr>
            <th scope="row">아이디</th>
            <td><input type="text" name="member_id" placeholder="아이디 입력"></td>
          </tr>
          <tr>
            <th scope="row">비밀번호</th>
            <td>
              <input type="password" name="password" placeholder="비밀번호 입력" class="mr-2 mar_b">
              <input type="password" name="password" placeholder="비밀번호 입력확인" class="mr-2 mar_b">
              <button type="button" class="btn_02">확인</button>
            </td>
          </tr>
          <tr>
            <th scope="row">핸드폰번호</th>
            <td><input type="text" name="phone" placeholder="핸드폰번호 입력"></td>
          </tr>
          <tr>
            <th scope="row">이메일</th>
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
            <th rowspan="2">주소</th>
            <td>
                <input type="text" name="address" placeholder="주소 입력" class="mr-2 mar_b"><button type="button" class="btn_02">주소검색</button>
            </td>
          </tr>
          <tr>
            <td>
                <input type="text" name="address_detail" placeholder="상세주소 입력">
            </td>
          </tr>
          <tr>
            <th scope="row">추천인</th>
            <td>
                <input type="text" name="recommender" placeholder="추천인 입력" class="mr-2 mar_b"><button type="button" class="btn_02">추천인 검색</button>
            </td>
          </tr>
        </tbody>
    </table>
</form>
</div>

<button class="btn_01" type="button" onclick="register()">회원가입</button>

</div>

<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<script type="text/javascript">
</script>