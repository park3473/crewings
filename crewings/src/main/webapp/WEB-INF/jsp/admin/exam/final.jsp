<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>

<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html lang="ko">

<head>
<%@ include file="../include/header.jsp" %>
<link rel="stylesheet" href="/resources/css/final.css">
<link type="text/css" rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/line-awesome/1.3.0/css/line-awesome.min.css">
</head>

<style>
	#bootstrap-data-table tr th{
	
	text-align: center;
		
	}
	.chart{
	width : 800px;margin:0 auto;padding-bottom:50px;
	}
	.page3 .chart-container {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between; /* 요소들을 행별로 최대한 넓게 배치 */
    align-items: flex-start; /* 위쪽 정렬 */
    /* 추가적인 스타일링을 필요에 맞게 조정하세요 */
	}
	
	.page3 .max_img.chart {
	    /* 추가적인 스타일링을 필요에 맞게 조정하세요 */
	    margin-bottom: 20px; /* 필요에 따라 여백 조정 */
	    width: calc(30% - 10px); /* 너비를 50%로 설정하여 2행으로 배치 */
	    /* 여기서 10px는 여백을 나타냅니다. 필요에 따라 조절하세요. */
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
                                <span>최종결과물 관리</span>
                            </div>
                            
                            <!--관리자 버튼-->
                            <div class="page_seach">
                                <div class="adm_btn_wrap stats_btn_area">
                                    <ul>
                                    	<li class="delete">
                                        	<a href="#" onclick="finalDown();">결과 출력</a>
	                                    </li>
	                                </ul>
                                </div>
                            </div>
                            <!--관리자 버튼 end-->
                            <!-- 본문 컨텐츠 시작-->
                            
                            <div class="row" style="text-align:center">
                            	<div class="page1" id="page1" style="display: flex;-ms-flex-wrap: wrap;flex-wrap: wrap;margin-right: -15px;margin-left: -15px;">
	                                <div class="col-sm-12">
	                                    <div class="big_tit_01 font_noto">설문(수요조사) 조사 분석 보고서</div>
	                                    <div class="line_gab_30"></div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="big_tit_02 font_noto">주제 내용 : 토양‧지하수 환경교육 인식도 및 수요도 조사 결과</div>
	                                    <div class="small_txt_02">(조사기간 : ${fn:substring(model.view.start_tm,0,11)} ~ ${fn:substring(model.view.end_tm,0,11)})</div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="line_bnk_30"></div>
	                                    <div class="max_img"><img style="width:1400px" name="mainImage" src="" alt="조사이미지" class="b_rad_10 border_line_01"></div>
	                                </div>
	                                <div class="col-sm-12">
	                                    <div class="line_bnk_50"></div>
	                                </div>
                                </div>
                                <c:forEach var="item" items="${model.question }" varStatus="stauts">
                                <div class="page2">
	                                <div class="col-sm-12">
	                                    <div class="big_tit_02 font_noto">문항 분석표 (${stauts.index + 1 }번)</div>
	                                    <div class="small_txt_03 font_noto">01. 간략 분석</div>
	                                    <div class="line_gab_15"></div>
	                                </div>
	                                <div class="col-sm-12">
	                                	<div class="max_img chart">
	                                		<canvas id="questionChart1_${stauts.index + 1 }"  width="800px" height="800px" ></canvas>
	                                	</div>
	                                	<div>
									    	<div>
									    		<form id="select_coment"  class="select_coment">
									    			<input type="hidden" name="idx" value="${item.list_idx }" >
										    		<h1 style="font-size:20px">진단 평가</h1>
										    		<div class=""><textarea name="coment"  rows="5" cols="" style="width:60%">${item.coment }</textarea></div>
										    		<div style="margin:10px 0 30px"><button type="submit" style="background:#009dc4;color:#fff;border-radius:3px;font-weight:bold;height:35px;line-height:35px">평가 저장</button></div>
									    		</form>
									    	</div>
									    </div>
	                               	</div>
	
	                                <div class="col-sm-12">
	                                    <div class="line_bnk_30"></div>
	                                </div>
	
	                                <div class="col-sm-12">
	                                    <div class="small_txt_03 font_noto">02. 전체 요약</div>
	                                    <div class="line_gab_15"></div>
	                                </div>
	
	                                <div class="col-sm-12">
	                                    <table class="table" id="total_table_${stauts.index + 1 }">
	                                      </table>
	                                </div>
	
	                                <div class="col-sm-12">
	                                    <div class="line_bnk_30"></div>
	                                </div>
	
	                                <div class="col-sm-12">
	                                    <div class="small_txt_03 font_noto">03. 응답지역별 요약</div>
	                                    <div class="line_gab_15"></div>
	                                </div>
	
	                                <div class="col-sm-12">
	                                    <table class="table" id="address_table_${stauts.index + 1 }">
	                                      </table>
	                                </div>
                                </div>
                                </c:forEach>
                                <div class="page3" id="page3">
                                	<div class="chart-container">
	                                	<c:forEach var="item" items="${model.question }" varStatus="stauts">
	                                		<div class="max_img chart">
	                                			<h2>${stauts.index + 1 }번 문항</h2>
	                                			<h1>${item.name }</h1>
		                                		<canvas id="questionChart2_${stauts.index + 1 }"  width="300px" height="300px" ></canvas>
		                                		<div class=""><textarea name="coment"  rows="5" cols="" style="width:60%">${item.coment }</textarea></div>
		                                	</div>
	                                	</c:forEach>
                                	</div>
                                </div>
                            </div>
                        	<!-- 본문 컨텐츠 종료-->
                            
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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/1.5.3/jspdf.min.js"></script>
<script src="https://unpkg.com/html2canvas@1.0.0-rc.5/dist/html2canvas.js"></script>
<c:set var="schoolYears" value="${model.view.school_year}" />
<script>
//이미지 등록 및 파이그래프 생성
$(document).ready(function () {
var mainImage = `${model.view.content}`;
//DOM 파서를 사용하여 HTML 문자열을 파싱
var parser = new DOMParser();
var doc = parser.parseFromString(mainImage, "text/html");

// <img> 태그의 src 속성 값 가져오기
var imgSrc = doc.querySelector('img').src;  // 이 코드는 상대 경로를 반환합니다.

$('[name="mainImage"]').attr('src',imgSrc);

Chart.register(ChartDataLabels);

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

function Result(idx , select_list , address_local , school_year , sex){
	
	this.idx = idx;
	this.select_list = select_list;
	this.address_local = address_local;
	this.school_year = school_year;
	this.sex = sex;
	
}

//=====================================================================================================
var results = [];
<c:forEach var="item" items="${model.datalist}" varStatus="status" >
results.push(new Result(
			'${item.idx}',
			'${item.select_list}',
			'${item.address_local}',
			'${item.school_year}',
			'${item.sex}'
));
</c:forEach>
//=====================================================================================================

	function aggregateResultsForQuestion(question, results) {
	    var summaryData = {};
	    var regionData = {};
	
	    results.forEach(function(result) {
	        var responses = result.select_list.split(',');
	        var gender = result.sex === '남자' ? 'male' : 'female'; // 성별 데이터 확인
	        var schoolYear = result.school_year; // 학년 데이터
	
	        responses.forEach(function(response, idx) {
	            if (question.idx === questions[idx].idx) {
	                var answer = question.select[parseInt(response) - 1];
	                if (!summaryData[answer]) {
	                    summaryData[answer] = {};
	                }
	                if (!summaryData[answer][schoolYear]) {
	                    summaryData[answer][schoolYear] = { male: 0, female: 0 };
	                }
	                if (!regionData[result.address_local]) {
	                    regionData[result.address_local] = {};
	                }
	                if (!regionData[result.address_local][answer]) {
	                    regionData[result.address_local][answer] = {};
	                }
	                if (!regionData[result.address_local][answer][schoolYear]) {
	                    regionData[result.address_local][answer][schoolYear] = { male: 0, female: 0 };
	                }
	                summaryData[answer][schoolYear][gender] += 1;
	                regionData[result.address_local][answer][schoolYear][gender] += 1;
	            }
	        });
	    });
	
	    return { summaryData: summaryData, regionData: regionData };
	}




    // 테이블 생성 함수
    function createTable(data, schoolYears) {
	    var html = '<table class="table"><thead><tr><th rowspan="2">답변</th><th rowspan="2">인원</th><th rowspan="2">%</th>';
	    schoolYears.split(',').forEach(function(year) {
	        html += '<th colspan="2">초' + year + '</th>';
	    });
	    html += '</tr><tr>';
	    schoolYears.split(',').forEach(function(year) {
	        html += '<th>남</th><th>여</th>';
	    });
	    html += '</tr></thead><tbody>';
	
	    var totalResponses = 0;  // 전체 응답 수를 저장할 변수
	    var sortedAnswers = Object.keys(data).sort(); // 답변을 사전 순으로 정렬
	
	    // 전체 응답 수 계산
	    sortedAnswers.forEach(function(answer) {
	        schoolYears.split(',').forEach(function(year) {
	            var yearData = data[answer][year] || { male: 0, female: 0 };
	            totalResponses += yearData.male + yearData.female;
	        });
	    });
	
	    // 정렬된 답변을 사용하여 테이블 데이터 생성
	    sortedAnswers.forEach(function(answer) {
	        var totalPerAnswer = 0;
	        var rowData = {};
	        schoolYears.split(',').forEach(function(year) {
	            rowData[year] = data[answer][year] || { male: 0, female: 0 };
	            totalPerAnswer += rowData[year].male + rowData[year].female;
	        });
	
	        var percentage = totalPerAnswer > 0 ? (totalPerAnswer / totalResponses * 100).toFixed(2) : 0;  // 각 답변의 퍼센트를 계산
	        html += '<tr><td>' + answer + '</td><td>' + totalPerAnswer + '</td><td>' + percentage + '%</td>';
	
	        schoolYears.split(',').forEach(function(year) {
	            html += '<td>' + rowData[year].male + '</td><td>' + rowData[year].female + '</td>';
	        });
	
	        html += '</tr>';
	    });
	
	    html += '</tbody></table>';
	    return html;
	}

    
    function createRegionTable(regionData, schoolYears) {
    	var html = '<table class="table"><thead><tr><th rowspan="2">지역</th><th rowspan="2">답변</th><th rowspan="2">인원</th><th rowspan="2">%</th>';
        schoolYears.split(',').forEach(function(year) {
            html += '<th colspan="2">초' + year + '</th>'; // 각 학년별로 남성과 여성 표시
        });
        html += '</tr><tr>'; // 이 부분에서 각 학년의 남성과 여성을 위한 헤더 추가
        schoolYears.split(',').forEach(function(year) {
            html += '<th>남</th><th>여</th>';
        });
        html += '</tr></thead><tbody>';

        var sortedRegions = Object.keys(regionData).sort(); // 지역을 사전 순으로 정렬
        var totalPopulation = 0;

        sortedRegions.forEach(function(region) {
            var answersInRegion = Object.keys(regionData[region]).sort(); // 답변을 사전 순으로 정렬
            answersInRegion.forEach(function(answer) {
                schoolYears.split(',').forEach(function(year) {
                    var data = regionData[region][answer][year] || { male: 0, female: 0 };
                    totalPopulation += data.male + data.female;
                });
            });
        });

        sortedRegions.forEach(function(region) {
            var firstRow = true;
            var answersInRegion = Object.keys(regionData[region]).sort(); // 답변을 사전 순으로 정렬
            var totalRows = answersInRegion.length;

            answersInRegion.forEach(function(answer) {
                var answerData = { total: 0, males: [], females: [] };

                schoolYears.split(',').forEach(function(year) {
                    var yearData = regionData[region][answer][year] || { male: 0, female: 0 };
                    answerData.total += yearData.male + yearData.female;
                    answerData.males.push(yearData.male);
                    answerData.females.push(yearData.female);
                });

                var percentage = totalPopulation > 0 ? ((answerData.total / totalPopulation) * 100).toFixed(2) : '0.00';

                html += '<tr>';
                if (firstRow) { // 첫번째 답변에서만 지역명을 표시
                    html += '<td rowspan="' + totalRows + '">' + region + '</td>';
                    firstRow = false;
                }
                html += '<td>' + answer + '</td><td>' + answerData.total + '</td><td>' + percentage + '%</td>';
                schoolYears.split(',').forEach(function(_, index) {
                    html += '<td>' + answerData.males[index] + '</td><td>' + answerData.females[index] + '</td>';
                });
                html += '</tr>';
            });
        });

        html += '</tbody></table>';
        return html;
    }

    
    var i = 1;
    questions.forEach(function(question, index) {
        var aggregatedResults = aggregateResultsForQuestion(question, results);
        var summaryData = aggregatedResults.summaryData;
        var regionData = aggregatedResults.regionData;

        // 'i'를 사용하여 동적 ID 접근
        var summaryTableElement = document.getElementById('total_table_' + i);
        if (summaryTableElement) {
            summaryTableElement.innerHTML = createTable(summaryData, '${model.view.school_year}');
        }

        var regionTableElement = document.getElementById('address_table_' + i);
        if (regionTableElement) {
            regionTableElement.innerHTML = createRegionTable(regionData, '${model.view.school_year}');
        }
        i++; // 'i'를 증가시켜 다음 요소 ID에 맞게 조정
    });

	
// 성별 매핑
function mapSex(sex) {
    return sex === 0 ? '여성' : '남성';
}

// 학년 매핑 함수
function mapSchoolYear(school_year) {
    switch (school_year) {
	case 4:
		school_year = '초등학교4학년'
		break;
	case 5:
		school_year = '초등학교5학년'
		break;
	case 6:
		school_year = '초등학교6학년'
		break;
	case 7:
		school_year = '중학교1학년'
		break;
	case 8:
		school_year = '중학교2학년'
		break;
	case 9:
		school_year = '중학교3학년'
		break;
	case 10:
		school_year = '고등학교1학년'
		break;
	case 11:
		school_year = '고등학교2학년'
		break;
	case 12:
		school_year = '고등학교3학년'
		break;
	}
    return school_year
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

// 각 필드별로 데이터 집계
//var addressLocalData = aggregateData(results, 'address_local');
//var aggregatedSexData = transformAndAggregateData(results, 'sex', mapSex); // 성별 데이터
//var aggregatedAgeData = transformAndAggregateData(results, 'school_year', school_year); // 연령대 데이터

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
//var pieDataAddressLocal = createPieChartData(addressLocalData);
//var pieDataJob = createPieChartData(jobData);
//var pieDataSex = createPieChartData(aggregatedSexData);
//var pieDataAge = createPieChartData(aggregatedAgeData);

//console.log(pieDataAddressLocal);
//console.log(pieDataJob);
//console.log(pieDataSex);
//console.log(pieDataAge);

// 차트 생성 함수
function createPieChart(canvasId, data) {
    var ctx = document.getElementById(canvasId).getContext('2d');
    return new Chart(ctx, {
        type: 'pie',
        data: data,
        options: {
            plugins: {
                legend: {
                    position: 'right',
                    align : 'center',
                    labels: {
                            generateLabels: function(chart) {
                                console.log(chart);
                                const data = chart.data;
                                console.log(data);
                                return data.labels.map((label, index) => ({
                                    text: label + ": " + data.datasets[0].data[index],
                                    fillStyle: data.datasets[0].backgroundColor[index],
                                }));
                            }
                    }
                },
                title: {
                    display: false,
                    text: canvasId
                },
                datalabels: {
                color: '#000000',
                anchor: 'center',
                align: 'center',
                formatter: (value, context) => {
                        const data = context.chart.data;
                        const total = data.datasets[0].data.reduce((sum, value) => sum + value, 0);
                        const percentage = total > 0 ? (value / total * 100).toFixed(2) : 0;
                        return percentage + "%";
                    }
                }
            }
        },
    });
}

// 각 차트 생성 (canvasId를 적절히 수정해야 함)
//createPieChart('pieChartAddressLocal', pieDataAddressLocal);
//createPieChart('pieChartJob', pieDataJob);
//createPieChart('pieChartAge', pieDataAge);
//createPieChart('pieChartSex', pieDataSex);

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
        var canvasId = 'questionChart1_' + questionNumber;
        var ctx = document.getElementById(canvasId).getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: chartData,
            options: {
            plugins: {
                legend: {
                    position: 'right',
                    align : 'center',
                    labels: {
                            generateLabels: function(chart) {
                                console.log(chart);
                                const data = chart.data;
                                console.log(data);
                                return data.labels.map((label, index) => ({
                                    text: label + ": " + data.datasets[0].data[index],
                                    fillStyle: data.datasets[0].backgroundColor[index],
                                }));
                            }
                    }
                },
                title: {
                    display: false,
                    text: canvasId
                },
                datalabels: {
                color: '#000000',
                anchor: 'center',
                align: 'center',
                formatter: (value, context) => {
                        const data = context.chart.data;
                        const total = data.datasets[0].data.reduce((sum, value) => sum + value, 0);
                        const percentage = total > 0 ? (value / total * 100).toFixed(2) : 0;
                        return percentage + "%";
                    }
                }
            }
        },
        });
    });
}

