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
<!--공통 헤더 끝-->


<!-- content -->
    <style>
        .question {
            border: 1px solid black;
            padding: 10px;
            margin-bottom: 20px;
        }
    </style>
    <h1>시험 문제</h1>
    
<c:forEach var="entry" items="${model.questionlist}">
    <div>
        <h3>${entry.QuestionTitle}</h3>
        <h3>${entry.QuestionContent}</h3>
        <c:forEach var="choice" items="${fn:split(entry.Choices, '#')}"> <!-- 선택지 분할 -->
            <p>${choice}</p>
        </c:forEach>
    </div>
</c:forEach>


<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script type="text/javascript">

</script>