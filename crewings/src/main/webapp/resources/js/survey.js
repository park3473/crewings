//select box 3개

const admin_select_val_1 = `<span class="list_t">선택지</span>
    <select name="select_val" id="select_val">
	<option value="1">1</option>
	<option value="2">2</option>
 <option value="3">3</option>
 <option value="4">4</option>
 <option value="5">5</option>
 <option value="6">6</option>
</select>`;

const admin_select_type_1 = `<div id="select_type_cnt_box"><br><span class="list_t">갯수</span>
<select name="select_type_cnt" id="select_type_cnt">
	<option value="1">1</option>
	<option value="2">2</option>
	<option value="3">3</option>
	<option value="4">4</option>
	<option value="5">5</option>
	<option value="6">6</option>
</select></div>`;


//타입 변경시
function select_type_change(){
	
	var change_val = $('#question_insertForm [name=select_type]').val();

	if(change_val == 'false'){
		
		alert('답안을 선택해주세요.');
		return;
		
	}
	
	if($('#select_input_warp ul').length > 0){
		
		alert('변경시 작성했던 답안들은 사라집니다.');
		$('#select_input_warp ul').remove();
		$('#select_insertForm').hide();
		
		$('#admin_button').html(admin_button_1);
		
	}
	
	switch (change_val) {
	case '0':
		$('#select_val_li').html(admin_select_val_0);
		$('#select_type_cnt_box').remove();
		break;
	case '1':
		$('#select_val_li').html(admin_select_val_1);
		$('#select_type_li').append(admin_select_type_1);
		break;
	}
}


//문제 및 답안 등록
function insertClick(InsertToConnectType)
{

	if($('#question_insertForm [name=exam_idx]').val() != 'false' && $('#question_insertForm [name=seq]').val() == '')
	{
		alert('문항을 입력 하여 주세요.');
		return;
	}else if($('#question_insertForm [name=type]').val() == ''){
		
		alert('타입을 입력 하여 주세요.');
		return;
	}else if($('#question_insertForm [name=name]').val() == ''){
		
		alert('제목을 입력 하여 주세요.');
		return;
	}else if($('#question_insertForm [name=select_type]').val() == ''){
		
		alert('답안 타입을 설정 하여 주세요.');
		return;
	}else if($('#question_insertForm [name=select_val]').val() == ''){
		
		alert('답안 정답을 입력 하여 주세요.');
	}
	
	if($('#select_insertForm #select_input_warp ul').length <= 0){
	
		alert('답안 작성을 해주세요.');
		return;
		
	}
	
	var select_cnt = $('#select_insertForm #select_input_warp ul').length;
	
	for(i = 0; i < select_cnt; i++){
		
		if($('#select_ul_'+i+' [name=seq]').val() == ''){
			alert('선택지를 모두 작성 해주세요.');
			return;
			
		}
		
		if($('#select_ul_'+i+' [name=content]').val() == ''){
			alert('선택지를 모두 작성 해주세요.');
			return;
			
		}
		
	}

	//방식 변경 => question form submit 으로 보내는것이 아닌
	//ajax 로 보내는것으로 변경
	//$('#question_insertForm').submit();
	$('#question_insertForm [name=content]').val(ckeditorInstance.getData());
	
	var questionForm = $('#question_insertForm').serialize();
	
	// /admin/question/AjaxInsert.do
	$.ajax({
		url : '/admin/question/AjaxInsert.do',
		type : 'POST',
		data : questionForm,
		success : function(data , status , xhr){
			
			console.log('question_insert : success');
			console.log('question_idx : ' + data);
			
			var question_idx = data;
			var select_cnt = $('#select_insertForm #select_input_warp ul').length;
			
			for(i = 0; i < select_cnt; i++){
				
				var seq = $('#select_ul_'+i+' [name=seq]').val();
				var content = $('#select_ul_'+i+' [name=content]').val()
				var image = '';
				var image_boolean = 'false';
				
				var SelectForm = new FormData();
				SelectForm.append('seq', seq);
				SelectForm.append('content', content);
				
				if($('#select_ul_'+i+' [name=image][type=file]').val() != null && $('#select_ul_'+i+' [name=image][type=file]').val() != ''){
					var image_boolean = 'true';
					
					SelectForm.append('file', $('#select_ul_'+i+' [name=image]')[0].files[0]); // 파일 입력 필드에서 파일을 가져와 추가합니다
				}else{
					
					if($('#select_ul_'+i+' [name=image][type=text]').val() != null && $('#select_ul_'+i+' [name=image][type=text]').val() != ''){
						
						SelectForm.append('image', $('#select_ul_'+i+' [name=image][type=text]').val());
						
					}else{
					
						SelectForm.append('image', '');
						
					}
					
				}
				SelectForm.append('image_boolean', image_boolean);
				SelectForm.append('question_idx', question_idx);
				
				console.log(i+'번째 답안 보내기');
				
				$.ajax({
					url : '/admin/select/insert.do',
					type : 'POST',
					processData:false,
					contentType :false,
					data : SelectForm,
					success : function(status , xhr){
						
						console.log(i+'번째 답안 보내기 성공');
						
						
					},
					error : function(error , status , xhr){
						
						console.log(i+'번째 답안 보내기 실패');
						
						
					}
					
				})
				
			}
			
			
			if(InsertToConnectType == 'insert'){
				
				console.log('안쪽 모두 종료');
				
				alert('해당 문제가 등록되었습니다.');
				location.href = '/admin/exam/list.do';
				
			}else if(InsertToConnectType == 'connect'){
				
				var exam_idx = $('#question_insertForm [name=exam_idx]').val();
				var seq = $('#question_insertForm [name=seq]').val();
				console.log('exam_idx : ' + exam_idx);
				console.log('seq : ' + seq);
				console.log('question_idx : ' + question_idx);
				console.log('안쪽 모두 종료');
				
				//문제 등록한거 연결
				$.ajax({
					
					url : '/admin/exam/question_list/insert.do',
					type : 'POST',
					data : ({
						exam_idx : exam_idx,
						seq : seq,
						question_idx : question_idx,
					}),
					success : function(status , xhr){
						
						console.log('연결 완료'),
						alert('해당 문제가 등록되었습니다.');
						location.href = '/admin/exam/list.do';		
						
					},
					error : function(status, xhr){
						
					}
					
				})
				
				
			}
			
			
		},
		error : function(error , status , xhr){
			
			console.log('error');
			
		}
		
	})	
	
	
}


