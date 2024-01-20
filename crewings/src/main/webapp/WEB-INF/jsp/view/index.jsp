<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<script src="${pageContext.request.contextPath}/resources/sweetalert/jquery-1.12.4.js"></script>
<!-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> -->

<!--삭제금지-->

<!--공통 헤더 시작-->
<%@ include file="../include/user//header.jsp" %>
<%@ include file="../include/user/menu.jsp" %>
<!--공통 헤더 끝-->

<!-- 
<c:if test="${sessionScope.Login != 'OkOk' }">
	<a href="${pageContext.request.contextPath}/view/login.do">로그인 페이지 이동</a>
</c:if>
<c:if test="${sessionScope.Login == 'OkOk' }">
	<a href="${pageContext.request.contextPath}/view/login.do">로그아웃</a>
	<a href="${pageContext.request.contextPath}/admin/index.do">관리자</a>
</c:if>
-->



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
<div class="pad_35 c_hide"></div>






<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">CN패널</span>설문</div>
<div class="s_txt_tit">CN패널설문은 포인트 리워드를 위해 로그인 후 참여하실수 있습니다.</div>
</div>

<!-- 설문리스트 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="cnpnel font_noto f_wet_03">
                <div class="flexbox">
                    <div class="item box_02 pos_r">
                        <img src="${pageContext.request.contextPath}/resources/img/thum_img.jpg" alt="">
                        <div class="sul_box">
                            <div class="txt font_noto">살아있는 영어로 가는...</div>
                            <div class="sul"><span class="gray_10">응답사례 : </span>700 포인트 리워드</div>
							<div class="sul"><span class="gray_10">응답시간 : </span> 약7분내외(10문항) </div>
                            <div class="date"><span class="gray_10">응답기간 : </span>2023.09-01 ~ 2023.09.31</div>
							<a href="/cnpnel/sub_02a_01.php"><div class="link">참여하기</div></a>
							<div class="ing pos_a">진행중</div>
                        </div>
                    </div>
                    <div class="item box_02 pos_r">
                        <img src="${pageContext.request.contextPath}/resources/img/thum_img.jpg" alt="">
                        <div class="sul_box">
                            <div class="txt font_noto">살아있는 영어로 가는...</div>
                            <div class="sul"><span class="gray_10">응답사례 : </span>700 포인트 리워드</div>
							<div class="sul"><span class="gray_10">응답시간 : </span> 약7분내외(10문항) </div>
                            <div class="date"><span class="gray_10">응답기간 : </span>2023.09-01 ~ 2023.09.31</div>
							<div class="link">참여하기</div>
							<div class="ing pos_a">진행중</div>
                        </div>
                    </div>
					 <div class="item box_02 pos_r">
                        <img src="${pageContext.request.contextPath}/resources/img/thum_img.jpg" alt="">
                       <div class="sul_box">
                            <div class="txt font_noto">살아있는 영어로 가는...</div>
                            <div class="sul"><span class="gray_10">응답사례 : </span>700 포인트 리워드</div>
							<div class="sul"><span class="gray_10">응답시간 : </span> 약7분내외(10문항) </div>
                            <div class="date"><span class="gray_10">응답기간 : </span>2023.09-01 ~ 2023.09.31</div>
							<div class="link">참여하기</div>
							<div class="end pos_a">진행마감</div>
                        </div>
                    </div>
					 <div class="item box_02 pos_r">
                        <img src="${pageContext.request.contextPath}/resources/img/thum_img.jpg" alt="">
                        <div class="sul_box">
                            <div class="txt font_noto">살아있는 영어로 가는...</div>
                            <div class="sul"><span class="gray_10">응답사례 : </span>700 포인트 리워드</div>
							<div class="sul"><span class="gray_10">응답시간 : </span> 약7분내외(10문항) </div>
                            <div class="date"><span class="gray_10">응답기간 : </span>2023.09-01 ~ 2023.09.31</div>
							<div class="link">참여하기</div>
							<div class="ing pos_a">진행중</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 설문리스트 끝 -->












<div class="pad_35"></div>


<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">처음</span>오셨나요?</div>
<div class="s_txt_tit">CN패널설문은 포인트 리워드를 위해 로그인 후 참여하실수 있습니다.</div>
</div>



<div class="container">
    <div class="row">
        <div class="col-sm-6">
        <div class="cnpnel font_noto f_wet_03">
            <div class="flexbox align_c gray_10">
                <div class="item box_01 pointer" onclick="location.href='/view/subpage/view.do?idx=1'">
                    <i class="las la-bullhorn"></i>
                    <div class="txt font_noto">패널이란</div>
                    창날패널이 무었인가요?
                </div>
                <div class="item box_01 pointer" onclick="location.href='/view/subpage/view.do?idx=2'">
                    <i class="las la-thumbs-up"></i>
                    <div class="txt font_noto">포인트 사용방법</div>
                    포인트 사용방법 안내
                </div>
                <div class="item box_01 pointer" onclick="location.href='/user/product/list.do'">
                    <i class="las la-gift"></i>
                    <div class="txt font_noto">사은품안내</div>
                    다양한 사은품 혜택 안내
                </div>
            </div>
        </div>
    </div>
    <div class="col-sm-6">
        <div class="cnpnel font_noto f_wet_03 t_spa_00">
            <div class="flexbox align_c gray_10">
                <div class="item box_01">
                   <div class="counter" data-count="23">0</div>
				   <div class="txt font_noto t_spa_00">YEAR</div>
					AS OF 23 CHANGNAL PANEL
                </div>
                <div class="item box_01">
                    <div class="counter" data-count="96">0</div>
				   <div class="txt font_noto t_spa_00">%</div>
					PROJECT PROGRESS
                </div>
                <div class="item box_01">
                    <div class="counter" data-count="235">0</div>
				   <div class="txt font_noto t_spa_00">CLIENT</div>
					CUMULATIVE CLIENT
                </div>
            </div>
        </div>
    </div>
    </div>
</div>



<script>
$('.counter').each(function() {
  var $this = $(this),
      countTo = $this.attr('data-count');
  
  $({ countNum: $this.text()}).animate({
    countNum: countTo
  },
 
  {

    duration: 8000,
    easing:'linear',
    step: function() {
      $this.text(Math.floor(this.countNum));
    },
    complete: function() {
      $this.text(this.countNum);
      //alert('finished');
    }

  });  
  
  

});

	
</script>



<div class="pad_35"></div>
<!-- cnpnel배너 -->
<div class="row cnpnel_banner m-0">
    <div class="col-sm-6 left">
        <div class="sul_box_01">
			<div class="tit font_noto f_wet_01">설문조사 <span class="f_wet_05 bora_01">의뢰하기</span></div>
			<div class="sul">설문조사나 패널과 관련한 문의가 궁금하신가요?</div>
			<div class="btn" onclick="location.href='/user/board_data/list.do?board_idx=5'">문의하러 <span class="bora_01">바로가기</span></div>
        </div>
    </div>
	<div class="col-sm-6 right">
        <div class="sul_box_02">
			<div class="tit font_noto f_wet_01">나랑 친구랑  <span class="f_wet_05 orange_01">포인트 팡팡</span></div>
			<div class="sul">많은 친구들을 모으면 모을수록 포인트가 쌓입니다.</div>
			<div class="btn" onclick="location.href='/view/subpage/view.do?idx=2'"><img src="${pageContext.request.contextPath}/resources/img/link_btn.png" alt=""></div>
        </div>
    </div>
</div>
<!-- cnpnel배너끝 -->




<!--공통하단-->
<%@ include file="../include/user/footer.jsp" %>
<script type="text/javascript">
</script>