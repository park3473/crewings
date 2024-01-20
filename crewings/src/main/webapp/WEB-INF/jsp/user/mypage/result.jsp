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
    height: 500px;
    background-color: #fff;
    border: 1px solid #ccc;
    text-align: center;
    line-height: 500px;
    color: #888;
	padding:50px
  }

  h2{font-size:24px;font-family: 'Noto Sans KR',sans-serif;letter-spacing: -1px;padding:0 0 5px 0}

table th{font-weight:bold !important}

</style>

<div class="pad_35"></div>

<!-- 문제 결과 부분 -->

<c:if test="${model.before.category == '1' }">

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
        <th>문제 제목</th>
        <th>정오</th>
        <th>선택한 답안</th>
        <th>학습 목표</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${model.question }"  var="item"  varStatus="status">
    <tr>
        <td>${status.index + 1 }</td>
        <td id="question_name_${status.index + 1}" style="text-align:left">${item.name }</td>
        <td id="correct_${status.index + 1}" style="text-align:center">
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
        <td id="question_select_${status.index + 1}" style="text-align:left"></td>
        <td style="text-align:left">${item.objectives }</td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
</div>
<!-- 포인트리스트 끝 -->


<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">
function Question(idx , name , type , content , objectives , select_type , select_val , solution , right , wrong , correct , choice){
	
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
	this.correct = correct;
	this.choice = choice;
	
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
		'O',
		[
			 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
			 '${choice}',
			 </c:forEach>
			 ]
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
			'X',
			[
				 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
				 '${choice}',
				 </c:forEach>
				 ]
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

var totalQuestionsPerType = {};
var scoresPerType = {};

// 각 주제별 총 문제 수 계산
for (let type in questionsType) {
    totalQuestionsPerType[type] = questionsType[type].length;
}

// 각 주제별 점수 계산
for (let type in correctQuestions) {
    let correctCount = correctQuestions[type].length;
    let totalQuestions = totalQuestionsPerType[type];
    let score = (correctCount / totalQuestions) * 100;
    scoresPerType[type] = score;
}

console.log(scoresPerType);

var scores = [];

//모든 주제를 반복하면서 각 주제별 점수를 계산
for (let type in questionsType) {
 let totalQuestions = questionsType[type].length;
 let correctQuestions = questionsType[type].filter(question => question.correct === "O").length;
 let score = (correctQuestions / totalQuestions) * 100;
 scores.push(score);
}

console.log(scores);

var data = {
		  labels: Object.keys(questionsType),
		  datasets: [{
		    label: '정답률',
		    data: scores,
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
		    data: scores,
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


$( document ).ready(function() {
    
	for(var i = 0; i < questions.length; i ++){
		
		$('#question_select_'+(i+1)).append(questions[i].choice[parseInt(select[i])-1]);
		
		
	}
	
});

</script>

</c:if>

<!-- 설문 결과 부분 -->

<c:if test="${model.before.category == '0' }">

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
		    <h2>영역별 인식도 (연령대)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartAge"  width="400" height="400" ></canvas>
		    </div>
		  </div>
		
		  <div class="section">
		    <h2>영역별 분포도 (지역)</h2>
		    <div class="chart">
		    	<canvas id="pieChartAddressLocal"  width="400" height="400" ></canvas>
		    </div>
		  </div>
		  
		  <div class="section">
		    <h2>영역별 인식도 (직업)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartJob"  width="400" height="400" ></canvas>
		    </div>
		  </div>
		  
		  <div class="section">
		    <h2>영역별 인식도 (성별)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartSex"  width="400" height="400" ></canvas>
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
        <th>설문 제목</th>
        <th>선택 항목</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${model.question }"  var="item"  varStatus="status">
    <tr>
        <td>${status.index + 1 }</td>
        <td style="text-align:left">${item.name }</td>
        <td id="question_select_${status.index + 1}"></td>
    </tr>
    </c:forEach>
    </tbody>
    </table>
</div>
<!-- 포인트리스트 끝 -->


<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">

function Question(idx , name , type , content , objectives , select_type , select_val , solution , right , wrong , correct , choice){
	
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
	this.correct = correct;
	this.choice = choice;
	
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
		'O',
		[
			 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
			 '${choice}',
			 </c:forEach>
			 ]
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
			'X',
			[
				 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
				 '${choice}',
				 </c:forEach>
				 ]
			));	
}
</c:forEach>
//=====================================================================================================

function Result(idx , exam_idx , member_id , name , select_list , complete , address_local , age , job , sex){
	
	this.idx = idx;
	this.exam_idx = exam_idx;
	this.member_id = member_id;
	this.name = name;
	this.select_list = select_list;
	this.complete = complete;
	this.address_local = address_local;
	this.age = age;
	this.job = job;
	this.sex = sex;
	
}

//=====================================================================================================
var results = [];
<c:forEach var="item" items="${model.member_questions}" varStatus="status" >
results.push(new Result(
			'${item.idx}',
			'${item.exam_idx}',
			'${item.member_id}',
			'${item.name}',
			'${item.select_list}',
			'${item.complete}',
			'${item.address_local}',
			parseInt('${item.age}'),
			'${item.job}',
			parseInt('${item.sex}')
));
</c:forEach>
//=====================================================================================================
	
// 집계 함수
function aggregateData(results, field) {
    return results.reduce(function (acc, result) {
        var key = result[field];
        acc[key] = (acc[key] || 0) + 1;
        return acc;
    }, {});
}

//연령대 매핑 함수 수정
function mapAge(age) {
    var startAge = age * 10;
    var endAge = (age + 1) * 10 - 1;
    return startAge + "~" + endAge + "세";
}


// 성별 매핑
function mapSex(sex) {
    return sex === 0 ? '여성' : '남성';
}

//변환된 데이터로 집계
function transformAndAggregateData(results, field, mapFunction) {
    var transformedResults = results.map(result => {
        var transformedResult = { ...result };
        console.log("Before transformation:", result[field]); // 변환 전 값 확인
        transformedResult[field] = mapFunction(result[field]);
        console.log("After transformation:", transformedResult[field]); // 변환 후 값 확인
        return transformedResult;
    });

    return aggregateData(transformedResults, field);
}

//각 필드별로 데이터 집계
var addressLocalData = aggregateData(results, 'address_local');
var jobData = aggregateData(results, 'job');
var aggregatedSexData = transformAndAggregateData(results, 'sex', mapSex);
var aggregatedAgeData = transformAndAggregateData(results, 'age', mapAge);



//Chart.js 차트 데이터 생성 (원형 그래프 형식)
function createPieChartData(aggregateData) {
    var labels = Object.keys(aggregateData);
    var data = Object.values(aggregateData);

    return {
        labels: labels,
        datasets: [{
            label: '참여율',
            data: data,
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
}

// 각 차트 데이터 생성
var pieDataAddressLocal = createPieChartData(addressLocalData);
var pieDataJob = createPieChartData(jobData);
var pieDataSex = createPieChartData(aggregatedSexData);
var pieDataAge = createPieChartData(aggregatedAgeData);

console.log(pieDataAddressLocal);
console.log(pieDataJob);
console.log(pieDataSex);
console.log(pieDataAge);

// 차트 생성 함수
function createPieChart(canvasId, data) {
    var ctx = document.getElementById(canvasId).getContext('2d');
    return new Chart(ctx, {
        type: 'pie',
        data: data,
        options: {
            responsive: true,
            plugins: {
                legend: {
                    position: 'top',
                },
                title: {
                    display: false,
                    text: canvasId
                }
            }
        },
    });
}

// 각 차트 생성 (canvasId를 적절히 수정해야 함)
createPieChart('pieChartAddressLocal', pieDataAddressLocal);
createPieChart('pieChartJob', pieDataJob);
createPieChart('pieChartAge', pieDataAge);
createPieChart('pieChartSex', pieDataSex);

$( document ).ready(function() {
    
	for(var i = 0; i < questions.length; i ++){
		
		$('#question_select_'+(i+1)).append(questions[i].choice[parseInt(select[i])-1]);
		
		
	}
	
});


</script>

</c:if>
