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
.board .btn_01{background:#b42424;color:#fff;padding:5px 30px;display:inline-block;border-radius:.25rem;margin-left:3px}
.board .btn_02{background:#478199;color:#fff;padding:5px 30px;display:inline-block;border-radius:.25rem;margin-left:3px}
.board .btn_03{background:#cccccc;color:#555;padding:5px 30px;display:inline-block;border-radius:.25rem;margin-left:3px}

.board .board_view{}
.board .board_view .subject{border-top:2px #000 solid;border-bottom:1px #000 solid;padding:15px 0}
.board .board_view .subject .tit{font-size:20px;font-weight:500;padding-bottom:10px}
.board .board_view .subject .name{padding-right:20px}
.board .board_view .subject .date{float:right}
.board .board_view .cont{padding:30px 0;border-bottom:1px #000 solid;margin-bottom:30px}


</style>



<!-- 게시판뷰 -->
<div class="container board">
<div class="board_view">

<!-- 제목 -->
<div class="subject">
<div class="tit font_noto">창날패널에서 알려드립니다. 다양한 소식을 전해드립니다</div>
<div class=""><span class="name">작성자 : 관리자</span><span class="name">조회 : 75회</span><span class="date">작성일 : 2023-12-10</span></div>	
</div>
<!-- 제목 끝 -->

<!-- 컨테이너 -->
<div class="cont max_img">
	
안녕하세요. 창날패널입니다.<br>
창날패널은 보다 나은 서비스 제공을 위해 2023년 11월 22일 '서버 점검'을 진행할 예정입니다.<br>
서버 점검 기간 동안 모든 서비스 이용이 일시적으로 중단되오니 회원님들의 양해 부탁드립니다.<br>
더욱 편리하고 안정적인 서비스 제공을 위해 최선을 다하겠습니다.<br>
감사합니다.<br>
<img src="contents/img/thum_img_02.jpg" alt="">

</div>
<!-- 컨테이너 끝 -->

<!-- 버튼 -->
    <div class="paging pos_r">
		    <div class="btn_list pos_a"><a href=""><div class="btn_03">목록</div></a><a href=""><div class="btn_02">답변</div></a><a href=""><div class="btn_01">글쓰기</div></a></div>
    </div>
    <!-- 버튼 끝 -->


	
</div>
</div>
<!-- 게시판뷰 끝 -->


<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

</script>