<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- 해당 관련 js 파일 -->
<script src="${pageContext.request.contextPath}/resources/js/login.js"></script>
<!--삭제금지-->
<!-- 
<c:if test="${ssion_langage == 'kr'}">한글</c:if>
<c:if test="${ssion_langage != 'kr'}">영어</c:if>
-->
<!--공통 헤더 시작-->
<%@ include file="../../include/user/header.jsp" %>
<%@ include file="../../include/user/menu.jsp" %>
<%@ include file="../../include/user/top.jsp" %>
<!--공통 헤더 끝-->
<script type="text/javascript">
const select_list = '${model.view.select_list}';
console.log(select_list);
const select = (function() {
    return select_list.split(',');
})();
console.log(select);
</script>

<style>
.section {
    background-color: #f2f2f2;
    border: 1px solid #dcdcdc;
    padding: 20px;
    margin-bottom: 20px;
  }
  .chart {
    width: 100%;
    height: 300px;
    background-color: #fff;
    border: 1px solid #ccc;
    text-align: center;
    line-height: 300px;
    color: #888;
  }

</style>

<div class="pad_35"></div>

<!-- 타이틀 -->
<div class="tit_wrap">
	<div class="b_txt_tit font_noto f_wet_01"><span class="f_wet_05">결과</span>상세보기</div>
<div class="s_txt_tit">설문조사 참여를 통해 적립할 수 있는 창날패널만의 혜택을 누려보세요.</div>
</div>
<!-- 타이틀 긑 -->

<!-- 포인트 -->
<div class="container cnpnel">
    <div class="point_wrap">
        <div class="section">
		    <h2>검사자 정보</h2>
		    <p><strong>검사자명 : </strong> ${model.view.name }</p>
		    <p><strong>검사일 : </strong> ${fn:substring(model.view.complete_tm,0,11) }</p>
		  </div>
		
		  <div class="section">
		    <h2>영역별 인식도 (차트)</h2>
		    <div class="chart" >
		    	<canvas id="chart_1"  width="400" height="400" ></canvas>
		    </div>
		  </div>
		
		  <div class="section">
		    <h2>영역별 분포도 (차트)</h2>
		    <div class="chart">
		    	<canvas id="chart_2"  width="400" height="400" ></canvas>
		    </div>
		  </div>
    </div>
</div>
<!-- 포인트 끝 -->

<!-- 포인트리스트 -->
<div class="container cnpnel">
    <table class="table table-bordered">
    <thead>
    <tr>
        <th>번호</th>
        <th>정오</th>
        <th>학습 목표</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${model.question }"  var="item"  varStatus="status">
    <tr>
        <td>${status.index + 1 }</td>
        <td id="correct_${status.index + 1}">
        	<script type="text/javascript">
        		var select_val = '${item.select_val}';
        		var select_correct = select[${status.index}];
        		console.log(select_val);
        		console.log(select_correct);
        		if(select_val == select_correct){
        			$('#correct_${status.index + 1}').append('O');
        		}else{
        			$('#correct_${status.index + 1}').append('X');
        		}
        	</script>
        </td>
        <td>${item.objectives }</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
    <!-- 페이징 -->
    <div class="pos_r paging">
        <ul class="pagination pos_a">
            <li class="page-item"><a class="page-link" href="#"><i class="las la-angle-left"></i></a></li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item active"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item"><a class="page-link" href="#"><i class="las la-angle-right"></i></a></li>
        </ul>
    </div>
    <!-- 페이징 끝 -->
</div>
<!-- 포인트리스트 끝 -->


<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
function Question(idx , name , type , content , objectives , select_type , select_val , solution , right , wrong , correct){
	
	this.idx = idx;
	this.name = name;
	this.type = type;
	this.content = content;
	this.objectives = objectives;
	this.select_type = select_type;
	this.select_val = select_val;
	this.solution = solution = solution;
	this.right = right;
	this.wrong = wrong;
	this.correct = correct
	
}

//=====================================================================================================
var questions = [];
<c:forEach var="item" items="${model.question}" varStatus="status" >
if('${item.select_val}' == select[${status.index}]){
questions.push(new Question(
		'${item.idx}',
		'${item.name}',
		'${item.type}',
		'${item.content}',
		'${item.objectives}',
		'${item.select_type}',
		'${item.select_val}',
		'${item.solution}',
		'${item.right}',
		'${item.wrong}',
		'O'
		));
}else{
	questions.push(new Question(
			'${item.idx}',
			'${item.name}',
			'${item.type}',
			'${item.content}',
			'${item.objectives}',
			'${item.select_type}',
			'${item.select_val}',
			'${item.solution}',
			'${item.right}',
			'${item.wrong}',
			'X'
			));	
}
</c:forEach>
//=====================================================================================================
	
// type 속성을 기준으로 분류dasdsa
var questionsType= questions.reduce(function (acc, question) {
    // acc는 누적값, question은 현재 처리중인 Question 객체
    if (!acc[question.type]) {
        acc[question.type] = []; // 해당 type을 키로 하는 배열 초기화
    }
    acc[question.type].push(question); // 현재 Question 객체를 해당 type 배열에 추가
    return acc;
}, {});

var correctQuestions = {};

for (let type in questionsType) {
    // type별로 right가 "O"인 Question 객체들을 필터링
    correctQuestions[type] = questionsType[type].filter(question => question.correct === "O");
}

console.log(correctQuestions);

var data = {
		  labels: Object.keys(questionsType),
		  datasets: [{
		    label: '정답률',
		    data: [100  , 50 , 50, 100 , 60 , 0 ],
		    fill: true,
		    backgroundColor: 'rgba(255, 99, 132, 0.2)',
		    borderColor: 'rgb(255, 99, 132)',
		    pointBackgroundColor: 'rgb(255, 99, 132)',
		    pointBorderColor: '#fff',
		    pointHoverBackgroundColor: '#fff',
		    pointHoverBorderColor: 'rgb(255, 99, 132)'
		  }]
		};
		
//차트 옵션 설정
var options = {
  scales: {
    r: {
    		ticks: {
        	stepSize: 20,
        	maxTicksLimit : 100
      },
      beginAtZero : true,
    }
  }
};

// 캔버스 요소에 차트 생성하기
var ctx = document.getElementById('chart_1').getContext('2d');
var myRadarChart = new Chart(ctx, {
  type: 'radar',
  data: data,
  options: options
});


var data2 = {
		  labels: Object.keys(questionsType),
		  datasets: [{
		    label: '정답률',
		    data: [100  , 50 , 50, 100 , 60 , 0 ],
		    backgroundColor: [
                'rgba(255, 99, 132, 0.2)',
                'rgba(54, 162, 235, 0.2)',
                'rgba(255, 206, 86, 0.2)',
                'rgba(75, 192, 192, 0.2)',
                'rgba(153, 102, 255, 0.2)',
                'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
                'rgba(255, 99, 132, 1)',
                'rgba(54, 162, 235, 1)',
                'rgba(255, 206, 86, 1)',
                'rgba(75, 192, 192, 1)',
                'rgba(153, 102, 255, 1)',
                'rgba(255, 159, 64, 1)'
            ],
            borderWidth: 1
		  }]
		};
		
//차트 옵션 설정
var options = {
		scales: {
            y: {
                beginAtZero: true
            }
        }
};

//캔버스 요소에 차트 생성하기
var ctx = document.getElementById('chart_2').getContext('2d');
var myRadarChart = new Chart(ctx, {
type: 'bar',
data: data,
options: options
});



</script>