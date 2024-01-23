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
            <li <c:if test="${model.before.category == '' }">class="is-active"</c:if> ><a href="#tab01"  onclick="location.href='/user/product/list.do'">전체</a></li>
            <li  <c:if test="${model.before.category == '1' }">class="is-active"</c:if> ><a href="#tab02" onclick="location.href='/user/product/list.do?category=1'">상품권.생활.도서</a></li>
            <li <c:if test="${model.before.category == '2' }">class="is-active"</c:if> ><a href="#tab03" onclick="location.href='/user/product/list.do?category=2'">커피.음료</a></li>
            <li  <c:if test="${model.before.category == '3' }">class="is-active"</c:if> ><a href="#tab04" onclick="location.href='/user/product/list.do?category=3'">베이커리.도넛.떡</a></li>
            <li  <c:if test="${model.before.category == '4' }">class="is-active"</c:if> ><a href="#tab05" onclick="location.href='/user/product/list.do?category=4'">아이스크림.빙수</a></li>
            <li <c:if test="${model.before.category == '5' }">class="is-active"</c:if> ><a href="#tab06" onclick="location.href='/user/product/list.do?category=5'">치킨.버거.피자</a></li>
            <li  <c:if test="${model.before.category == '6' }">class="is-active"</c:if> ><a href="#tab07" onclick="location.href='/user/product/list.do?category=6'">편의점.마트</a></li>
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
    
    <!-- 전체  -->
    <div id="tab01" class="tab-contents">
        <div class="cnpnel font_noto f_wet_03">
            <div class="flexbox">
                <c:forEach var="item" items="${model.list }"  varStatus="status">
                <div class="item_02 box_02">
                    <img style="heigth:252px;" src="/resources/upload/product/image/${item.image }" alt="">
                    <div class="sul_box">
                        <div class="txt font_noto">${item.name }</div>
                        <div class="sul"><span class="gray_10">사용가능지역 : </span><span id="location_${status.index }"></span></div>
                        <script type="text/javascript">
                        var location_list = [];
                    	var location_ = '${item.location}';
                    	var index = '${status.index}';
                    	var location_val = '';
                    	location_list = location_.split('%23');
                    	location_val += location_list[1];
                    	
                    	for(var i=2;i < location_list.length; i++){
                    		location_val += (','+location_list[i]);
                    	}
                    	$('#location_'+index).append(location_val);
                        </script>
                        <div class="sul"><span class="red_01"><strong>${model.list[0].price }P</strong></div>
                        <div class="link pointer" data-toggle="modal" data-target="#myModal_03"  onclick="ProductOrder('${item.name}','${item.price}','${item.image}','${item.idx}')">구입하기</div>
                    </div>
                </div>
                </c:forEach>
            </div>
        </div>
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
                    <div class="total font_noto">차감포인트 : <span class="red_01" name="product_point"></span></div>
                    <div class="img max_img"><img name="product_img" src="/resources/upload/product/image/" alt=""></div>
					<div class="tit" name="product_name"></div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="orderInsert()">구매하기</button>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 사은품모달 끝 -->

<form action="/" name="orderForm" id="orderForm" style="display:none;">
	<input type="hidden" name="product_idx" value="">
	<input type="hidden" name="product_price" value="">
	<input type="hidden" name="product_name" value="">
	<input type="hidden" name="member_id" value="${sessionScope.UserId }">
	<input type="hidden" name="member_name" value="${sessionScope.UserName }">
	<input type="hidden" name="member_idx" value="${sessionScope.UserIdx }">
	<input type="hidden" name="type" value="0">
	<input type="hidden" name="category" value="0">
	<input type="hidden" name="coment" value="">
</form>

<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

	function ProductOrder(name , price , image , product_idx){
		
		$('[name=product_idx]').val(product_idx);
		$('[name=product_price]').val(price);
		$('[name=product_point]').html(price);
		$('[name=product_name]').val(name);
		$('[name=product_img]').attr('src','/resources/upload/product/image/'+image);
		$('[name=product_name2]').html(name);
		
		
	}
	
	function orderInsert(){
		
		var result = confirm('구매신청 하시겠습니까?');
		
		if(!result){
			return;
		}
		
		var formData = $('#orderForm').serialize();
		
		$.ajax({
			url : '/user/order/insert.do',
			type : 'POST',
			data : formData,
			success : function(status , success , xhr){
				
				console.log('product_order : success');
				
				alert('상품신청이 완료되었습니다.');
				location.href='/index.do';
				
			},
			error : function(status , error , xhr){
				
				console.log('product_order : fail');
				
			}
		})
		
		
		
	}

</script>