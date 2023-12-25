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
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">사은품</span> 리스트</div>
<div class="s_txt_tit">CN패널설문은 포인트 리워드를 위해 로그인 후 참여하실수 있습니다.</div>
</div>
<!-- 타이틀 긑 -->

<!-- 사은품리스트 -->
<div class="container">
    <div class="tab-button-outer">
        <ul id="tab-button">
            <li><a href="#tab01">전체</a></li>
            <li><a href="#tab02">상품권.생활.도서</a></li>
            <li><a href="#tab03">커피.음료</a></li>
            <li><a href="#tab04">베이커리.도넛.떡</a></li>
            <li><a href="#tab05">아이스크림.빙수</a></li>
            <li><a href="#tab06">치킨.버거.피자</a></li>
            <li><a href="#tab07">편의점.마트</a></li>
        </ul>
    </div>
    <div class="tab-select-outer">
        <select id="tab-select">
        <option value="#tab01">전체</option>
        <option value="#tab02">상품권.생활.도서</option>
        <option value="#tab03">커피.음료</option>
        <option value="#tab04">베이커리.도넛.떡</option>
        <option value="#tab05">아이스크림.빙수</option>
        <option value="#tab06">치킨.버거.피자</option>
        <option value="#tab07">편의점.마트</option>
        </select>
    </div>
    <div id="tab01" class="tab-contents">
        <div class="cnpnel font_noto f_wet_03">
            <div class="flexbox">
                <c:forEach var="item" items="${model.list }">
                <div class="item_02 box_02">
                    <img style="width:10rem" src="/resources/upload/product/image/${item.image }" alt="">
                    <div class="sul_box">
                        <div class="txt font_noto">${item.name }</div>
                        <div class="sul"><span class="gray_10">사용가능지역 : </span>${item.location }</div>
                        <div class="sul"><span class="red_01"><strong>${model.list[0].price }P</strong></div>
                        <div class="link pointer" data-toggle="modal" data-target="#myModal_03">구입하기</div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
    </div>
    <div id="tab02" class="tab-contents">
        2
    </div>
    <div id="tab03" class="tab-contents">
        3
    </div>
</div>
<!-- 사은품리스트 끝 -->

<!-- 사은품모달 -->
<div class="cnpnel">
    <div class="modal" id="myModal_03">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="tit font_noto">사은품 구매하기</div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="total font_noto">차감포인트 : <span class="red_01">${model.list[0].price }P</span></div>
                    <div class="img max_img"><img src="/resources/upload/product/image/${model.list[0].image }" alt=""></div>
					<div class="tit">${model.list[0].name }</div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">구매하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 사은품모달 끝 -->

<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

</script>