//파이 차트 생성
function createPieCharts2(answerFrequencies) {
    Object.keys(answerFrequencies).forEach(questionNumber => {
        var chartData = createPieChartData(answerFrequencies[questionNumber], questionNumber);
        var canvasId = 'questionChart2_' + questionNumber;
        var ctx = document.getElementById(canvasId).getContext('2d');
        new Chart(ctx, {
            type: 'pie',
            data: chartData,
            options: {
            plugins: {
                legend: {
                    position: 'right',
                    align : 'center',
                    labels: {
                            generateLabels: function(chart) {
                                console.log(chart);
                                const data = chart.data;
                                console.log(data);
                                return data.labels.map((label, index) => ({
                                    text: label + ": " + data.datasets[0].data[index],
                                    fillStyle: data.datasets[0].backgroundColor[index],
                                }));
                            }
                    }
                },
                title: {
                    display: false,
                    text: canvasId
                },
                datalabels: {
                color: '#000000',
                anchor: 'center',
                align: 'center',
                formatter: (value, context) => {
                        const data = context.chart.data;
                        const total = data.datasets[0].data.reduce((sum, value) => sum + value, 0);
                        const percentage = total > 0 ? (value / total * 100).toFixed(2) : 0;
                        return percentage + "%";
                    }
                }
            }
        },
        });
    });
}


