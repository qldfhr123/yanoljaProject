// adminRegister.jsp
function adminAgreeSelectAll(selectAll) {
	const checkboxes = document.getElementsByName('agreement');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked;
	})
}

function checkSelectAll() {
	// 전체 체크박스
	const checkboxes = document.querySelectorAll('input[name="agreement"]');
	// 선택된 체크박스
	const checked = document.querySelectorAll('input[name="agreement"]:checked');
	// select all 체크박스
	const selectAll = document.querySelector('input[name="selectAll"]');

	if (checkboxes.length === checked.length) {
		selectAll.checked = true;
	} else {
		selectAll.checked = false;
	}
}

function adminPwRegCheck() {

	let adminPw = document.getElementById('adminPw');
	let adminPwReg = document.getElementById('adminPwReg');
	//let pwRegNum = /^(?=.*[0-9])$/;
	let pwRegNum = /^(?=.*\d)$/;
	let pwRegCapital = /^(?=.*[a-zA-Z])$/;
	let pwRegSpecial = /^(?=.*[!@#$%^*+=-])$/;
	let pwRegRange = /^.{6,12}$/;
	let adminPwRegCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{6,12}$/;
	if (adminPw.value == "") {
		adminPwReg.innerHTML = ''
	}

	if (!adminPwRegCheck.test(adminPw.value)) {
		adminPwReg.style = 'color:red;';
		adminPwReg.innerHTML = '* 숫자+영문자+특수문자 조합 6~ 12자리만 가능'
	} else {
		adminPwReg.innerHTML = '* 사용가능한 비밀번호입니다.'
		adminPwReg.style = 'color:#666;';
	}

}

function adminPwCheck() {

	let adminPw = document.getElementById('adminPw');
	let adminPwConfirm = document.getElementById('adminPwConfirm');
	let adminPwReg = document.getElementById('adminPwReg');
	let adminPwRegCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{6,12}$/;
	let adminPwCheck = document.getElementById('adminPwCheck');
	if (!adminPwRegCheck.test(adminPw.value)) {
		adminPwReg.innerHTML = '* 영문+숫자+특수문자만을 사용해주세요.'
	}
	if (adminPw.value == null) {
		adminPwCheck.innerHTML = ''
	} else if (adminPw.value == adminPwConfirm.value) {
		adminPwCheck.innerHTML = '* 일치합니다.'
		adminPwCheck.style = 'color:#666;';
	} else {
		adminPwCheck.innerHTML = '* 불일치,비밀번호를 확인해주세요.'
		adminPwCheck.style = 'color:red;';
	}
}

function businessNumberCheck() {
	let businessNumber = document.getElementById('businessNumber');
	let businessNumberCheck = document.getElementById('businessNumberCheck');
	let businessNumberReg = /^(?=.*[0-9]).{10,}$/;

	if (!businessNumberReg.test(businessNumber.value)) {
		businessNumberCheck.style = 'color:red;';
		businessNumberCheck.innerHTML = '* - 없이 숫자로만 10자리입니다.'
	} else {
		businessNumberCheck.innerHTML = '* 사용가능한 사업자번호입니다.'
		businessNumberCheck.style = 'color:#666;';
	}

}

function dupCheck() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'dupCheck')
	xhr.send(document.getElementById('adminId').value)
	xhr.onreadystatechange = dupCheckProc
}
function dupCheckProc() {
	document.getElementById('adminIdCheck').innerHTML = xhr.responseText;
}

function adminExecDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			if (data.userSelectedType === 'R') {
				document.getElementById('adminAddress').value = data.roadAddress;
			} else {
				document.getElementById('adminAddress').value = data.jibunAddress;
			}
			document.getElementById('postcode').value = data.zonecode;
		}
	}).open();
}

