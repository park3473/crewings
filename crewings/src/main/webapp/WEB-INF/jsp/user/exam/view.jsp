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
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">설문</span>시작</div>
<div class="s_txt_tit">설문 문항은 꼼꼼하게 읽어주시고, 주관식 응답은 자세하게 기입해 주세요.</div>
</div>
<!-- 타이틀 긑 -->

<!-- 설문조사내용 -->
<div class="container cnpnel">
    <div class="row">
        <div class="col-sm-12">
            <div class="start_wrap">
			    <ul>
			        <li><div class="font_noto tit">${model.view.name }</div></li>
			    </ul>
                <ul>
                    <li>
                        <div class="font_noto cont"><span class="f_wet_05">고유번호 : </span>${model.view.idx }</div>
                        <div class="font_noto cont"><span class="f_wet_05">응답기간 : </span>${fn:substring(model.view.start_tm,0,11) } ~ ${fn:substring(model.view.end_tm,0,11) }</div>
                    </li>
                    <li>
                        <div class="font_noto cont"><span class="f_wet_05">응답사례 : </span>${model.view.point } 포인트 리워드</div>
                        <div class="font_noto cont"><span class="f_wet_05">응답시간 : </span>약7분내외(10문항)</div>
                    </li>
                    <li>
                        <div class="btn" data-toggle="modal" data-target="#myModal">참여하기</div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</div>
<!-- 설문조사내용 끝 -->

<!-- 설문리스트 -->
<div class="container">
    <div class="row">
        <div class="col-sm-12">
            <div class="cnpnel font_noto f_wet_03">
                <div class="flexbox_02">
                    <div class="item_03 box_05 pos_r">
                        <div class="img pos_a max_img"><img src="/resources/img/guide_img_01.png" alt=""></div>
                        <div class="sul_box">
						    <div class="num font_noto">01.</div>
                            <div class="tit font_noto">문항을 꼼꼼히 읽고 응답해주세요.</div>
                            <div class="sul txt_just">설문 문항은 꼼꼼하게 읽어주시고, 주관식 응답은 자세하게 기입해 주세요.</div>
							<div class="sul txt_just">설문 유형에 따라 조사 대상이 아니시면 설문에 참여하지 못하실 수도 있으며, 본 설문에 참여하지 못하더라도 다른 설문 참여 기회에 영향을 주지 않습니다.</div>
                        </div>
                    </div>
                    <div class="item_03 box_05 pos_r">
                        <div class="img pos_a max_img"><img src="/resources/img/guide_img_02.png" alt=""></div>
                        <div class="sul_box">
						    <div class="num font_noto">02.</div>
                            <div class="tit font_noto">설문에 솔직하게 응답해 주세요.</div>
                            <div class="sul txt_just">설문에 맞고 틀린 것은 없습니다.</div>
							<div class="sul txt_just">패널분들의 의견이 정답이며, 패널분들의 응답이 더 좋은제품, 더 나은 서비스를 개발하는데 기초가 됩니다.</div>
                        </div>
                    </div>
					<div class="item_03 box_05 pos_r">
                        <div class="img pos_a max_img"><img src="/resources/img/guide_img_03.png" alt=""></div>
                        <div class="sul_box">
						    <div class="num font_noto">03.</div>
                            <div class="tit font_noto">개인 신상정보는 안전하게 보호됩니다</div>
                            <div class="sul txt_just">패널분들의 응답은 통계법 제33조에 의해 철저히 보호됩니다.</div>
							<div class="sul txt_just">응답해 주신 내용은 통계적인 목적으로만 사용되며, 개인신상정보가 알려지는 일은 절대로 없으니 안심하셔도 됩니다.</div>
                        </div>
                    </div>
					<div class="item_03 box_05 pos_r">
                        <div class="img pos_a max_img"><img src="/resources/img/guide_img_04.png" alt=""></div>
                        <div class="sul_box">
						    <div class="num font_noto">04.</div>
                            <div class="tit font_noto">설문중 뒤로가기 새로고침을 하시면 안되요.</div>
                            <div class="sul txt_just">응답 도중 이전 페이지로 되돌아가기 (Back Space), 페이지 새로고침(F5)을 누르시면 해킹으로 판단되어 적립이 취소될 수도 있습니다.</div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
<!-- 설문리스트 끝 -->

<!-- 설문 모달 -->
<div class="cnpnel">
    <div class="modal" id="myModal">
        <div class="modal-dialog">
            <div class="modal-content">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title">Modal Heading</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>

                <!-- Modal body -->
                <c:forEach var="item" items="${model.questionlist}">
                <div class="modal-body">
                    <h3>${item.name}</h3>
			        <h3>${item.content}</h3>
			        <c:forEach var="choice" items="${fn:split(item.Choices, '#')}"> <!-- 선택지 분할 -->
			            <p>${choice}</p>
			        </c:forEach>
                </div>
                </c:forEach>

                <!-- Modal footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- 설문모달 끝 -->

<script type="text/javascript">
<c:forEach var="item" items="${model.questionlist}">
	console.log('${item.name}');
</c:forEach>
</script>
 
<c:forEach var="item" items="${model.questionlist}">
    <div style="display:none">
        <h3>${item.name}</h3>
        <h3>${item.content}</h3>
        <c:forEach var="choice" items="${fn:split(item.Choices, '#')}"> <!-- 선택지 분할 -->
            <p>${choice}</p>
        </c:forEach>
    </div>
</c:forEach>

<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

</script>