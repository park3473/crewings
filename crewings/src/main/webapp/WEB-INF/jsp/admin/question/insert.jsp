<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
</head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- ckeditor필요한 부분 -->
<script src="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/ckeditor/ckeditor.css">
<script src="https://ckeditor.com/apps/ckfinder/3.5.0/ckfinder.js"></script>
<style>
	/*admin css 와 ckeditor css 충돌나서 바꿔버림*/
	.member_input_wrap .member_input button {
    margin-left: 0px !important;
	}
	.member_input_wrap .member_input textarea {
    	width: 100%;
    	height: 100%;
    	padding: 0px;
    }
</style>
<!-- ckeditor필요한 부분 -->

<body>
<!--헤더-->
<%@ include file="../include/menu.jsp" %>
<!--헤더 end-->

<!-- 설문 본문 -->
<c:if test="${model.before.category == '0' }">

<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div>
                    <form action="./insert.do" method="post" name="question_insertForm" id="question_insertForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden" name="exam_idx" value="${model.exam_idx }">
                        <input type="hidden" name="question_idx" value="">
                        <input type="hidden" name="question_type" value="new">
                        <input type="hidden" name="category" value="0">
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span> 설문 등록</span>
                            </div>
                            
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                    	<c:if test="${model.exam_idx != 'false' }">
	                                        <li id="list_input_seq">
	                                            <span class="list_t">문항 번호</span>
	                                            <input class="input_size mr" type="text" id="seq" name="seq">
	                                        </li>
                                        </c:if>
                                        <li>
                                        	<span class="list_t">타입</span>
                                        	<input class="input_size mr" type="text" name="type" id="type" list="type_list" >
                                        	<c:if test="${model.TypeList.size() > 0 }">
                                        	<c:forEach items="${model.TypeList }" varStatus="status" var="item">
                                        	<datalist id="type_list">
                                        		<option>${item.type }</option>
                                        	</datalist>
                                        	</c:forEach>
                                        	</c:if>
                                        	<span><button type="button" onclick="question_select()">문제 가져오기</button></span>
                                        </li>
                                        <li>
                                            <span class="list_t">설문 제목</span>
                                            <input class="input_title" type="text" id="name" name="name">
                                        </li>
                                        <li id="select_type_li">
                                            <span class="list_t">설문 타입</span>
                                            <select name="select_type" id="select_type" onchange="select_type_change()">
                                            	<option value="false" selected="selected">타입을 선택해 주세요</option>
                                            	<option value="1">다지선다</option>
                                            </select>
                                        </li>
                                        <li>
                                        	<span class="list_t">설문 내용</span>
                                        	<textarea name="content" id="editor"></textarea>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div id="select_box">
                    	<form action="./insert.do" method="post" name="select_insertForm" id="select_insertForm" enctype="multipart/form-data" style="display:none">
                    		<input type="hidden" name="select_confrim" value="false">
                    		<div class="member_register_wrap">
	                    		<div class="title">
	                                <span>선택지 등록</span>
	                            </div>
	                            <div class="member_input_wrap" id="select_input_warp">
	                            </div>
                            </div>
                    	</form>
                    	
                    	<!--저장하기 버튼-->
                        <div class="register_btn_area">
                            <div class="register_btn_con" id="admin_button">
                                <button class="storage" onclick="select_form_open()">선택지 작성</button>
    							<button class="storage" onclick="history.back()">뒤로 가기</button>
                            </div>
                        </div>
                        <!--저장하기 버튼 end-->
                    	
                    </div>
                </section>
                <!--본문 내용 end-->
            </div>
        </div>
    </div>
</section>
<!--본문 end-->
<!--본문 end-->

</c:if>



<!-- 문제 본문 -->
<c:if test="${model.before.category == '1' }">