// 차트 생성
createPieCharts(answerFrequencies);
createPieCharts2(answerFrequencies);

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


});


$(document).ready(function () {
	
	$(".adm_menu_con > li").eq(3).find(".sub_menu_con").show();
	$(".adm_menu_con > li").eq(3).css({
	    backgroundColor: "#fff"
	});
});

</script>
<script>

function finalDown() {
    const pages = document.querySelectorAll('.page1, .page2, #page3');
    const totalPages = pages.length;
    let currentPage = 0;

    // 초기 로딩 알림 설정
    Swal.fire({
        title: 'PDF 생성 중...',
        html: '잠시만 기다려 주세요.<br/> 페이지 1 / ' + totalPages + ' 처리 중...',
        allowOutsideClick: false,
        showConfirmButton: false,
        willOpen: () => {
            Swal.showLoading();
        }
    });

    const doc = new jsPDF('p', 'mm', 'a4'); // PDF 문서 생성

    const captureAndAddToPDF = (element, pageIndex) => {
        // 페이지 처리 시작 전에 로딩 인디케이터 갱신
        if (pageIndex > 0) {
            Swal.showLoading();
        }

        html2canvas(element, {scale: 1, logging: true, useCORS: true}).then(canvas => {
            const imgWidthOriginal = canvas.width;
            const imgHeightOriginal = canvas.height;
            const imgRatio = imgWidthOriginal / imgHeightOriginal; // 원본 이미지의 종횡비 계산
            let imgWidth = 210; // A4의 너비(mm)로 설정
            let imgHeight = imgWidth / imgRatio; // 종횡비에 따라 높이 계산

            if (imgHeight > 297) { // 계산된 높이가 A4의 높이를 초과하는 경우, 높이를 기준으로 너비를 다시 조정
                imgHeight = 297;
                imgWidth = imgHeight * imgRatio;
            }

            const imgData = canvas.toDataURL('image/png');

            if (pageIndex !== 0) {
                doc.addPage();
            }
            doc.addImage(imgData, 'PNG', (210 - imgWidth) / 2, (297 - imgHeight) / 2, imgWidth, imgHeight); // 이미지 중앙에 위치

            currentPage++;
            if (currentPage < totalPages) {
                Swal.update({
                    html: '잠시만 기다려 주세요.<br/> 페이지 ' + (currentPage + 1) + ' / ' + totalPages + ' 처리 중...'
                });
                captureAndAddToPDF(pages[currentPage], currentPage);
            } else {
                doc.save('output.pdf');
                Swal.close(); // 로딩 인디케이터 닫기
                Swal.fire({
                    title: '완료!',
                    text: 'PDF 파일이 성공적으로 생성되었습니다.',
                    icon: 'success',
                    confirmButtonText: '확인'
                });
            }
        });
    };

    captureAndAddToPDF(pages[0], 0);
}




</script>
</html>

