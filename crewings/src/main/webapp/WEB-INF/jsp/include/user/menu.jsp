<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- 메뉴형식 -->

<style>
.line {border-bottom:1px #dedede solid;background:#f4f4f4}
.line .top_inner{max-width:1570px;margin:0 auto}
.line .top_inner a{padding:5px 30px;border-left:1px #dedede solid;border-right:1px #dedede solid;margin-left:-1px;display:inline-block}
.line .top_inner .bg_01{background:#fff}

</style>

<!--메뉴-->

<div class="util-menu line">
<div class="top_inner">
    <ul>
        <li>
		<span class="" class="bg_01"><a href="">HOME</a></span>
        <span class="float_r">
        	<c:if test="${sessionScope.Login != 'OkOk' }">
        	<a href="/view/login.do" class="bg_01">관리자 로그인</a><!--<a href="/view/agree.do">회원가입</a>-->
        	</c:if>
        	<c:if test="${sessionScope.Login == 'OkOk' }">
        	<a href="/view/logout.do" class="bg_01">로그아웃</a><c:if test="${sessionScope.UserLevel == '73' }"><a href="/admin/exam/list.do">관리자</a></c:if>
        	</c:if>
        </span>
		</li>
    </ul>
</div>
</div>


<div id="wrapper" class="main">
    <header id="header" class="header color-bright">
    <div class="header-inner">
        <!--모바일용로고-->
        <div class="head-title">
            <h1 class="main-logo"><a href="/"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a></h1>
        </div>
        <!--모바일용로고-->
        <!--로고-->
        <strong class="logo"><a href="/"><img src="${pageContext.request.contextPath}/resources/img/logo_white.png"></a></strong>
        <!--로고끝-->
        <!--모바일메뉴버튼-->
        <button type="button" class="btn-gnb-open"><span class="bar"></span><span class="blind">메뉴열기</span></button>
        <!--모바일메뉴버튼-->
        <nav id="nav">
        <div class="nav-inner">
            <div class="util-menu">
                <!--인사말및 로고처리-->
                <div class="welcome">
                    Welcome to THERASET®
                </div>
                <!--인사말및 로고처리끝-->
                <!--로그인-->
                <!--로그인끝-->
                <!--셀렉트박스-->
                <div class="menu">
                    <div class="lang-list">
                        <div class="lang">
                            <a href="#page" class="select-link"><span class="blind">언어 선택</span></a>
                            <span class="selected"><i class="las la-search"></i></span>
                        </div>
                        <ul class="select-lang hide">
                            <li>
                            <!--<a href="/"><span>English</span></a>-->
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <!--셀렉트박스끝-->

            <!--메뉴-->
            <div class="gnb-area">
                <ul class="gnb-menu">
                    <li>
                    <a href="#"><span>CN패널</span></a>
                    <ul class="depth2">
                        <li><a href="/view/subpage/view.do?idx=1"><span>패널소개</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/view/subpage/view.do?idx=2"><span>포인트사용방법</span></a></li>
                    </ul>
                    </li>
                    <li>
                    <a href="#"><span>설문참여</span></a>
                    <ul class="depth2">
                        <li><a href="/user/exam/list.do"><span>설문조사</span></a></li>
                    </ul>
                    </li>
                    <!-- 
                    <li>
                    <a href="#"><span>사은품안내</span></a>
                    <ul class="depth2">
                        <li><a href="/user/product/list.do"><span>사은품리스트</span></a></li>
                    </ul>
                    </li>
                    -->
                    <li>
                    <a href="#"><span>패널도우미</span></a>
                    <ul class="depth2">
                        <li><a href="/user/board_data/list.do?board_idx=1"><span>공지사항</span></a></li>
                        <li><a href="/user/board_data/list.do?board_idx=3"><span>FAQ</span></a></li>
                        <li><a href="/user/board_data/list.do?board_idx=4"><span>광고문의</span></a></li>
                        <li><a href="/user/board_data/list.do?board_idx=5"><span>의뢰하기</span></a></li>
                    </ul>
                    </li>
                    <!-- 
                    <li>
                    <a href="#"><span>마이CN패널</span></a>
                    <ul class="depth2">
                        <li><a href="/user/mypage/view.do"><span>마이CN패널</span></a></li>
                        <li><a href="/user/order/list.do?member_id=${sessionScope.UserId }"><span>상품 신청 리스트</span></a></li>
                    </ul>
                    </li>
                    -->
                </ul>
            </div>
            <!--메뉴끝-->
        </div>
        <button type="button" class="btn-gnb-close ico-close"><span class="blind">메뉴닫기</span></button>
        </nav>
    </div>
    </header>
</div>
<!--메뉴끝-->

<!-- 메뉴 형식 -->

<!-- 메뉴는 기초 만들어두시면 그에 맞게 개발될 예정 -->