<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div>
                    <form action="./insert.do" method="post" name="question_insertForm" id="question_insertForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden" name="exam_idx" value="${model.exam_idx }">
                        <input type="hidden" name="question_idx" value="">
                        <input type="hidden" name="question_type" value="new">
                        <input type="hidden" name="category" value="1">
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span> 문제 등록</span>
                            </div>
                            
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                    	<c:if test="${model.exam_idx != 'false' }">
	                                        <li id="list_input_seq">
	                                            <span class="list_t">문항 번호</span>
	                                            <input class="input_size mr" type="text" id="seq" name="seq">
	                                        </li>
                                        </c:if>
                                        <li>
                                        	<span class="list_t">타입</span>
                                        	<input class="input_size mr" type="text" name="type" id="type" list="type_list" >
                                        	<c:if test="${model.TypeList.size() > 0 }">
                                        	<c:forEach items="${model.TypeList }" varStatus="status" var="item">
                                        	<datalist id="type_list">
                                        		<option>${item.type }</option>
                                        	</datalist>
                                        	</c:forEach>
                                        	</c:if>
                                        	<span><button type="button" onclick="question_select()">문제 가져오기</button></span>
                                        </li>
                                        <li>
                                            <span class="list_t">문제 제목</span>
                                            <input class="input_title" type="text" id="name" name="name">
                                        </li>
                                        <li>
                                            <span class="list_t">진단 목표</span>
                                            <input class="input_title" type="text" id="objectives" name="objectives">
                                        </li>
                                        <li id="select_type_li">
                                            <span class="list_t">답안 타입</span>
                                            <select name="select_type" id="select_type" onchange="select_type_change()">
                                            	<option value="false" selected="selected">타입을 선택해 주세요</option>
                                            	<option value="0" >OX 퀴즈</option>
                                            	<option value="1">다지선다</option>
                                            </select>
                                        </li>
                                        <li id="select_val_li">
                                            <span class="list_t">답안</span>
                                            <select name="select_val" id="select_val">
                                            	<option value="O">O</option>
                                            	<option value="X">X</option>
                                            </select>
                                        </li>
                                        <li>
                                        	<span class="list_t">문제 내용</span>
                                        	<textarea name="content" id="editor"></textarea>
                                        </li>
                                        <li>
                                            <span class="list_t">해설</span>
                                            <input class="input_title" type="text" id="solution" name="solution">
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        </form>
                    </div>
                    <div id="select_box">
                    	<form action="./insert.do" method="post" name="select_insertForm" id="select_insertForm" enctype="multipart/form-data" style="display:none">
                    		<input type="hidden" name="select_confrim" value="false">
                    		<div class="member_register_wrap">
	                    		<div class="title">
	                                <span>답안 등록</span>
	                            </div>
	                            <div class="member_input_wrap" id="select_input_warp">
	                            </div>
                            </div>
                    	</form>
                    	
                    	<!--저장하기 버튼-->
                        <div class="register_btn_area">
                            <div class="register_btn_con" id="admin_button">
                                <button class="storage" onclick="select_form_open()">답안 작성</button>
    							<button class="storage" onclick="history.back()">뒤로 가기</button>
                            </div>
                        </div>
                        <!--저장하기 버튼 end-->
                    	
                    </div>
                </section>
                <!--본문 내용 end-->
            </div>
        </div>
    </div>
</section>
<!--본문 end-->

</c:if>

<!--푸터-->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
<!--푸터 end-->

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>



</body>
</html>
<script type="module" >
import editor from '/resources/ckeditor/editor.js'

// CKEditor 인스턴스를 저장할 변수를 정의합니다.
window.ckeditorInstance;

$(document).ready(function () {
    editor("#editor").then(editor => {
        // CKEditor 인스턴스를 저장합니다.
        window.ckeditorInstance = editor;

        // some code..
    })
})



</script>
<script type="text/javascript">

//메뉴창
$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
	
	console.log($('.ck-editor__editable')[0]);
	
	
});

</script>
<c:if test="${model.before.category == '1' }">
<script src="${pageContext.request.contextPath}/resources/js/question.js"></script>
</c:if>
<c:if test="${model.before.category == '0' }">
<script src="${pageContext.request.contextPath}/resources/js/survey.js"></script>
</c:if>