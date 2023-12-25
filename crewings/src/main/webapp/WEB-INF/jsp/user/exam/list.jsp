<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
                            <div class="sul"><span class="gray_10">응답시간 : </span> 약7분내외(10문항) </div>
                            <div class="date"><span class="gray_10">응답기간 : </span>${item.start_tm } ~ ${item.end_tm }</div>
                            <a href="/user/exam/view.do?idx=${item.idx }"><div class="link">참여하기</div></a>
                            <div class="ing pos_a">진행중</div>
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