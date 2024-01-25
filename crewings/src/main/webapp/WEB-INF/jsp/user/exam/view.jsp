<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!--삭제금지-->
<!DOCTYPE html>
<html lang="ko">

<style>

body{
	background-color: #eee;
	font-size: 18px;
}
.grid{
	width: 100%; height: auto;
	margin: 0 auto;
	background-color: #fff;
	padding: 10px 50px 50px 50px;
}

.grid h1{
	background-color: #57636e; color: #fff;
	font-family: sans-serif; font-size: 60px;
	text-align: center;
	padding: 2px 0px;
	border-radius: 30px;
}
#grid #question{
	font-family: sans-serif;
	font-size: 30px;
	color: #5a6772;
}
#buttons{ margin-top: 30px; }
#btn0, #btn1, #btn2, #btn3, #btn4, #btn5, #btn6{
	background-color: #778897; color: #fff;
	width: 100%;
	font-size: 16px;
	border: 1px solid #1d3c6a;
	border-radius: 30px;
	margin: 30px 40px 10px 0px;
	padding: 10px;
}
#progress{
	color: #2b2b2b;
	font-size: 20px;
}

#btn0:hover, #btn1:hover, #btn2:hover, #btn3:hover,#btn4:hover,#btn5:hover,#btn6:hover{
	cursor: pointer;
	background-color: #57636e;
}
#btn0:focus, #btn1:focus, #btn2:focus, #btn3:focus, #btn4:focus, #btn5:focus, #btn6:focus{
	outline: 0;
}

#score{ text-align: center; } /* 결과 점수 */

#quiz_btn{
	display:flex;
	flex-wrap:wrap;
	text-align : center;
	gap: 2em;
}



.select_div{
    display: flex;
    flex-direction: column;
	flex-basis:150px;
	flex-grow:1;
}

.select_div img {
    border-radius: 10px;
	flex-grow: 1;
}

.max_img img{border-radius:10px}


</style>
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
                        <div class="font_noto cont"><span class="f_wet_05">응답기간 : </span><span class="t_spa_00">${fn:substring(model.view.start_tm,0,11) } ~ ${fn:substring(model.view.end_tm,0,11) }</span></div>
                    </li>
                    <li>
                        <div class="font_noto cont"><span class="f_wet_05">응답사례 : </span><span style="color:#ff0000;font-size:24px;font-weight:700">${model.view.point }</span> 포인트 리워드</div>
                        <div class="font_noto cont"><span class="f_wet_05">설문소개 : </span>${model.view.coment }</div>
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
        <div class="modal-dialog" style="max-width: 900px; !important;">
            <div class="modal-content" style="min-height: 300px !important;">

                <!-- Modal Header -->
                <div class="modal-header">
                    <h4 class="modal-title txt_30 font_noto">Quiz</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
				<div class="grid">
					<div id="quiz">
						<div style="margin-top:20px"></div>
			
						<p id="question" class="font_noto txt_20"></p>
						<div id="q_content" class="max_img" style="text-align:center;padding:30px 0">
						
						</div>
						<div class="button d-flex" id="quiz_btn">
						</div>
						<hr style="margin-top:100px">
						<div id="quiz_solution" style="display:none;">
						
						</div>
					</div>
			
				</div><!-- end grid -->

                <!-- Modal footer -->
                <div class="modal-footer">
                	<button type="button" class="btn btn-danger"   id="next_btn" onclick="next_quiz()">Next</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal" id="Close_btn">Close</button>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- 설문모달 끝 -->
 
 <form style="display:none" id="exam_result" action="/user/exam/result/insert.do" method="POST">
 	<input type="text" name="exam_idx" value="${model.view.idx }">
 	<input type="text" name="member_id" value="${sessionScope.UserId }">
 	<input type="text" name="name" value="${sessionScope.UserName }">
 	<input type="text" name="select_list" value="">
 	<input type="text" name="complete" value="1">
 	<input type="text" name="point" value="${model.view.point }">
 </form>
 
 
<!--공통하단-->
<%@ include file="../../include/user/footer.jsp" %>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
<script src="/resources/js/api_key.js"></script>
<script type="text/javascript">

let currentAudio = null;

