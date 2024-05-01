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
                                <span>자가진단 관리</span>
                            </div>
                            
                            <!--관리자 버튼-->
                            <div class="page_seach">
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                    	<li class="delete">
                                        	<a href="#" onclick="ExamExcelDown('${model.before.idx}')">결과 출력</a>
	                                    </li>
	                                </ul>
                                </div>
                            </div>
                            <!--관리자 버튼 end-->
                            
                            <div class="table_wrap">
                                <table id="bootstrap-data-table">
                                    <tr>
                                        <th class="number">번호</th>
                                        <!-- <th class="name">작성자</th> -->
                                        <th class="category">추가문의</th>
                                    </tr>
                                    <c:forEach var="item" items="${model.list}" varStatus="status">
                                    <tr data-role="button" data-id="${item.idx}"  >
                                        <td>${model.itemtotalcount - (status.index + model.page *  model.itemcount)}</td>
                                        <!-- <td>${item.name }</td> -->
                                        <td style="text-align:left">${item.inquiries }</td>
                                    </tr>
                                    </c:forEach>
                                </table>
                            </div>

                            <!--페이지 넘버-->
                            <nav class="paging_number">
                                <ul class="page">

			<c:if test="${model.page > 0}"> 
				<c:if test="${model.itempagestart-model.itemcount > 0}">
	                 <li id="first_a"><a href="javascript:pageChanged(0, 0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
	                 <li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
				</c:if>
				<c:if test="${model.itempagestart-model.itemcount <= 0}">
					<li id="first_a"><a href="javascript:pageChanged(0,0);"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
					<li id="prev_a"><a href="javascript:pageChanged(${model.page-1}, ${model.itempageend});"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
				</c:if>
			</c:if>

			<c:if test="${model.page <= 0}">
				  <li id="first_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/first_arrow.png" alt="맨처음"></a></li>
			      <li id="prev_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/prev_arrow.png" alt="뒤로"></a></li>
			</c:if>
			
			<c:if test="${model.itempageend > 0}">
				<c:forEach var="i" begin="${model.itempagestart}" end="${model.itempageend}">
					<c:choose>
						<c:when test="${model.page == i }">
							<li class="number page_active"><a href="#">${i+1}</a></li>
						</c:when>
						<c:otherwise>
							<li class="number"><a href="javascript:pageChanged(${i}, ${model.itempageend});">${i+1}</a></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</c:if>

			<c:if test="${model.itempageend == 0}">
				<li class="number">1</li>
			</c:if>
			<c:if test="${model.itempageend < 0}">
				<li class="number">1</li>
			</c:if>
			
			<c:if test="${model.itemcount < model.itemtotalcount/(model.page+1)}">
				<li id="next_a"><a href="javascript:pageChanged(${model.page+1}, ${model.itemtotalpage});"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
			</c:if>
			<c:if test="${model.itemcount >= model.itemtotalcount/(model.page+1)}">
				<li id="next_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/next_arrow.png" alt="다음"></a></li>
			</c:if>
			<c:choose>
				<c:when	test="${model.itemcount < model.itemtotalcount/(page+1)}">
				<li id="end_a"><a href="javascript:pageChanged(${model.itemtotalpage-1}, ${model.itemtotalpage-1});"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
					
				</c:when>
				<c:otherwise>
				<li id="end_a"><a href="#"><img src="${pageContext.request.contextPath}/resources/img/end_arrow.png" alt="맨끝"></a></li>
				</c:otherwise>
			</c:choose>
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
<script src="https://cdn.jsdelivr.net/npm/qrcodejs@1/qrcode.min.js"></script>
<script>

function searchBtnClick(){
	
	 URL = './list.do';
	 URL = URL + "?idx=${model.before.idx}";
     URL = URL + "&PAGE=0";
     URL = URL + "&ITEM_COUNT=" + '10';

     URL = URL + "&SEARCH_TEXT=" + encodeURI($('#SEARCH_TEXT').val());
     URL = URL + "&SEARCH_TYPE=" + $('#SEARCH_TYPE').val();

	location.href = URL;
	
}

$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
});

</script>
			<script>			
function pageChanged(page, endpage)
{
	if (page < 0) 
	{
		page = 0;
	}
	if (endpage < 0){
		endpage = 0;
	}
	if (page >= endpage) {
		page = endpage;
	}
	
	
	var URL = "${requestURI}?idx=${model.before.idx}&PAGE="+page;

	
	if('${model.beforeDomain.ITEM_COUNT}' == '')
	{
		URL = URL + "&ITEM_COUNT=" + '10';
	}else
	{
		URL = URL + "&ITEM_COUNT=" + '${model.beforeDomain.ITEM_COUNT}';
	}
	

	URL = URL + "&SEARCH_TEXT=" + encodeURI('${model.beforeDomain.SEARCH_TEXT}');
	URL = URL + "&SEARCH_TYPE=" + '${model.beforeDomain.SEARCH_TYPE}';
	
	
	location.href = URL;
}

function ExamExcelDown(idx , name){
	
	URL = '/admin/exam/result/ExcelDown.do'
	
	URL += '?idx=';
	
	URL += idx;
	
	URL += '&name=';
	
	URL += idx;
	
	window.location.href = URL;
	
}


</script>
</html>

