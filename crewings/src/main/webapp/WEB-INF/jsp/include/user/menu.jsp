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

        <span class="float_r"><a href="" class="bg_01">로그인</a><a href="">회원가입</a></span>
		</li>
		

    </ul>
</div>
</div>


<div id="wrapper" class="main">
    <header id="header" class="header color-bright">
    <div class="header-inner">
        <!--모바일용로고-->
        <div class="head-title">
            <h1 class="main-logo"><a href="/cnpnel"><img src="${pageContext.request.contextPath}/resources/img/logo.png"></a></h1>
        </div>
        <!--모바일용로고-->
        <!--로고-->
        <strong class="logo"><a href="/cnpnel"><img src="${pageContext.request.contextPath}/resources/img/logo_white.png"></a></strong>
        <!--로고끝-->
        <!--모바일메뉴버튼-->
        <button type="button" class="btn-gnb-open"><span class="bar"></span><span class="blind">메뉴열기</span></button>
        <!--모바일메뉴버튼-->
        <nav id="nav">
        <div class="nav-inner">
            <div class="util-menu c_none">
                <!--인사말및 로고처리-->
                <div class="welcome">
                    Welcome to THERASET®
                </div>
                <!--인사말및 로고처리끝-->
                <!--로그인-->
                <div class="util-menu-group bottom">
                    <?php if ($is_member) {  ?>
                    <a href="#"><span>정보수정</span></a><span class="gab">ㅣ</span>
                    <a href="#"><span>로그아웃</span></a><span class="gab">ㅣ</span>
                    <?php if ($is_admin) {  ?>
                    <a href="#"><span>관리자</span></a>
                    <?php }  ?>
                    <?php } else {  ?>
                    <a href="#"><span>회원가입</span></a><span class="gab">ㅣ</span>
                    <a href="#"><span>로그인</span></a>
                    <?php }  ?>
                    <a href="/"><span>HOME</span></a><span class="gab">ㅣ</span>
                    <span class="gab">ㅣ</span><a href="#"><span class="blue_01">BOOK-MARK</span></a>
                </div>
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
                        <li><a href="./sub_01a.php"><span>패널소개</span></a></li>
                        <li><a href="<?php echo G5_THEME_URL?>/${pageContext.request.contextPath}/resources/file/sub_01b.php"><span>포인튼사용방법</span></a></li>
                    </ul>
                    </li>
                    <li>
                    <a href="#"><span>설문참여</span></a>
                    <ul class="depth2">
                        <li><a href="./sub_02a.php"><span>설문조사</span></a></li>
                    </ul>
                    </li>
                    <li>
                    <a href="#"><span>사은품안내</span></a>
                    <ul class="depth2">
                        <li><a href="./sub_03a.php"><span>사은품리스트</span></a></li>
                    </ul>
                    </li>
                    <li>
                    <a href="#"><span>패널도우미</span></a>
                    <ul class="depth2">
                        <li><a href="./board_list.php"><span>공지사항</span></a></li>
                        <li><a href="./board_faq.php"><span>FAQ</span></a></li>
                        <li><a href="#"><span>광고문의</span></a></li>
                        <li><a href="#"><span>견적문의</span></a></li>
                    </ul>
                    </li>
                    <li>
                    <a href="#"><span>마이CN패널</span></a>
                    <ul class="depth2">
                        <li><a href="./sub_05a.php"><span>포인트조회</span></a></li>
                        <li><a href="#"><span>나의설문내역</span></a></li>
                    </ul>
                    </li>


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