function speak(speech_text) {
	
	if(currentAudio) {
	    currentAudio.pause(); // 현재 재생 중인 오디오가 있다면 중지
	    currentAudio = null;
	  }
	
	  const url = "https://texttospeech.googleapis.com/v1/text:synthesize?key=" + apiKey;
	  const data = {
	        "audioConfig": {
	        "audioEncoding": "LINEAR16",
	        "effectsProfileId": [
	          "small-bluetooth-speaker-class-device"
	        ],
	        "pitch": 0,
	        "speakingRate": 1
	      },
	      "input": {
	        "text": speech_text
	      },
	      "voice": {
	        "languageCode": "ko-KR",
	        "name": "ko-KR-Neural2-A"
	      }
	  }
	  const otherparam = {
	    headers: {
	      "content-type": "application/json; charset=UTF-8"
	    },
	    body: JSON.stringify(data),
	    method: "POST"
	  }
	  fetch(url, otherparam)
	    .then(response => response.json())
	    .then(res => {
	      const blobUrl = base64ToBlobUrl(res.audioContent)
	     currentAudio = new Audio(blobUrl); // 오디오 객체를 전역 변수에 저장
	      currentAudio.play();
	    })
	    .catch(error => console.error(error));
	}

	function base64ToBlobUrl(base64) {
	  const bin = atob(base64.replace(/^.*,/, ''));
	  const buffer = new Uint8Array(bin.length);
	  for (let i = 0; i < bin.length; i++) {
	    buffer[i] = bin.charCodeAt(i);
	  }
	  return URL.createObjectURL(new Blob([buffer.buffer], {type: "audio/mp3"}));
	}
</script>
<c:if test="${model.beforeData.category == '1' }">
<script type="text/javascript">
//퀴즈 객체 생성
function Question(text, category ,choice,choice_cnt, answer,image,solution , content  , greet ){
	this.text = text;
	this.choice = choice;
	this.choice_cnt = choice_cnt;
	this.answer = answer;
	this.image = image;
	this.solution = solution;
	this.content = content;
	this.category = category;
	this.greet = greet;
}

// 퀴즈 정보 객체 생성
function Quiz(questions){
	this.score = 0;		// 점수
	this.questions = questions;		// 질문[]
	this.questionIndex = 0;		// 질문 순서
}

// ---------------------------------------------------------------------
var questions = [];

questions.push(new Question('','','','','','','','<img src="/resources/upload/exam/image/${model.view.image}">',''));
questions.push(new Question('','','','','','','','${model.view.content}',''));
questions.push(new Question('','','','','','','','${model.view.greet}',''));
<c:forEach var="item" items="${model.questionlist}">
questions.push(new Question('${item.name}','${item.category}',[
		 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
		 '${choice}',
		 </c:forEach>
		 ],
		 '${fn:length(fn:split(item.Choices, "#"))}'
		 ,
		'${item.select_val}',
		[
			 <c:forEach var="choiceImage" items="${fn:split(item.ChoicesImage, '#')}">
			 '${choiceImage}',
			 </c:forEach>	
		],
		'${item.solution}',
		'${item.content}',
		'${item.greet}'
		));
</c:forEach>


// 퀴즈 생성
var quiz = new Quiz(questions);

function update_quiz(){
	$("#quiz_btn").empty();
    var currentQuestion = quiz.questions[quiz.questionIndex];

    var questionElement = document.getElementById('question');
    var questionContentElement = document.getElementById('q_content');

    // 문제 내용과 추가 내용을 표시
    questionElement.innerHTML = currentQuestion.text; 
    questionContentElement.innerHTML = currentQuestion.content;

    var speech_text = '';
	speech_text += currentQuestion.text;
    
    // 선택지가 있는 경우에만 선택지 관련 HTML 생성
    if(currentQuestion.choice_cnt && currentQuestion.choice_cnt > 0){
        var html = '';
        for(var i = 0; i < currentQuestion.choice_cnt; i++){
            if(currentQuestion.image[i] == '' || currentQuestion.image[i] == null){
                html += '<div class="select_div"><button id="btn'+i+'"><span id="choice'+i+'"></span></button></div>';
            } else {
                html += '<div class="select_div max_img"><img src="/resources/upload/select/image/'+currentQuestion.image[i]+'"><button id="btn'+i+'"><span id="choice'+i+'"></span></button></div>';
            }
        }
        $('#quiz_btn').append(html);
        for(var i = 0; i < currentQuestion.choice_cnt; i++){
            var choiceButton = document.getElementById('btn'+i);
            choiceButton.innerHTML = currentQuestion.choice[i];
            answer('btn' + i, choiceButton, i+1);
            speech_text += (i+1)+'번'
            speech_text += currentQuestion.choice[i];
            
        }

        // 선택지가 있으므로 next 버튼은 숨김
        $('#next_btn').hide();
    } else {
        // 선택지가 없으면 next 버튼을 바로 표시
        $('#next_btn').show();
    }
    
	$('#quiz_solution').empty();
	var solution = '<p>'+quiz.questions[quiz.questionIndex].solution+'</p>';
	$('#quiz_solution').append(solution);
	
	console.log(speech_text);
	
	if(speech_text != ''){
		speak(speech_text);
	}
	
	progress();
}