function adminAllCheck() {
	let adminAgreeBtn1 = document.getElementById('adminAgreeBtn1');
	let adminAgreeBtn2 = document.getElementById('adminAgreeBtn2');
	let adminId = document.getElementById('adminId');
	adminIdCheck = document.getElementById('adminIdCheck');
	let adminPw = document.getElementById('adminPw');
	adminPwCheck = document.getElementById('adminPwCheck')
	adminPwReg = document.getElementById('adminPwReg')
	let adminName = document.getElementById('adminName');
	let adminMobile = document.getElementById('adminMobile');
	let adminLocation = document.getElementById('adminLocation');
	let region = document.getElementById('region');
	let businessNumber = document.getElementById('businessNumber');
	let businessNumberCheck = document.getElementById('businessNumberCheck');

	if (!adminAgreeBtn1.checked || !adminAgreeBtn2.checked) {
		alert('필수 이용약관을 동의하지 않았습니다.');
	} else if (adminId.value == "") {
		alert('아이디를 입력하세요.');
	} else if (adminIdCheck.textContent !== '사용 가능한 아이디입니다.') {
		alert('아이디 중복확인은 필수 항목입니다.');
	} else if (adminPw.value == "") {
		alert('비밀번호를 입력하세요.');
	} else if (adminPwReg.textContent !== '* 사용가능한 비밀번호입니다.') {
		alert('비밀번호는 영문+숫자+특수문자만을 사용해주세요.');
	} else if (adminPwCheck.textContent !== '* 일치합니다.') {
		alert('비밀번호 확인을 다시 시도하세요.');
	} else if (adminName.value == "") {
		alert('이름을 입력하세요.');
	} else if (adminMobile.value == "") {
		alert('연락처를 입력하세요.');
	} else if (adminMobile.value == "") {
		alert('연락처를 입력하세요.');
	} else if (region.value == "") {
		alert('지역을 선택하세요.');
	} else if (businessNumber.value == "") {
		alert('사업자번호를 입력하세요.');
	} else if (businessNumberCheck.textContent !== '* 사용가능한 사업자번호입니다.') {
		alert('사업자번호는 숫자 10자리로만 입력하세요.');
	} else {
		var f = document.getElementById('f');
		f.submit();
	}
}

// reservationManager.jsp
// 숙소 클릭 시 해당숙소 예약 확인 함수

function adminUpdateAllCheck() {
	let adminPw = document.getElementById('adminPw');
	let adminPwCurrent = document.getElementById('adminPwCurrent');
	adminPwCheck = document.getElementById('adminPwCheck')
	adminPwReg = document.getElementById('adminPwReg')
	let adminName = document.getElementById('adminName');
	let adminMobile = document.getElementById('adminMobile');
	let adminLocation = document.getElementById('adminLocation');
	let region = document.getElementById('region');
	let businessNumber = document.getElementById('businessNumber');
	let businessNumberCheck = document.getElementById('businessNumberCheck');

	if (adminPw.value == "") {
		alert('비밀번호를 입력하세요.');
	} else if (adminPwReg.textContent !== '* 사용가능한 비밀번호입니다.') {
		alert('수정할 비밀번호는 영문+숫자+특수문자만을 사용해주세요.');
	} else if (adminPwCheck.textContent !== '* 일치합니다.') {
		alert('수정할 비밀번호 확인을 다시 시도하세요.');
	} else if (adminName.value == "") {
		alert('이름을 입력하세요.');
	} else if (adminPwCurrent.value == "") {
		alert('현재 비밀번호를 입력하세요.');
	} else if (adminMobile.value == "") {
		alert('연락처를 입력하세요.');
	} else if (region.value == "") {
		alert('지역을 선택하세요.');
	} else if (businessNumber.value == "") {
		alert('사업자번호를 입력하세요.');
	} else if (businessNumberCheck.textContent !== '* 사용가능한 사업자번호입니다.') {
		alert('사업자번호는 숫자 10자리로만 입력하세요.');
	} else {
		var f = document.getElementById('f');
		alert('회원 정보가 수정되었습니다.');
		f.submit();
	}
}


function reservationCheck() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'reservationCheck')
	xhr.send(document.querySelector('input[type=radio][name="reservatinRadio"]:checked').value)
	xhr.onreadystatechange = reservationCheckProc
}

