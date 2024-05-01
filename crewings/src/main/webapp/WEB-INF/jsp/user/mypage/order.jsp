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
<%@ include file="../../include/user/header.jsp" %>
<%@ include file="../../include/user/menu.jsp" %>
<%@ include file="../../include/user/top.jsp" %>
<!--공통 헤더 끝-->

<style>
    .detail_btn button {background: #319ec2;color: #fff;padding: 5px 10px;display: inline-block;border-radius: 0.25rem;margin-left: 5px;}
    .table td, .table th {vertical-align: middle;}
</style>

<div class="pad_35"></div>

<!-- 타이틀 -->
<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">신청</span>리스트</div>
<div class="s_txt_tit">설문조사 참여를 통해 적립할 수 있는 창날패널만의 혜택을 누려보세요.</div>
</div>
<!-- 타이틀 긑 -->

<!-- 포인트리스트 -->
<div class="container cnpnel">
    <table class="table table-bordered">
    <thead>
    <tr>
        <th>번호</th>
        <th>상품 명</th>
        <th>상태</th>
        <th>가격</th>
        <th>신청 날짜</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${model.list }" var="item" varStatus="status">
    <tr>
        <td>${status.index + 1 }</td>
        <td>${item.product_name }</td>
        <td style="text-align:center">
        	<c:choose>
                                        		<c:when test="${item.type == '3' }">완료</c:when>
                                        		<c:when test="${item.type == '2' }">처리대기</c:when>
                                        		<c:when test="${item.type == '1' }">거절</c:when>
                                        		<c:when test="${item.type == '0' }">신청</c:when>
                                        	</c:choose>
        </td>
        <td class="point">${item.product_price }</td>
        <td>${fn:substring(item.create_tm , 0 , 11) }</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    <!-- 페이징 -->
    <div class="pos_r paging">
        <ul class="pagination pos_a">
            <li class="page-item"><a class="page-link" href="#"><i class="las la-angle-left"></i></a></li>
            <li class="page-item active"><a class="page-link" href="#">1</a></li>
            <!--  <li class="page-item"><a class="page-link" href="#">3</a></li> -->
            <li class="page-item"><a class="page-link" href="#"><i class="las la-angle-right"></i></a></li>
        </ul>
    </div>
    <!-- 페이징 끝 -->
</div>
<!-- 포인트리스트 끝 -->


<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript">

</script>