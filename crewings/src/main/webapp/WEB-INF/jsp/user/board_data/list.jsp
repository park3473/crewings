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

<c:if test="${model.beforeDomain.board_idx == '1' }">

<!-- 타이틀 -->
<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">공지</span>사항</div>
<div class="s_txt_tit">창의와날개 패널에서 다양한 소식을 알려드립니다.</div>
</div>
<!-- 타이틀 긑 -->

<style type="text/css">
.board .table{text-align:center}
.board .table thead th {vertical-align:bottom;border-bottom:1px solid #dee2e6;background:#f4f4f4;font-weight:normal;text-align:center}
.board .table td:nth-child(1){width:6%}
.board .table td:nth-child(2){text-align:left}
.board .table td:nth-child(3){width:10%}
.board .table td:nth-child(4){width:10%}
.board .table td:nth-child(5){width:10%}
.board .table .form-check-input{top:30%}

.board .paging{padding:30px 0}
.board .paging .pagination{top:50%;left:50%;transform: translate(-50%, -50%)}

.board .btn_list{right:0;top:0}
.board .btn_01{background:#b42424;color:#fff;padding:5px 30px;display:inline-block;border-radius:.25rem}
.board .btn_02{background:#478199;color:#fff;padding:5px 30px;display:inline-block;border-radius:.25rem}
.board .btn_03{background:#f4f4f4;border:1px #dedede solid;padding:5px 30px;display:inline-block;border-radius:.25rem}

</style>



<!-- 포인트리스트 -->
<div class="container board">
    <table class="table table-bordered_">
    <thead>
    <tr>
        <th class="pos_r"><input class="form-check-input pos_a" type="checkbox">번호</th>
        <th>제목</th>
        <th>글쓴이</th>
        <th>조회</th>
		<th>날짜</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="item" items="${model.BoardDataList }">
    <tr>
        <td class="pos_r"><input class="form-check-input pos_a" type="checkbox">1</td>
        <td><a href="/user/board_data/view.do?idx=${item.idx }&board_idx=${item.board_idx}">${item. title}</a></td>
        <td>${item. name}</td>
        <td>${item.rdcnt }</td>
		<td>${fn:substring(item.create_tm,0,11) }</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    <!-- 페이징 -->
    <div class="pos_r paging">
        <ul class="pagination pos_a">
            <li class="page-item"><a class="page-link" href="#"><i class="las la-angle-left"></i></a></li>
            <c:if test="${model.itempageend > 0}">
				<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
					<c:choose>
						<c:when test="${model.page == i }">
							<li class="page-item active"><a class="page-link">${i+1 }</a></li>
						</c:when>
						<c:otherwise>
							<li class="page-item"><a class="page-link">${i }</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>
			<c:if test="${model.itempageend == 0}">
				<li class="page-item active"><a class="page-link">1</a></li>
			</c:if>
			<c:if test="${model.itempageend < 0}">
				<li class="page-item active"><a class="page-link">1</a></li>
			</c:if>
            <li class="page-item"><a class="page-link" href="#"><i class="las la-angle-right"></i></a></li>
        </ul>
		<div class="pos_r">
		    <div class="btn_list pos_a"><a href=""><div class="btn_01">글쓰기</div></a></div>
		</div>
    </div>
    <!-- 페이징 끝 -->
</div>
<!-- 포인트리스트 끝 -->

</c:if>

<c:if test="${model.beforeDomain.board_idx == '2' }">



</c:if>

<c:if test="${model.beforeDomain.board_idx == '3' }">
<!-- 타이틀 -->
<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">FAQ</span></div>
<div class="s_txt_tit">창의와날개 패널에서 고객님께서 궁금해 하시는 질문과 답변을 모아 두었습니다.</div>
</div>
<!-- 타이틀 긑 -->






<style type="text/css">
.parent-container{padding:0 20px 0 20px;width:100%}
.faq{list-style:none;padding-left:40px;padding-right:20px}
.faq li{border-bottom:1px solid #999999;margin-bottom:15px}
.faq li.active .answer{max-height:275px !important;padding-bottom:25px;transition:max-height 0.5s ease, padding-bottom 0.5s ease}
.faq li.active .question{color:#808080;transition:color 0.5s ease}
.faq .answer{color:#090909;font-size:16px;line-height:24px;max-height:0;overflow:hidden;transition:max-height 0.5s ease, padding-bottom 0.5s ease}
.faq .plus-minus-toggle{cursor:pointer;height:21px;position:absolute;width:21px;left:-40px;top:50%;z-index:2}
.faq .plus-minus-toggle:before, .faq .plus-minus-toggle:after {background:#000;content:'';height:4px;left:0;position:absolute;top:0;width:21px;transition:transform 500ms ease}
.faq .plus-minus-toggle:after{transform-origin:center}
.faq .plus-minus-toggle.collapsed:after{transform: rotate(90deg)}
.faq .plus-minus-toggle.collapsed:before{transform: rotate(180deg)}
.faq .question{color:#090909;font-size:20px;text-transform:uppercase;position:relative;cursor:pointer;padding:20px 0;transition:color 0.5s ease}
@media screen and (max-width: 767px) {
.faq .question {font-size:18px}
}
</style>




<div class="container">
    <div class="parent-container">
  <ul class="faq">
  	<c:forEach var="item" items="${model.BoardDataList }">
    <li>
      <h3 class="question">${item.title }
        <div class="plus-minus-toggle collapsed"></div>
      </h3>
      <div class="answer">${item.content }</div>
    </li>
    </c:forEach>
  </ul>
</div>

</div>



<script>
// Toggle Collapse
$('.faq li .question').click(function () {
$(this).find('.plus-minus-toggle').toggleClass('collapsed');
$(this).parent().toggleClass('active');
});
</script>

</c:if>



<c:if test="${model.beforeDomain.board_idx == '4' ||  model.beforeDomain.board_idx == '5'}">
</c:if>

<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

</script>