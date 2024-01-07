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

<div class="pad_35"></div>

<!-- 타이틀 -->
<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">포인트</span>조회</div>
<div class="s_txt_tit">설문조사 참여를 통해 적립할 수 있는 창날패널만의 혜택을 누려보세요.</div>
</div>
<!-- 타이틀 긑 -->

<!-- 포인트 -->
<div class="container cnpnel">
    <div class="row point_wrap">
        <div class="col-sm-4">
            <div class="font_noto cont_01">
                <div class="tit">창날패널 포인트</div>
                <div class="total">${model.view.point }</div>
                <a href="/user/product/list.do"><span class="btn_01">사은품 바꾸기</span></a><span class="btn_02 pointer" data-toggle="modal" data-target="#myModal_02">현금 바꾸기</span>
            </div>
        </div>
        <div class="col-sm-8">
            <div class="cont_02">
				<div class="ico"><i class="las la-coins"></i></div>
                창날 포인트란, 설문조사 참여를 통해 적립할 수 있는 창의와날개 패널만의 혜택입니다.<br>5,000P 이상부터 현금이체 신청이 가능하며 사은품으로도 교환하실 수 있습니다.
            </div>
        </div>
    </div>
</div>
<!-- 포인트 끝 -->

<!-- 포인트리스트 -->
<div class="container cnpnel">
    <table class="table table-bordered">
    <thead>
    <tr>
        <th>날짜</th>
        <th>카테고리</th>
        <th>제목</th>
        <th>포인트</th>
        <th>상세보기</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${model.list }" var="item">
    <tr>
        <td>${fn:substring(item.complete_tm,0,11) }</td>
        <td>${item.l_category }</td>
        <td>${item.name }</td>
        <td class="point">${item.point }</td>
        <td class="detail"><button type="button"  onclick="location.href='/user/exam/result/view.do?idx=${item.idx}&exam_idx=${item.exam_idx }&member_id=${item.member_id }'">상세보기</button></td>
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

<!-- 현금모달 -->
<div class="cnpnel">
    <div class="modal" id="myModal_02">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <div class="tit font_noto">현금신청하기</div>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <div class="total font_noto">신청가능금액 : <span class="red_01">${model.view.point }P</span></div>
                    <input type="text" class="form-control" id="bank" placeholder="은행명">
                    <input type="text" class="form-control" id="name" placeholder="예금주명">
                    <input type="text" class="form-control" id="number" placeholder="계좌번호">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">신청하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 현금모달 끝 -->

<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript">
</script>