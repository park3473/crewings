<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
</head>
<style>
	.chart{
	width : 400px;margin:0 auto;padding-bottom:50px;
	}
</style>

<script type="text/javascript">
const select_list = '${model.view.select_list}';
console.log(select_list);
const select = (function() {
    return select_list.split(',');
})();
console.log(select);
</script>

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
	.status_div{text-align:center;margin-bottom:50px;border-bottom:1px #ccc solid}
	h2{font-size:24px;letter-spacing:-2px;font-weight:500}
</style>
<!-- ckeditor필요한 부분 -->

<body>
<!--헤더-->
<%@ include file="../include/menu.jsp" %>
<!--헤더 end-->

<c:if test="${model.before.category == '0' }">

<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div class="status_div">
                    	<h2>영역별 인식도 (연령대)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartAge"  width="400px" height="400px" ></canvas>
		    </div>
                    </div>
                    
                    <div class="status_div">
                    	<h2>영역별 인식도 (직업)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartJob"  width="400px" height="400px" ></canvas>
		    </div>
                    </div>
                    
                    <div class="status_div">
                    	<h2>영역별 인식도 (성별)</h2>
					    <div class="chart" >
					    	<canvas id="pieChartSex"  width="400px" height="400px" ></canvas>
					    </div>
                    </div>
                    
                    <div class="status_div">
                    	<h2>영역별 분포도 (지역)</h2>
					    <div class="chart">
					    	<canvas id="pieChartAddressLocal"  width="400px" height="400px" ></canvas>
					    </div>
                    </div>
                    
                    <c:forEach var="item" items="${model.question }" varStatus="status">
                    <div class="status_div">
                    	<h2>문제별 차트 (${status.index + 1 }번 문항)</h2>
                    	<div>
                    		<h1>${item.name }</h1>
                    		<p>
                    		<c:forEach var="choice" items="${fn:split(item.Choices, '#')}"  varStatus="select_status">
							 	${select_status.index + 1 }. ${choice}
							 </c:forEach>
							 </p>
                    	</div>
					    <div class="chart">
					    	<canvas id="questionChart_${status.index + 1 }"  width="400px" height="400px" ></canvas>
					    </div>
					    <div>
					    	<div>
					    		<form id="select_coment"  class="select_coment">
					    			<input type="hidden" name="idx" value="${item.list_idx }" >
						    		<h1>진단 평가</h1>
						    		<textarea name="coment"  rows="" cols="">${item.coment }</textarea>
						    		<button type="submit" >평가 저장</button>
					    		</form>
					    	</div>
					    </div>
                    </div>
                    </c:forEach>
                    
                </section>
                	
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">

function Question(idx , name , type , content , objectives , select_type , select_val , solution , right , wrong , correct , select_cnt , select){
	
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
	this.select_cnt = select_cnt;
	this.select = select;
	
}

//=====================================================================================================
var questions = [];
<c:forEach var="item" items="${model.question}" varStatus="status" >
questions.push(new Question(
		'${item.idx}',
		'${item.name}',
		'${item.type}',
		'${item.content}',
		'${item.objectives}',
		'${item.select_type}',
		'${item.select_val}',
		`${item.solution}`,
		'${item.right}',
		'${item.wrong}',
		'O',
		'${item.select_count}',
		[
			 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
			 '${choice}',
			 </c:forEach>
			 ]
		));
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
<c:forEach var="item" items="${model.resultList}" varStatus="status" >
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

//연령대 범위 정의
var ageRanges = ["0~9세", "10~19세", "20~29세", "30~39세", "40~49세", "50~59세", "60~69세", "70~79세"];

// 성별 매핑
function mapSex(sex) {
    return sex === 0 ? '여성' : '남성';
}

// 연령대 매핑 함수
function mapAge(age) {
    var startAge = age * 10;
    var endAge = (age + 1) * 10 - 1;
    return startAge + "~" + endAge + "세";
}

// 집계 함수
function aggregateData(results, field) {
    return results.reduce(function (acc, result) {
        var key = result[field];
        acc[key] = (acc[key] || 0) + 1;
        return acc;
    }, {});
}

// 변환된 데이터로 집계
function transformAndAggregateData(results, field, mapFunction) {
    var transformedResults = results.map(result => {
        var transformedResult = { ...result };
        transformedResult[field] = mapFunction(result[field]);
        return transformedResult;
    });

    return aggregateData(transformedResults, field);
}

// 고정된 순서로 연령대 데이터 정렬
function sortDataByFixedOrder(data, fixedOrder) {
    var sortedData = {};
    fixedOrder.forEach(key => {
        sortedData[key] = data[key] || 0;
    });
    return sortedData;
}

// 각 필드별로 데이터 집계
var addressLocalData = aggregateData(results, 'address_local');
var jobData = aggregateData(results, 'job');
var aggregatedSexData = transformAndAggregateData(results, 'sex', mapSex); // 성별 데이터
var aggregatedAgeData = transformAndAggregateData(results, 'age', mapAge); // 연령대 데이터

// 연령대 데이터 정렬
aggregatedAgeData = sortDataByFixedOrder(aggregatedAgeData, ageRanges);

//Chart.js 차트 데이터 생성 (원형 그래프 형식)
function createPieChartData(aggregateData) {
    var labels = Object.keys(aggregateData);
    var data = Object.values(aggregateData);

    return {
        labels: labels,
        datasets: [{
        	label: `Data`,
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
                },
                datalabels: {
                    backgroundColor: function(context) {
                      return context.dataset.backgroundColor;
                    },
                    borderRadius: 4,
                    color: 'white',
                    font: {
                      weight: 'bold'
                    },
                    formatter: Math.round,
                    padding: 6
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

//사용자 응답 분석 및 빈도 계산
function calculateAnswerFrequencies(results) {
    var frequencies = {};

    results.forEach(result => {
        var answers = result.select_list.split(',');
        answers.forEach((answer, index) => {
            var questionNumber = index + 1;
            frequencies[questionNumber] = frequencies[questionNumber] || {};
            frequencies[questionNumber][answer] = (frequencies[questionNumber][answer] || 0) + 1;
        });
    });

    return frequencies;
}

// 답변 빈도 계산
var answerFrequencies = calculateAnswerFrequencies(results);

// 파이 차트 데이터 생성
function createPieChartData(frequencies, questionNumber) {
    var labels = Object.keys(frequencies);
    var data = Object.values(frequencies);

    return {
        labels: labels,
        datasets: [{
        	label: `Data`,
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

// 파이 차트 생성
function createPieCharts(answerFrequencies) {
    Object.keys(answerFrequencies).forEach(questionNumber => {
        var chartData = createPieChartData(answerFrequencies[questionNumber], questionNumber);
        var canvasId = 'questionChart_' + questionNumber;
        var ctx = document.getElementById(canvasId).getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: chartData
        });
    });
}

// 차트 생성
createPieCharts(answerFrequencies);

document.querySelectorAll('.select_coment').forEach(function(form) {
    form.addEventListener('submit', function(event) {
        event.preventDefault(); // 폼의 기본 제출 동작을 방지

        var result = confirm('정말 해당 평가를 저장하시겠습니까?');
        
        if(!result){
        	return;
        }
        
        var formData = new FormData(this); // 현재 폼의 데이터

        question_comment($( this ).serialize()); // 함수에 폼 데이터를 전달
    });
});

function question_comment(formData){
	
	console.log(formData);
	
	$.ajax({
		url : '/admin/question/coment.do',
		type : 'POST',
		data : formData,
		success : function(status , xhr , success){
			console.log('coment set : success');
			alert('평가가 저장 되었습니다.');
		},
		error : function(xhr , error , status){
			console.log('coment set : error');
		}
	})
	
}


$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
});

</script>
</c:if>

<c:if test="${model.before.category == '1' }">

<!--본문-->
<section id="adm_sc">
    <div id="adm_sc_area">
        <div id="adm_sc_con">
            <div class="adm_sc_size">

                <!--본문 내용-->
                <section class="adm_sc_txt">
                	<div class="status_div">
                    	<h2>영역별 인식도 (연령대)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartAge"  width="400px" height="400px" ></canvas>
		    </div>
                    </div>
                    
                    <div class="status_div">
                    	<h2>영역별 인식도 (직업)</h2>
		    <div class="chart" >
		    	<canvas id="pieChartJob"  width="400px" height="400px" ></canvas>
		    </div>
                    </div>
                    
                    <div class="status_div">
                    	<h2>영역별 인식도 (성별)</h2>
					    <div class="chart" >
					    	<canvas id="pieChartSex"  width="400px" height="400px" ></canvas>
					    </div>
                    </div>
                    
                    <div class="status_div">
                    	<h2>영역별 분포도 (지역)</h2>
					    <div class="chart">
					    	<canvas id="pieChartAddressLocal"  width="400px" height="400px" ></canvas>
					    </div>
                    </div>
                
                    <div class="status_div">
                        <h2>전체 인식도 (차트)</h2>
                        <div class="chart" >
                            <canvas id="chart_0"  width="400" height="400" ></canvas>
                        </div>
                      </div>

                	<div class="status_div">
		    <h2>영역별 인식도 (차트)</h2>
		    <div class="chart" >
		    	<canvas id="chart_1"  width="400" height="400" ></canvas>
		    </div>
		  </div>
		
		  <div class="status_div">
		    <h2>영역별 분포도 (차트)</h2>
		    <div class="chart">
		    	<canvas id="chart_2"  width="400" height="400" ></canvas>
		    </div>
		  </div>
                    
                </section>
                	
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
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript">

function Question(idx , name , type , content , objectives , select_type , select_val , solution , right , wrong ,  choice){
	
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
	this.choice = choice;
	
}

//=====================================================================================================
var questions = [];
<c:forEach var="item" items="${model.question}" varStatus="status" >
questions.push(new Question(
		'${item.idx}',
		'${item.name}',
		'${item.type}',
		'${item.content}',
		'${item.objectives}',
		'${item.select_type}',
		'${item.select_val}',
		`${item.solution}`,
		'${item.right}',
		'${item.wrong}',
		[
			 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
			 '${choice}',
			 </c:forEach>
			 ]
		));
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
<c:forEach var="item" items="${model.resultList}" varStatus="status" >
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

//연령대 범위 정의
var ageRanges = ["0~9세", "10~19세", "20~29세", "30~39세", "40~49세", "50~59세", "60~69세", "70~79세"];

// 성별 매핑
function mapSex(sex) {
    return sex === 0 ? '여성' : '남성';
}

// 연령대 매핑 함수
function mapAge(age) {
    var startAge = age * 10;
    var endAge = (age + 1) * 10 - 1;
    return startAge + "~" + endAge + "세";
}

// 집계 함수
function aggregateData(results, field) {
    return results.reduce(function (acc, result) {
        var key = result[field];
        acc[key] = (acc[key] || 0) + 1;
        return acc;
    }, {});
}

// 변환된 데이터로 집계
function transformAndAggregateData(results, field, mapFunction) {
    var transformedResults = results.map(result => {
        var transformedResult = { ...result };
        transformedResult[field] = mapFunction(result[field]);
        return transformedResult;
    });

    return aggregateData(transformedResults, field);
}

// 고정된 순서로 연령대 데이터 정렬
function sortDataByFixedOrder(data, fixedOrder) {
    var sortedData = {};
    fixedOrder.forEach(key => {
        sortedData[key] = data[key] || 0;
    });
    return sortedData;
}

// 각 필드별로 데이터 집계
var addressLocalData = aggregateData(results, 'address_local');
var jobData = aggregateData(results, 'job');
var aggregatedSexData = transformAndAggregateData(results, 'sex', mapSex); // 성별 데이터
var aggregatedAgeData = transformAndAggregateData(results, 'age', mapAge); // 연령대 데이터

// 연령대 데이터 정렬
aggregatedAgeData = sortDataByFixedOrder(aggregatedAgeData, ageRanges);

//Chart.js 차트 데이터 생성 (원형 그래프 형식)
function createPieChartData(aggregateData) {
    var labels = Object.keys(aggregateData);
    var data = Object.values(aggregateData);

    return {
        labels: labels,
        datasets: [{
        	label: `Data`,
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

// 각 문제의 정답 매핑
var answerKey = {};
questions.forEach(function(question) {
    answerKey[question.idx] = question.select_val;
});

var totalCorrectCounts = 0;
var totalQuestionCounts = 0;

// 문제 유형별 정답 카운트 및 전체 문제 수 카운트
var correctCounts = {}, totalCounts = {};
results.forEach(function(result) {
    var answers = result.select_list.split(',');
    answers.forEach(function(answer, index) {
        var questionIdx = questions[index].idx;
        var questionType = questions[index].type;

        correctCounts[questionType] = correctCounts[questionType] || 0;
        totalCounts[questionType] = totalCounts[questionType] || 0;

        if (answer === answerKey[questionIdx]) {
            correctCounts[questionType]++;
            totalCorrectCounts++;
        }
        totalCounts[questionType]++;
        totalQuestionCounts++;
    });
});

// 정답률 계산
var scoresPerType = {};
for (var type in correctCounts) {
    scoresPerType[type] = (correctCounts[type] / totalCounts[type]) * 100;
}

var totalScoresPer = (totalCorrectCounts / totalQuestionCounts) * 100;

var ctx = document.getElementById('chart_0').getContext('2d');
    var myChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: [''],
            datasets: [{
                label: '전체 정답률',
                data: [totalScoresPer],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.2)'
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)'
                ],
                borderWidth: 1
            }]
        },
               options: {
            scales: {
                x : {
    		ticks: {
        	stepSize: 10,
      },
max : 100,
      beginAtZero : true,
    }
            },
			indexAxis : 'y'
        }
});

// 차트 데이터 생성
var data = {
    labels: Object.keys(scoresPerType),
    datasets: [{
        label: '정답률',
        data: Object.values(scoresPerType),
        // 색상 및 스타일 설정
    }]
};

// 레이더 차트 생성
var ctxRadar = document.getElementById('chart_1').getContext('2d');
var radarChart = new Chart(ctxRadar, {
    type: 'radar',
    data: data,
    options: {
        // 옵션 설정
    }
});

// 막대 차트 생성
var ctxBar = document.getElementById('chart_2').getContext('2d');
var barChart = new Chart(ctxBar, {
    type: 'bar',
    data: data,
    options: {
        // 옵션 설정
    }
});


$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
});


</script>

</c:if>

</body>
</html>