//ConnectCilck = 문제 연결
function ConnectClick(){
	
	var question_idx = $('#question_insertForm [name=question_idx]').val();
	var exam_idx = $('#question_insertForm [name=exam_idx]').val();
	var seq = $('#question_insertForm [name=seq]').val();
	
	console.log('question_idx : '+question_idx);
	console.log('exam_idx : ' + exam_idx);
	console.log('seq : ' + seq);
	
	$.ajax({
		url : '/admin/exam/question_list/insert.do',
		type : 'POST',
		data : ({
			question_idx : question_idx,
			exam_idx : exam_idx,
			seq : seq
		}),
		success : function(){
			
			console.log('success');
			alert('연결되었습니다.');
			location.href='/admin/exam/list.do';
			
		},
		error : function(){
		
			console.log('error');
			
		}
	})
	
	
}

//버튼 변경
function button_change(type){
	
	switch (type) {
	case '1':
		$('#admin_button').html(admin_button_1);
		break;
	case '2':
		$('#admin_button').html(admin_button_2);
		break;
	case '3':
		$('#admin_button').html(admin_button_3);
		break;
	}
}


//버튼 4개 구성
const admin_button_1 = `<button class="storage" onclick="select_form_open()">답안 작성</button>
	<button class="storage" onclick="history.back()">뒤로 가기</button>`;   

const admin_button_2 = `<a class="storage" href="javascript:ConnectClick()">문제 연결</a><input type="hidden" value="" name="question_idx">
    <a class="storage" href="javascript:history.back()">뒤로 가기</a>`;
    
const admin_button_3 = `<a class="storage" href="javascript:insertClick('connect')">문제 등록 후 연결</a>
    <a class="storage" href="javascript:history.back()">뒤로 가기</a>`;

const admin_button_4 = `<a class="storage" href="javascript:insertClick('insert')">문제 등록</a>
    <a class="storage" href="javascript:history.back()">뒤로 가기</a>`;

    