function reservationCheckProc() {
	var reservationData = JSON.parse(xhr.responseText)
	console.log('숙소 예약 클릭함')
	if (xhr.readyState === 4 && xhr.status === 200) {

		var result = "";

		if (reservationData == '') {

			document.getElementById('selecetdPlace').innerHTML = '선택한 숙소 : ' + document.querySelector('input[type=radio][name="reservatinRadio"]:checked').value + ' <h3>현재 예약이 없습니다.</h3>';

			document.getElementById('reservationTbody').innerHTML = '';
		} else {
			for (i = 0; i < reservationData.length; i++) {
				result += "<tr>";
				result += "<td>" + (i+1) + "</td>";
				result += "<td>" + reservationData[i].roomName + "</td>";

				peopleSum = Number(reservationData[i].people) + Number(reservationData[i].children) + Number(reservationData[i].peoplePlus);

				result += "<td>" + peopleSum + "</td>";
				result += "<td>" + reservationData[i].userName + "</td>";
				result += "<td>" + reservationData[i].userMobile + "</td>";
				result += "<td id=\"" + 'reseNum' + i + "\">" + reservationData[i].reseNum + "</td>";
				result += "<td>" + reservationData[i].checkIn + "</td>"
				var checkInName = 'checkIn' + i;
				var checkOutName = 'checkOut' + i;

				if (reservationData[i].clickCheckIn == '' || reservationData[i].clickCheckIn == null) {
					result += "<td><input type=\"button\" class=\"checkInOutBtn\" value=\"체크인\" onclick=\"testCheckIn(this)\" id=\"" + checkInName + "\" ></button>"
					result += "<label id=\"" + checkInName + "Label" + "\"></label></td>"
					result += "<td>" + reservationData[i].checkOut + "</td>";
				} else {
					result += "<td>" + reservationData[i].clickCheckIn + "</td>";
					result += "<td>" + reservationData[i].checkOut + "</td>";
				}
				if (reservationData[i].clickCheckOut == '' || reservationData[i].clickCheckOut == null) {
					if (reservationData[i].clickCheckIn == '' || reservationData[i].clickCheckIn == null) {
						result += "<td><input type=\"button\" class=\"checkInOutBtn\" disabled=\"disabled\" value=\"체크아웃\" onclick=\"testCheckOut(this)\" id=\"" + checkOutName + "\" ></button>"
						result += "<label id=\"" + checkOutName + "Label" + "\"></label></td>"
					} else {
						result += "<td><input type=\"button\" class=\"checkInOutBtn\" value=\"체크아웃\" onclick=\"testCheckOut(this)\" id=\"" + checkOutName + "\" ></button>"
						result += "<label id=\"" + checkOutName + "Label" + "\"></label></td>"
					}

				} else {
					result += "<td>" + reservationData[i].clickCheckOut + "</td>";
				}

				if (reservationData[i].clickCheckIn == '' || reservationData[i].clickCheckIn == null) {
					result += "<td id=\"" + checkInName + "Status" + "\">예약완료</td>";
				} else if (reservationData[i].clickCheckOut == '' || reservationData[i].clickCheckOut == null) {
					result += "<td id=\"" + checkInName + "Status" + "\">입실완료</td>";
				} else {
					result += "<td id=\"" + checkInName + "Status" + "\">퇴실완료</td>";
				}

				result += "</tr>";
			}

			document.getElementById('selecetdPlace').innerHTML = '선택한 숙소 : ' + reservationData[0].hostName;
			document.getElementById('reservationTbody').innerHTML = result;
		}
	}
}


// 리뷰 확인

function reviewCheck() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'reviewCheck')
	xhr.send(document.querySelector('input[type=radio][name="reviewRadio"]:checked').value)
	xhr.onreadystatechange = reviewCheckProc
	document.getElementById('recentSort').style = "color:#13C3FF;"
	document.getElementById('starsSort').style = "color:#000;"
}

function reviewCheckStars(){
	xhr = new XMLHttpRequest();
	xhr.open('post', 'reviewCheckStars')
	xhr.send(document.querySelector('input[type=radio][name="reviewRadio"]:checked').value)
	xhr.onreadystatechange = reviewCheckProc
	document.getElementById('starsSort').style = "color:#13C3FF;"
	document.getElementById('recentSort').style = "color:#000;"
}

