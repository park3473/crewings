<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
</head>

<style>
	#bootstrap-data-table tr th{
	
	text-align: center;
	
	}
</style>

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
                        <div class="sc_con">
                            <div class="title">
                                <span></span>
                                <span>주문 관리</span>
                            </div>
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="number">번호</th>
                                        <th class="level">상태</th>
                                        <th class="type">상품이름</th>
                                        <th class="level">주문자</th>
                                        <th class="level">가격</th>
                                        <th class="level">신청일</th>
                                        <th class="level">비고</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.idx}"  >
                                        <td>${model.itemtotalcount - (status.index + model.page *  model.itemcount)}</td>
                                        <td>
                                        	<c:choose>
                                        		<c:when test="${item.type == '3' }">완료</c:when>
                                        		<c:when test="${item.type == '2' }">처리대기</c:when>
                                        		<c:when test="${item.type == '1' }">거절</c:when>
                                        		<c:when test="${item.type == '0' }">신청</c:when>
                                        	</c:choose>
                                        </td>
                                        <td>${item.product_name }</td>
                                        <td>${item.member_id }</td>
                                        <td>${item.product_price }</td>
                                        <td>
                                            ${fn:substring(item.create_tm,0,11)}
                                        </td>
                                        <td>
                                        	<button type="button" onclick="orderUpdateModal('${item.idx}','${item.type}','${item.category}','${item.coment}','${item.product_price}')">관리</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <!-- 
                            <div class="page_seach">
                                <div>
                                    <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                        <option value="ALL">전체</option>
                                        <option value="type" <c:if test="${model.SEARCH_TYPE == 'type'}">selected</c:if>>상태</option>
                                        <option value="level"  <c:if test="${model.SEARCH_TYPE == 'level'}">selected</c:if>>분류</option>
                                        <option value="member_id" <c:if test="${model.SEARCH_TYPE == 'member_id'}">selected</c:if>>아이디</option>
                                        <option value="name" <c:if test="${model.SEARCH_TYPE == 'name'}">selected</c:if>>이름</option>
                                    </select>
                                    <input style="width: 191px;" type="text" value="${model.SEARCH_TEXT }" name="SEARCH_TEXT" id="SEARCH_TEXT" >
                                    <button type="button" value="검색" onClick="searchBtnClick()">검색</button>
                                </div>
                            </div>
							-->
                            <!--관리자 버튼 end-->


                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <ul class="page">
                                   <%@ include file="../include/pageing.jsp" %>
                                </ul>
                            </nav>
                            <!--페이지 넘버 end-->
                        </div>
                    </section>
                    <!--본문 내용 end-->
                </div>
            </div>
        </div>
    </section>
    <!--본문 end-->

	<form action="/" name="orderUpdateForm"  id="orderUpdateForm" style="display:none;">
		<input type="hidden" name="idx" value="">
		<input type="hidden" name="type" value="">
	</form>

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->

</body>
<script>

//해당 메뉴 번호
$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(5).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(5).css({
	    backgroundColor: "#fff"
	});
});

function orderUpdateModal(idx, type, category, coment, product_price) {
    Swal.fire({
        title: '주문 상태 변경',
        html: 
            '<div>' +
                '<label>주문 번호: </label>' +
                '<span>' + idx + '</span>' +
            '</div>' +
            '<div>' +
                '<label>주문 상태: </label>' +
                '<select id="order-type">' +
                    '<option value="0"' + (type === '0' ? ' selected' : '') + '>신청</option>' +
                    '<option value="1"' + (type === '1' ? ' selected' : '') + '>거절</option>' +
                    '<option value="2"' + (type === '2' ? ' selected' : '') + '>처리대기</option>' +
                    '<option value="3"' + (type === '3' ? ' selected' : '') + '>처리완료</option>' +
                '</select>' +
            '</div>' +
            '<div>' +
                '<label>주문자 요청사항: </label>' +
                '<span>' + coment + '</span>' +
            '</div>' +
            '<div>' +
                '<label>가격: </label>' +
                '<span>' + product_price + '원</span>' +
            '</div>',
        showCancelButton: true,
        confirmButtonText: '변경하기',
        cancelButtonText: '취소',
        preConfirm: () => {
            const selectedType = document.getElementById('order-type').value;
            return { idx: idx, type: selectedType };
        }
    }).then((result) => {
        if (result.isConfirmed) {
            orderUpdate(result.value.idx, result.value.type);
        }
    });
}

function orderUpdate(idx, type) {
    // 여기에 주문 업데이트 로직 구현
   var result = confirm('정말 변경하시겠습니까?');
    
    if(!result){
    	return;
    }
    
    $('[name=idx]').val(idx);
    $('[name=type]').val(type);
    
    var formData = $('#orderUpdateForm').serialize();
	
	$.ajax({
		url : '/admin/order/update.do',
		type : 'POST',
		data : formData,
		success : function(status , success , xhr){
			
			console.log('order_update : success');
			
			alert('주문 상태 변경이 완료되었습니다.');
			location.href='/admin/index.do';
			
		},
		error : function(status , error , xhr){
			
			console.log('order_update : fail');
			
		}
	})
    
}



</script>

</html>