//문제 선택창 열기
function question_select(){
	
	if($('#question_insertForm [name=type]').val() == ''){
		alert('해당 타입을 값을 채운뒤 연결을 눌러주세요.');
		return;
	}
	
	//window.open('/admin/question/select_list.do?type='+$('[name=type]').val()+'' , '_blank' ,'width=1200,heigth=1600');
	var typeValue = $('#question_insertForm [name=type]').val();
	var exam_idx = $('#question_insertForm [name=exam_idx]').val();
	var category = $('#question_insertForm [name=category]').val();
	var url = '/admin/question/select_list.do?type=' + typeValue+'&exam_idx='+exam_idx+'&category='+category;

	window.open(url, '문제 연결', 'width=1600, height=800');
	
}

//답안 form 작성
function select_form_open(){
	
	var change_val = $('#question_insertForm [name=select_type]').val();

	if(change_val == 'false'){
		
		alert('답안을 선택해주세요.');
		return;
		
	}
	
	if($('#question_insertForm [name=select_type]').val() == '0'){
		
		select_list_append('2','0','0');
		$('#select_insertForm').show();
		
	}else if($('#question_insertForm [name=select_type]').val() == '1'){
	
		select_list($('#question_insertForm [name=select_type_cnt]').val());
		$('#select_insertForm').show();
		
	}
	
	$('#admin_button').html(admin_button_4);
	
}

//답안 부분 갯수 정리
function select_list(count){
	
	var length = $('#select_input_warp ul').length;
	var select_type = $('#question_insertForm [name=select_type]').val();
	console.log('count : ' + count);
	console.log('length : ' + length);
	console.log('select_type : ' + select_type)
	
	if(length > count){
		//빼는거
		count = length - count;
		console.log(count);
		
		select_list_delete(count);
		
	}else if(length == count){
		//아무행동 X
	}else{
		count = count - length
		console.log(count);
		
		select_list_append(count , length , select_type);
	}
	
}

//답안 부분 생성
function select_list_append(count , length , select_type){
	
	for(var i = 0; i < count; i ++){
		var ul = Number(i) + Number(length);
		//넣을 html 생성
		var html = `<ul class="member_input" id="select_ul_`+ul+`">`;
		html += `<li>`;
		if(select_type == '0'){
			if(i == 0){
				var OX = '1'
			}else if(i == 1){
				var OX = '2'
			}
			html += `번호<input type="text" name="seq" value="`+OX+`">`;	
		}else if(select_type == '1' || select_type == '2' || select_type == '3'){
			html += `번호<input type="text" name="seq" value="`+(i+1)+`">`;
		}
		html += `</li>`;
		
		html += `<li>`;
		if(select_type == '0'){
			if(i == 0){
				var OX = 'O'
			}else if(i == 1){
				var OX = 'X'
			}
			html += `내용<input type="text" name="content" value="`+OX+`">`;	
		}else if(select_type == '1' || select_type == '2' || select_type == '3'){
			html += `내용<input type="text" name="content" value="">`;
		}
		html += `</li>`;
		
		
		if(select_type == '1' || select_type == '2' || select_type == '3'){
		
			html += `<li>`;
			
			if(select_type == '1'){
				html += `이미지<input type="file" name="image" value="">`;
			}else if(select_type == '2' || select_type == '3'){
				html += `이미지<input type="text" name="image" value="">`;
				if(select_type == '3'){
					html += `<button type="button" onclick="image_change(this , '`+i+`')">이미지 변경</button>`;
				}
			}
			html += `</li>`;
			
		}
		
		html += `</ul>`;
		
		$('#select_input_warp').append(html);
		
		$('#select_insertForm').show();
		
	}
	
}

window.addEventListener('DOMContentLoaded', (event) => {
    var links = document.getElementsByTagName('a'); // 모든 링크를 가져옵니다.

    for (var i = 0; i < links.length; i++) {
        links[i].addEventListener('click', function(e) {
        	
            var confirmed = confirm('정말 해당 페이지를 이동하시겠습니까?\n해당 작성하던 문제는 사라집니다.');

            if (!confirmed) {
                // 사용자가 확인을 선택하지 않은 경우, 페이지 이동을 취소합니다.
                e.preventDefault();
            }
        });
    }
});

//답안 부분 삭제
function select_list_delete(count){
	
	for(i = 0; i < count; i ++){
		
		$('#select_input_warp ul:last').remove();
		
	}
	
}

//이미지 변경
function image_change(e,list_idx){
	
	console.log(e);
	console.log($('#select_ul_'+list_idx+''));
	$(e).before('<input type="file" name="image">');
	$('#select_ul_'+list_idx+' [name=image][type=text]').remove();
	$(e).remove();
	
}