function reviewCheckProc() {
	var reviewData = JSON.parse(xhr.responseText)
	console.log('숙소 리뷰 클릭함')
	if (xhr.readyState === 4 && xhr.status === 200) {

		
		var result = "";
		let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		if(month > 0 && month < 10){
			month = "0" + month
		}
		
		var adminWriteDate = year +"."+month+"."+date

		if (reviewData == '') {
			document.getElementById('selecetedRental').innerHTML = '선택한 숙소 : ' + document.querySelector('input[type=radio][name="reviewRadio"]:checked').value + ' <h3>현재 후기가 없습니다.</h3>';
			document.getElementById('ReviewList').innerHTML = '';
		} else {
			for (i = 0; i < reviewData.length; i++) {
				var stars = "☆☆☆☆☆";
				if(reviewData[i].reviewPoint == 5){
					stars = "★★★★★";
				}else if(reviewData[i].reviewPoint == 4){
					stars = "★★★★☆";
				}else if(reviewData[i].reviewPoint == 3){
					stars = "★★★☆☆";
				}else if(reviewData[i].reviewPoint == 2){
					stars = "★★☆☆☆";
				}else{
					stars = "★☆☆☆☆";
				}
				console.log("리뷰벌점 : " + reviewData[i].reviewPoint)
				
				var reseNum = reviewData[i].writeDate;
                var reseDate = reseNum.substring(0, 4) + "." + reseNum.substring(4, 6) + "." + reseNum.substring(6, 8);
				
				result += "<li><div class=\"reviewerInfo\">"
				result += "<p><span>" +stars + "</span>"+ reviewData[i].reviewPoint +".0 </p>"
				
				result += "<h4>" + reviewData[i].userId + " | " + reseDate + "</h4></div>"
				result += "<p><strong>객실명</strong><span>" + reviewData[i].roomName + "</span></p>"
				result += "<p>" + reviewData[i].content + "</p>"
								
				if(reviewData[i].adminContent == '' || reviewData[i].adminContent == null){
					result += "<div class=\"Reply\"><h3>숙소 답변 | " + adminWriteDate + "</h3>"
					result += "<textarea class=\"ReplyTextarea\" id=\"ReplyTextarea"+ i + "\"></textarea></div>"
					result += "<div class=\"answerClick\"><button type=\"button\" class=\"answerBtn\" id=\"answerBtn"+ i + "\" onclick=\"answerUpload(this)\">답변 작성</button>"
					result += "<button type=\"button\" class=\"answerBtn\" id=\"deleteBtn"+ i + "\" onclick=\"answerDelete(this)\" style=\"display:none;\">답변 삭제</button>"
					result += "<button type=\"button\" class=\"answerBtn\" id=\"modifyBtn"+ i + "\"  onclick=\"answerModify(this)\" style=\"display:none;\">답변 수정</button>	</div>"
					result += "<input id=\"reseNumValue"+ i + "\" value=\""  + reviewData[i].reseNum + "\" style=\"display:none\"/>"
					
				}else{
					result += "<div class=\"Reply\"><h3>숙소 답변 | " + adminWriteDate + "</h3>"
					result += "<textarea class=\"ReplyTextarea\" id=\"ReplyTextarea"+ i + "\">" +  reviewData[i].adminContent +"</textarea></div>"
					result += "<div class=\"answerClick\"><button type=\"button\" class=\"answerBtn\" id=\"answerBtn"+ i + "\" onclick=\"answerUpload(this)\" style=\"display:none;\">답변 작성</button>"
					result += "<button type=\"button\" class=\"answerBtn\" id=\"deleteBtn"+ i + "\" onclick=\"answerDelete(this)\">답변 삭제</button>"
					result += "<button type=\"button\" class=\"answerBtn\" id=\"modifyBtn"+ i + "\"  onclick=\"answerModify(this)\">답변 수정</button>	</div>"
					result += "<input id=\"reseNumValue"+ i + "\" value=\""  + reviewData[i].reseNum + "\" style=\"display:none\"/>"
				}
			}


			document.getElementById('selecetedRental').innerHTML = '선택한 숙소 : ' + reviewData[0].hostName;
			document.getElementById('ReviewList').innerHTML = result;
			document.getElementById('reviewTitle').innerHTML = '객실 후기' + '(' + reviewData.length + ')'


		}




	}
}