// 판정
function answer(id, choice,select_val){
	choice.onclick = function(){
		var answer = quiz.questions[quiz.questionIndex].answer; // 정답
	console.log(id);
		console.log(answer);		
		
		//선택한 거 select_list 담기
		if($('[name=select_list]').val() == ''){
			$('[name=select_list]').val(select_val);
		}else{
			$('[name=select_list]').val($('[name=select_list]').val()+','+select_val);
		}
		
		var speech_text = '';
		
		// 정답 판정
		if(select_val == answer){
			console.log('true');
			alert('정답입니다.');
			quiz.score++;
			speech_text += '정답입니다.';
		} else{
			alert('오답입니다!'); 
			speech_text += '오답입니다.';	
		}

		speech_text += quiz.questions[quiz.questionIndex].solution;
		
		console.log(speech_text);
		
		if(speech_text != ''){
			speak(speech_text);
		}
		
		
		$('#quiz_btn button').attr('disabled','disabled');
		$('#quiz_solution').show();
		$('#next_btn').show();

		
		
		
/* 		if(quiz.questionIndex < quiz.questions.length-1){
			quiz.questionIndex ++;
			update_quiz();
		} else { result(); }
 */
 
	} // end onclick
} // end anwer()

// 문제 진행 정보 표시(x of y)
function progress(){
	var progress = document.getElementById('progress');
	progress.innerHTML = "문제 " + (quiz.questionIndex+1) + " / " + quiz.questions.length;
}

function result(){
	var el = document.getElementById('quiz');
	var per = parseInt((quiz.score*100) / (quiz.questions.length -2) );
	el.innerHTML =	'<h1 style="font-size:24px;padding:10px 0;margin-top:50px">결과</h1>' +
					'<h2 id="score"> 당신의 점수: ' + quiz.score + '/' +  
					(quiz.questions.length -2) + '<br><br><span style="color:#dc3545;font-size:30px;font-weight:700">' + per + '</span>점</h2>' +
					'<button style="width:100%;padding:10px 0;margin-top:15px" type="button" class="btn btn-danger" onclick="exam_result()">진단 종료하기</button>';

					
	$('#Close_btn').hide();
}

function next_quiz(){
	
	if(currentAudio) {
	    currentAudio.pause(); // 현재 재생 중인 오디오를 중지
	    currentAudio = null;
	  }
	
	$('#quiz_solution').hide();
	$('#next_btn').hide();
	
	if(quiz.questionIndex < quiz.questions.length-1){
		quiz.questionIndex ++;
		update_quiz();
	} else { result(); }
	
	
	
}

function exam_result(){
	
	alert('참여해주셔서 감사합니다.\n결과는 마이CN패널 에서 확인가능합니다.');
	$('#exam_result').submit();
	
}

update_quiz();
</script>
</c:if>

<!-- 설문js -->
<c:if test="${model.beforeData.category == '0' }">
<script type="text/javascript">
//퀴즈 객체 생성
function Question(text, category ,choice,choice_cnt, answer,image,solution , content , greet  ){
	this.text = text;
	this.choice = choice;
	this.choice_cnt = choice_cnt;
	this.answer = answer;
	this.image = image;
	this.solution = solution;
	this.content = content;
	this.greet = greet;
	this.category = category;
}

// 퀴즈 정보 객체 생성
function Quiz(questions){
	this.score = 0;		// 점수
	this.questions = questions;		// 질문[]
	this.questionIndex = 0;		// 질문 순서 dddd
}

// ---------------------------------------------------------------------
var questions = [];
questions.push(new Question('','','','','','','','<img src="/resources/upload/exam/image/${model.view.image}">',''));
questions.push(new Question('','','','','','','','${model.view.content}',''));
questions.push(new Question('','','','','','','','${model.view.greet}',''));

<c:forEach var="item" items="${model.questionlist}">
questions.push(new Question('${item.name}','${item.category}',[
		 <c:forEach var="choice" items="${fn:split(item.Choices, '#')}">
		 '${choice}',
		 </c:forEach>
		 ],
		 '${fn:length(fn:split(item.Choices, "#"))}'
		 ,
		'${item.select_val}',
		[
			 <c:forEach var="choiceImage" items="${fn:split(item.ChoicesImage, '#')}">
			 '${choiceImage}',
			 </c:forEach>	
		],
		`${item.solution}`,
		'${item.content}',
		'${item.greet}'
		));
