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

results.push(new Result(
			'5',
			'7',
			'test',
			'pkh',
			'1,2,1,1,4,3,2,5,2,4,1,2,5,2,1,2,1,2,2',
			'1',
			'대전',
			parseInt('2'),
			'회사원',
			parseInt('1')
));

results.push(new Result(
			'9',
			'7',
			'test',
			'pkh',
			'1,2,1,1,4,2,2,1,4,3,2,1,2,1,4,1,2,1,2',
			'1',
			'대전',
			parseInt('2'),
			'회사원',
			parseInt('1')
));

results.push(new Result(
			'10',
			'7',
			'test',
			'pkh',
			'1,1,2,1,3,4,4,3,5,3,1,1,2,1,3,1,2,2,3',
			'1',
			'대전',
			parseInt('2'),
			'회사원',
			parseInt('1')
));

results.push(new Result(
			'11',
			'7',
			'test',
			'pkh',
			'1,2,4,1,3,3,3,4,5,3,1,1,2,1,2,1,2,1,2',
			'1',
			'대전',
			parseInt('2'),
			'회사원',
			parseInt('1')
));

results.push(new Result(
			'7',
			'7',
			'test1111',
			'관리자테스트',
			'1,2,1,1,4,3,2,1,4,3,2,1,4,2,4,1,2,1,4',
			'1',
			'서울',
			parseInt('3'),
			'회사원',
			parseInt('1')
));

results.push(new Result(
			'12',
			'7',
			'test1111',
			'관리자테스트',
			'1,2,2,2,1,2,3,6,4,2,2,1,3,2,2,1,3,2,2',
			'1',
			'서울',
			parseInt('3'),
			'회사원',
			parseInt('1')
));

results.push(new Result(
			'8',
			'7',
			'test11112',
			'박경호2',
			'1,2,3,1,1,3,2,1,6,3,1,2,2,1,1,1,1,2,1',
			'1',
			'대전',
			parseInt('1'),
			'학생',
			parseInt('0')
));

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