// 회원 정보 펼치기/접기 함수
function openInformationBusiness() {
	console.log('클릭됨')
	var status = document.getElementById('informationBusiness')
	console.log(status.style)
	if (document.getElementById('informationBusiness').style.display == 'block' || document.getElementById('informationBusiness').style.display == '') {
		document.getElementById('informationBusiness').style = 'display:none';
		document.getElementById('toggle').textContent = '+';
		console.log('펼쳐져있었음')
	} else {
		document.getElementById('informationBusiness').style = 'display:block';
		document.getElementById('toggle').textContent = '-'; adminAgreeSelectAll
		console.log('접혀있었음')
	}
}

// 리뷰 답변 작성 함수
function answerUpload(uploadButton){
	var answerBtnName = uploadButton.id	
	var adminContentValue = document.querySelector('#ReplyTextarea'+answerBtnName.substring(9)).value
	
	if(adminContentValue == '' || adminContentValue == null){
		
	}else{	
	
	console.log('리뷰 답변 작성')
	let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		if(month > 0 && month < 10){
			month = "0" + month
		}
	
	
	var adminWriteDateValue = year +"."+month+"."+date
	
	var reseNumValue = document.getElementById('reseNumValue'+answerBtnName.substring(9)).value	
	console.log('답변 내용' + adminContentValue)
	
	var reqData = {
		adminWriteDate: adminWriteDateValue,
		adminContent: adminContentValue,
		reseNum: reseNumValue
	}
	
	
	
	console.log('buttonName :' + 'answerBtn'+answerBtnName.substring(9))
	
	document.getElementById('answerBtn'+answerBtnName.substring(9)).style = "display:none"
	document.getElementById('modifyBtn'+answerBtnName.substring(9)).style = "display:block"
	document.getElementById('deleteBtn'+answerBtnName.substring(9)).style = "display:block"
	
	
	reqData = JSON.stringify(reqData)
	xhr = new XMLHttpRequest();
	xhr.open('post', 'answerUpload')
	xhr.setRequestHeader('content-type', 'application/json');
	xhr.send(reqData);
	}
	
}

function answerModify(modifyButton){
	console.log('리뷰 답변 수정')
	let today = new Date();
		let year = today.getFullYear(); // 년도
		let month = today.getMonth() + 1;  // 월
		let date = today.getDate();  // 날짜
		if(month > 0 && month < 10){
			month = "0" + month
		}
	
	var answerBtnName = modifyButton.id	
	var adminWriteDateValue = year +"."+month+"."+date
	var adminContentValue = document.querySelector('#ReplyTextarea'+answerBtnName.substring(9)).value
	var reseNumValue = document.getElementById('reseNumValue'+answerBtnName.substring(9)).value
		
	var reqData = {
		adminWriteDate: adminWriteDateValue,
		adminContent: adminContentValue,
		reseNum: reseNumValue
	}
	
	console.log('buttonName :' + 'answerBtn'+answerBtnName.substring(9))
	
	document.getElementById('modifyBtn'+answerBtnName.substring(9)).style = "display:block"
	document.getElementById('deleteBtn'+answerBtnName.substring(9)).style = "display:block"
	
	reqData = JSON.stringify(reqData)
	xhr = new XMLHttpRequest();
	xhr.open('post', 'answerModify')
	xhr.setRequestHeader('content-type', 'application/json');
	xhr.send(reqData);
	
}

function answerDelete(deleteButton){
	console.log('리뷰 답변 삭제')
	
	var answerBtnName = deleteButton.id	
	var reseNumValue = document.getElementById('reseNumValue'+answerBtnName.substring(9)).value
	
		
	var reqData = {
		reseNum: reseNumValue
	}
	
	document.querySelector('#ReplyTextarea'+answerBtnName.substring(9)).value = ""
	document.getElementById('answerBtn'+answerBtnName.substring(9)).style = "display:block"
	document.getElementById('modifyBtn'+answerBtnName.substring(9)).style = "display:none"
	document.getElementById('deleteBtn'+answerBtnName.substring(9)).style = "display:none"
	
	reqData = JSON.stringify(reqData)
	xhr = new XMLHttpRequest();
	xhr.open('post', 'answerDelete')
	xhr.setRequestHeader('content-type', 'application/json');
	xhr.send(reqData);	
}


