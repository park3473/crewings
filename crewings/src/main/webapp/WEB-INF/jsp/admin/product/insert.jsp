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
    
    #location_div{
    
    margin-top : 10px;
    
    }
    
    .location_list_div{
    
    margin: 0;
    margin-top : 10px;
    margin-left : 10px;
    padding: 6px 12px;
    font-size: 14px;
    border: 1px solid #37507d;
    border-radius: 18px;
    font-weight: 400;
    font-stretch: normal;
    font-style: normal;
    line-height: 1.21;
    letter-spacing: normal;
    color: #fff;
    background-color: #37507d;
    transition: background-color .1s,border-color .1s;
    white-space: nowrap;
    
    }
</style>
<!-- ckeditor필요한 부분 -->

<body>
<!--헤더-->
<%@ include file="../include/menu.jsp" %>
<!--헤더 end-->


<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div>
                    <form action="./insert.do" method="post" name="insertForm" id="insertForm" enctype="multipart/form-data">
                        <input type="hidden"  name="csrf" value="${CSRF_TOKEN}" />
                        <input type="hidden" id="image_change_bool" name="image_change_bool" value="false">
                        <input type="hidden" id="location" name="location">
                        <div class="sc_con" id="div_con">
                            <div class="title">
                                <span></span>
                                <span>상품 등록</span>
                            </div>
                            <div class="member_register_wrap">
                                <div class="member_input_wrap">
                                    <ul class="member_input">
                                        <li>
                                            <span class="list_t">상품 명</span>
                                            <input class="input_size mr" type="text" id="" name="name" value="" >
                                        </li>
                                        <li>
                                        	<span class="list_t">상품 가격</span>
                                        	<input class="input_size mr" type="text" name="price"  id="" >
                                        </li>
                                        <li>
                                        	<span class="list_t">상품 카테고리</span>
                                        	<select name="category" class="input_title" >
                                        		<option value="">카테고리를 선택해주세요</option>
                                        		<option value="1">상품권.생활.도서</option>
                                        		<option value="2">커피.음료</option>
                                        		<option value="3">베이커리.도넛.떡</option>
                                        		<option value="4">아이스크림.빙수</option>
                                        		<option value="5">치킨.버거.피자</option>
                                        		<option value="6">편의점.마트</option>
                                        	</select>
                                        </li>
                                        <li>
                                        	<span class="list_t">사용가능 지역</span>
                                        	<select id="location_list">
											  <option value="">--시/도 선택--</option>
											  <option value="서울">서울특별시</option>
											  <option value="부산">부산광역시</option>
											  <option value="대구">대구광역시</option>
											  <option value="대전">대전광역시</option>
											  <option value="울산">울산광역시</option>
											  <option value="경기">경기도</option>
											  <option value="강원">강원도</option>
											  <option value="충북">충청북도</option>
											  <option value="충남">충청남도</option>
											  <option value="전북">전라북도</option>
											  <option value="전남">전라남도</option>
											  <option value="경북">경상북도</option>
											  <option value="경남">경상남도</option>
											  <option value="제주">제주특별자치도</option>
											</select>
											<div id="location_div">
											</div>
                                        </li>
                                        <li>
                                        	<div style="width:227px;heigth:295px;">
											<img style="width:100%;height:100%;object-fit:cover" id="preview_img" src="" alt="no"/>
											</div>
                                           	<span class="list_t">상품 이미지 선택</span>
                                            <input type="file" id="file1" name="file1" onchange="changeValue(this)">
											<input type="hidden" id="image" name="image">
                                        </li>
                                        <li>
                                        	<span class="list_t">코멘트</span>
                                        	<input class="input_title" type="text" name="coment"  id="" >
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <!--저장하기 버튼-->
                        <div class="register_btn_area">
                            <div class="register_btn_con">
                                <a class="storage" href="javascript:insertClick()"> 저장</a>
                                <a class="cancel" href="javascript:history.back()">취소하기</a>
                            </div>
                        </div>
                        <!--저장하기 버튼 end-->
                        </form>
                    </div>
                </section>
                <!--본문 내용 end-->
            </div>
        </div>
    </div>
</section>
<!--본문 end-->

<!--푸터-->
<footer>
<%@ include file="../include/footer.jsp" %>
</footer>
<!--푸터 end-->

<!--  JQuery  -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-ui.min.js"></script>

<script type="text/javascript">

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(4).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(4).css({
	    backgroundColor: "#fff"
	});
});

$(document).ready(function()
{
//		 $("input:radio[name=TYPE]").click(function(){
//		        if($("input[name=TYPE]:checked").val() == "1"){
//		        	location.href='./insert.do?TYPE=1';
//		        }else if($("input[name=TYPE]:checked").val() == "2"){
//		        	location.href='./insert.do?TYPE=2';					
//		        }
//		        $("input[name=radio]:checked")
//		    });
});

function insertClick()
{

	if($('#title').val() == '')
	{
		alert('제목을 입력 하여 주세요');
		return;
	}

	$('#insertForm').submit();
}

//파일 이름 변경 함수
function changeValue(obj){
    var fileObj = obj.value;
    var pathHeader , pathMiddle, pathEnd, allFilename, fileName, extName;
    pathHeader = fileObj.lastIndexOf("\\");
    pathMiddle = fileObj.lastIndexOf(".");
    pathEnd = fileObj.length;
    fileName = fileObj.substring(pathHeader+1, pathMiddle);
    extName = fileObj.substring(pathMiddle+1, pathEnd);
    allFilename = fileName+"."+extName;

    $('#image').val(allFilename);
    
    $('#image_change_bool').val('ture');
}

//프로필 사진 미리보기
function preview_img(input){
	const reader = new FileReader();
	reader.onload = e => {
		const previewImage = document.getElementById('preview_img');
		previewImage.src = e.target.result
	}
	
	reader.readAsDataURL(input.files[0]);
	
}

//프로필 사진 등록 함수 이벤트 설정
const inputImage = document.getElementById('file1')
inputImage.addEventListener('change' , e => {
	preview_img(e.target);
})

$(document).ready(function(){
  $('#location_list').change(function(){
    var selectedValue = $(this).val();
    console.log(selectedValue); // This will log the value of the selected option
    var html = `<span class="location_list_div">`+selectedValue+`</span>`;
    $('#location_div').append(html);
    
    var location = $('[name=location]').val();
    
    selectedValue = '%23' + selectedValue;
    
    location += selectedValue;
    
    $('[name=location]').val(location);
    
  });
});

</script>

</body>
</html>