</c:forEach>


// 퀴즈 생성
var quiz = new Quiz(questions);

function update_quiz(){
	$("#quiz_btn").empty();
    var currentQuestion = quiz.questions[quiz.questionIndex];

    var questionElement = document.getElementById('question');
    var questionContentElement = document.getElementById('q_content');

    // 문제 내용과 추가 내용을 표시
    questionElement.innerHTML = currentQuestion.text; 
    questionContentElement.innerHTML = currentQuestion.content;

    //문제 음성 생성
    var speech_text = '';
	speech_text += currentQuestion.text;
    
    // 선택지가 있는 경우에만 선택지 관련 HTML 생성
    if(currentQuestion.choice_cnt && currentQuestion.choice_cnt > 0){
        var html = '';
        for(var i = 0; i < currentQuestion.choice_cnt; i++){
            if(currentQuestion.image[i] == '' || currentQuestion.image[i] == null){
                html += '<div class="select_div"><button id="btn'+i+'"><span id="choice'+i+'"></span></button></div>';
            } else {
                html += '<div class="select_div max_img"><img src="/resources/upload/select/image/'+currentQuestion.image[i]+'"><button id="btn'+i+'"><span id="choice'+i+'"></span></button></div>';
            }
        }
        $('#quiz_btn').append(html);
        for(var i = 0; i < currentQuestion.choice_cnt; i++){
            var choiceButton = document.getElementById('btn'+i);
            choiceButton.innerHTML = currentQuestion.choice[i];
            answer('btn' + i, choiceButton, i+1);
            speech_text += (i+1)+'번'
            speech_text += currentQuestion.choice[i];
        }

        // 선택지가 있으므로 next 버튼은 숨김
        $('#next_btn').hide();
    } else {
        // 선택지가 없으면 next 버튼을 바로 표시
        $('#next_btn').show();
    }
    
	$('#quiz_solution').empty();
	var solution = '<p>'+quiz.questions[quiz.questionIndex].solution+'</p>';
	$('#quiz_solution').append(solution);
	
	console.log(speech_text);
	
	if(speech_text != ''){
		speak(speech_text);
	}
	
	progress();
}

// 판정
function answer(id, choice,select_val){
	choice.onclick = function(){
		var answer = quiz.questions[quiz.questionIndex].answer; // 정답
	console.log(id);
		console.log(answer);		
		
		//선택한 거 select_list 담기
		if($('[name=select_list]').val() == ''){
			$('[name=select_list]').val(select_val);
		}else{
			$('[name=select_list]').val($('[name=select_list]').val()+','+select_val);
		}

		$('#quiz_btn button').attr('disabled','disabled');
		$('#quiz_solution').show();
		$('#next_btn').show();
		
		var speech_text = '';
		speech_text += quiz.questions[quiz.questionIndex].solution;
		
		console.log(speech_text);
		
		if(speech_text != ''){
			speak(speech_text);
		}
		
		
		
		
/* 		if(quiz.questionIndex < quiz.questions.length-1){
			quiz.questionIndex ++;
			update_quiz();
		} else { result(); }
 */
 
	} // end onclick
} // end anwer()

// 문제 진행 정보 표시(x of y)
function progress(){
	var progress = document.getElementById('progress');
	progress.innerHTML = "문제 " + (quiz.questionIndex+1) + " / " + quiz.questions.length;
}

function result(){
	var el = document.getElementById('quiz');
	el.innerHTML =	'<button style="margin-top: 50px; width:100%;padding:15px" type="button" class="btn btn-danger" onclick="exam_result()">설문 종료하기</button>';
	$('#Close_btn').hide();
}

function next_quiz(){
	
	if(currentAudio) {
	    currentAudio.pause(); // 현재 재생 중인 오디오를 중지
	    currentAudio = null;
	  }
	
	$('#quiz_solution').hide();
	$('#next_btn').hide();
	
	if(quiz.questionIndex < quiz.questions.length-1){
		quiz.questionIndex ++;
		update_quiz();
	} else { result(); }
	
	
	
}

function exam_result(){
	
	alert('참여해주셔서 감사합니다.\n결과는 마이CN패널 에서 확인가능합니다.');
	$('#exam_result').submit();
	
}

update_quiz();
</script>
</c:if>