// 체크인,체크아웃 시간 확인 함수
function testCheckIn(checkInButton) {
	console.log('체크인 버튼 id : ' + checkInButton.id)
	let today = new Date();

	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	let hours = today.getHours(); // 시
	let minutes = today.getMinutes();  // 분

	console.log('현재시간 : ' + year + month + date + day + hours + minutes)
	console.log('체크인 버튼 값 : ' + checkInButton.value)

	document.getElementById(checkInButton.id).style = 'display:none';
	document.getElementById(checkInButton.id + 'Label').innerHTML = '' + year + month + date + day + hours + minutes;
	document.getElementById(checkInButton.id + 'Status').innerHTML = '입실완료';


	let checkOutName = '';
	checkOutName = checkInButton.id

	console.log('체크아웃 버튼 값 : ' + 'checkOut' + checkOutName.substring(7))
	console.log('예약번호 id : ' + 'reseNum' + checkOutName.substring(7))
	console.log('예약번호  값 : ' + document.getElementById('reseNum' + checkOutName.substring(7)).innerHTML)
	document.getElementById('checkOut' + checkOutName.substring(7)).disabled = false

	var clickCheckInValue = '' + year + month + date + day + hours + minutes
	var reseNumValue = document.getElementById('reseNum' + checkOutName.substring(7)).innerHTML

	var reqData = {
		clickCheckIn: clickCheckInValue,
		reseNum: reseNumValue
	}

	reqData = JSON.stringify(reqData)
	xhr = new XMLHttpRequest();
	xhr.open('post', 'testCheckIn')
	xhr.setRequestHeader('content-type', 'application/json');
	xhr.send(reqData);

}

function testCheckOut(checkOutButton) {
	console.log('체크아웃 버튼 id : ' + checkOutButton.id)
	let today = new Date();
	let year = today.getFullYear(); // 년도
	let month = today.getMonth() + 1;  // 월
	let date = today.getDate();  // 날짜
	let day = today.getDay();  // 요일
	let hours = today.getHours(); // 시
	let minutes = today.getMinutes();  // 분

	let checkOutName = '';
	checkOutName = checkOutButton.id
	var index = checkOutName.substring(8)
	console.log('현재시간 : ' + year + month + date + day + hours + minutes)
	console.log('인덱스 값 : ' + index)

	document.getElementById(checkOutButton.id).style = 'display:none';
	document.getElementById(checkOutButton.id + 'Label').innerHTML = '' + year + month + date + day + hours + minutes;
	document.getElementById('checkIn' + index + 'Status').innerHTML = '퇴실완료';


	console.log('예약번호 id : ' + 'reseNum' + index.substring(7))
	console.log('예약번호  값 : ' + document.getElementById('reseNum' + index).innerHTML)

	var clickCheckOutValue = '' + year + month + date + day + hours + minutes
	var reseNumValue = document.getElementById('reseNum' + index).innerHTML

	var reqData = {
		clickCheckOut: clickCheckOutValue,
		reseNum: reseNumValue
	}

	reqData = JSON.stringify(reqData)
	xhr.open('post', 'testCheckOut')
	xhr.setRequestHeader('content-type', 'application/json');
	xhr.send(reqData);
}


//*adminDelete popup

document.addEventListener('DOMContentLoaded', () => {
	const adminDelete_openPopupButton = document.getElementById('adminDelete_openPopupButton');
	const adminDelete_popup = document.getElementById('adminDelete_popup');
	const adminDelete_confirmButton = document.getElementById('adminDelete_confirmButton');
	const adminDelete_cancelButton = document.getElementById('adminDelete_cancelButton');
	const ad_form = document.querySelector('form[action="adminDeleteProc"]');
	

	console.log('adminDelete')

	if (adminDelete_openPopupButton) {
		adminDelete_openPopupButton.addEventListener('click', function(event) {
			event.preventDefault();
			adminDelete_popup.style.display = 'block';
		});
	}
	if (adminDelete_confirmButton) {
		adminDelete_confirmButton.addEventListener('click', () => {
			console.log('확인 버튼이 눌렸습니다.');
			if (ad_form) {
				ad_form.submit();
			}
			adminDelete_popup.style.display = 'none';
		});
	}
	if (adminDelete_cancelButton) {
		adminDelete_cancelButton.addEventListener('click', (event) => {
			event.preventDefault();
			adminDelete_popup.style.display = 'none';
		});
	}
	
	

});

