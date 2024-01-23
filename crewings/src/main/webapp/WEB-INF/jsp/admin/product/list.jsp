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
                                <span>상품 관리</span>
                            </div>
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="number idx">상품 번호</th>
                                        <th class="type">상품 명</th>
                                        <th class="category">상품 카테고리</th>
                                        <th class="price">상품 가격</th>
                                        <th class="level">상품 등록날짜</th>
                                        <th class="update">상품 수정날짜</th>
                                        <th class="update">상품 관리</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.idx}"  >
                                        <td>${model.itemtotalcount - (status.index + model.page *  model.itemcount)}</td>
                                        <td>${item.name }</td>
                                        <td>
                                        	<c:choose>
                                        		<c:when test="${item.category == '1' }">상품권.생활.도서</c:when>
                                        		<c:when test="${item.category == '2' }">커피.음료</c:when>
                                        		<c:when test="${item.category == '3' }">베이커리.도넛.떡</c:when>
                                        		<c:when test="${item.category == '4' }">아이스크림.빙수</c:when>
                                        		<c:when test="${item.category == '5' }">치킨.버거.피자</c:when>
                                        		<c:when test="${item.category == '6' }">편의점.마트</c:when>
                                        	</c:choose>
                                        </td>
                                        <td>${item.price }</td>
                                        <td>
                                            ${fn:substring(item.create_tm,0,11)}
                                        </td>
                                        <td>
                                            ${fn:substring(item.update_tm,0,11)}
                                        </td>
                                        <td>
                                        	<button type="buttton"  onclick="location.href='/admin/product/view.do?idx=${item.idx}'">관리</button>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--관리자 버튼-->
                            <div class="page_seach">
                                <div>
                                    <select id="SEARCH_TYPE" name="SEARCH_TYPE">
                                        <option value="ALL">전체</option>
                                        <option value="type" <c:if test="${model.SEARCH_TYPE == 'category'}">selected</c:if>>카테고리</option>/option>
                                        <option value="name" <c:if test="${model.SEARCH_TYPE == 'name'}">selected</c:if>>상품 명</option>
                                    </select>
                                    <input style="width: 191px;" type="text" value="${model.SEARCH_TEXT }" name="SEARCH_TEXT" id="SEARCH_TEXT" >
                                    <button type="button" value="검색" onClick="searchBtnClick()">검색</button>
                                </div>
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                    <li class="delete">
                                        <a href="./insert.do">상품 등록</a>
                                    </li>
                                </ul>
                                </div>
                            </div>

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

    <!--푸터-->
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
    <!--푸터 end-->

</body>
<script>

//해당 메뉴 번호
$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(4).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(4).css({
	    backgroundColor: "#fff"
	});
});

</script>

</html>

