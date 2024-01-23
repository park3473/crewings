<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>아이앤시티 샘플 서버</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=yes, target-densitydpi=medium-dpi">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta property="og:image" content="${pageContext.request.contextPath}/resources/img/kakao_bg.png" />

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<!-- sample 프로젝트 -->
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" >
<link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/popper.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/common.js"></script>

<!-- sweetalert2 -->
<script src="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/sweetalert/sweetalert2.min.css">
<script src="${pageContext.request.contextPath}/resources/sweetalert/jquery-1.12.4.js"></script>

<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.css"> -->
<!--  <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor/ckcontent.css"> -->

<!-- 추가 css -->
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/basic_style.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/menu.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/navi.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home_style.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/animate.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/aos.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.carousel.min.css">
<link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.min.css">

<!-- 추가 js -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/owl.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/imageMapResizer.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/js_cont.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/navi.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/aos.js"></script>


<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

</head>

<body>
<div>

</div>
<!-- Global site tag (gtag.js) - Google Analytics -->
<script src="${pageContext.request.contextPath}/resources/js/gtag.js"></script>
<script>
    AOS.init({
        easing:'ease-out-back',
        duration:1000,
		 once: true
    }); 
</script>  

