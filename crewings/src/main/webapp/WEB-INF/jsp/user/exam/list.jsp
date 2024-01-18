<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% java.util.Date now = new java.util.Date(); %>
<%--<fmt:formatDate value="<%=now%>" pattern="yyyy-MM-dd HH:mm:ss" /> --%>
<c:set var="now" value="<%=now%>" />
<!--  ${now} -->
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--공통 헤더 시작-->
<%@ include file="../../include/user//header.jsp" %>
<%@ include file="../../include/user/menu.jsp" %>
<%@ include file="../../include/user/top.jsp" %>
<!--공통 헤더 끝-->

<!-- 타이틀 -->
<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">설문</span>참여</div>
<div class="s_txt_tit">CN패널설문은 포인트 리워드를 위해 로그인 후 참여하실수 있습니다.</div>
</div>
<!-- 타이틀 긑 -->


<!-- 설문리스트 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="cnpnel font_noto f_wet_03">
                <div class="flexbox">
                    <c:forEach var="item" items="${model.list}" varStatus="status">
                    <div class="item_02 box_02 pos_r">
                        <img src="/resources/img/thum_img.jpg" alt="">
                        <div class="sul_box">
                            <div class="txt font_noto">${item.name }</div>
                            <div class="sul"><span class="gray_10">응답사례 : </span>${item.point } 포인트 리워드</div>
                            <div class="sul"><span class="gray_10">설문소개 : </span> ${item.coment }</div>
                            <div class="date"><span class="gray_10">응답기간 : </span>${fn:substring(item.start_tm,0,11) } ~ ${fn:substring(item.end_tm,0,11) }</div>
                            <c:choose>
                            	<c:when test="${now.after(item.start_tm) and now.before(item.end_tm)  }">
                            		<a href="/user/exam/view.do?idx=${item.idx }&category=${item.category}"><div class="link">참여하기</div></a>
                            		<div class="ing pos_a">진행중 </div>
                            	</c:when>
                            	<c:otherwise>
                            		<div class="end pos_a">진행종료 </div>
                            	</c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 설문리스트 끝 -->

<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

</script>