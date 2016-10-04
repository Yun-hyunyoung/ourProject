/*	include/image-find
	ImageSearch Event	*/ 
$(".img-text").on("click", function() {
	var country = $(this)[0].textContent;
	$("#imgSearchCountry").val(country);
	$("#imgSearchForm").submit();
})

/*	include/find.jsp
 *  Search Button Event		*/
function boardList(f){
	f.action="BoardListServlet";
	f.submit();
}

/*  login/loginForm.jsp 
	find Password Events	*/
$("#findPwBtn").on("click", function(event) {
	$.ajax({
		type:'post',
		url:'search/memberSearchByPasswd.jsp',
		data:{userid:$("#userid_findpw").val()},
		dataType:'text',
		success:function(responseData){
			if(responseData.trim() == 'none'){
				$("#checkId").html("<h5 style='color:red;'>이메일이 일치하지 않습니다.</h5>");
			}else{
				$("#showSubmit").html("<h4><input class='form-control input-lg' type='submit' value='발송'></h4>");
			}
		}
	})
})

$("#findPwBtn").on('click', function() {
	$("#checkId").html("");
	$("#showSubmit").html("");
})

$("#findPwClose").on('click', function() {
	window.close();
})

/*	member/addMemberForm.jsp
	add member Validation Event		*/
$(".id-valid-ck").on("focusout", function() {
	if($(".id-valid-ck").val() == ""){
		$('.valid-id').html('<h5>E-mail을 입력해주세요.</h5>');
	} else if(isEmail($(".id-valid-ck").val())){
		$.ajax({
			type:'post',
			url:'search/memberSearchByPasswd.jsp',
			data: {userid: $(".id-valid-ck").val()},
			dataType: 'text',
			success: function(data) {
				if(data.trim() == 'none'){
					$('.valid-id').html('<h5>사용 가능한 아이디입니다.</h5>');
					$(".valid-submit").prop("type", "submit");
				}else{
					$('.valid-id').html('<h5>중복된 아이디입니다.</h5>');
					$(".valid-submit").prop("type", "button");
				}
			}
		})
	} else{
		$('.valid-id').html('<h5>E-mail 형식으로 입력해주세요.</h5>');
		$(".valid-submit").prop("type", "button");
	}
})

function isEmail(email) {
  var regex = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
  return regex.test(email);
}

$(".id-valid-ck").on("focus", function(){
	$(".valid-id").html('');
})

$(".valid-submit").on("click", function(event) {
	if($(".id-valid-ck").val() == ""){
		console.log("야호");
		event.preventDefault();
	} else if(!isEmail($(".id-valid-ck").val())){
		console.log("야호1");
		event.preventDefault();
	} else if (($("#passwd2").val() != $("#passwd").val())){
		console.log("야호2");
		event.preventDefault();
	}
})

$("#passwd2").on("focusout", function() {
	if ($("#passwd2").val() != "" && $("#passwd2").val() == $("#passwd").val()) {
		$(".valid-pass").html("<h5>비밀번호 일치힙니다.</h5>");
		$(".valid-submit").prop("type", "submit");
	} else if ($("#passwd2").val() != ""){
		$(".valid-pass").html("<h5>비밀번호 불일치합니다.</h5>");
		$(".valid-submit").prop("type", "button");
	}
})

$("#passwd2").on("focus", function() {
	$(".valid-pass").html("");
})
$("#passwd").on("focus", function() {
	$(".valid-pass").html("");
})
/*	write.jsp
 * 	Board Write Form Event
 *  return list function
 */
function boardWrite(f) { 
	f.action="BoardWriteServlet"; 
	f.submit(); 
} 
function goBack(){ 
	window.history.back(); 
} 

/*	update.jsp
 * 	Board Update Form Event
 *  return retrieve function
 */
function update(f) {
	f.action="BoardUpdateServlet";
	f.submit();
}
function cancle(f){
	f.action="BoardRetrieveServlet";
	f.submit();
}

/*
 * 	mediate.jsp
 *  Button Event => request/guider
 */
$(document).ready(function () {
	$("#request").on("click",function(){
		location.href="BoardMediateListServlet?separator=request";
	});
	
	$("#guider").on("click",function(){
		location.href="BoardMediateListServlet?separator=guider";
	});
});

/*
 *	mediateRetrieve.jsp
 *	confirm,cancle,list function 
*/
function mediateConfirmfunction(f) {
	location.href="BoardMediateConfirmServlet";
}
function mediateCancelfunction(f) {
	location.href="BoardMediateCancelServlet";
}
function mediateListfunction(f) {
	location.href="BoardMediateListServlet";
}
function mediateApprovalfunction(data,scb_num) {
	location.href="BoardMediateRetrieveServlet?data="+data+"&scb_num="+scb_num;
}