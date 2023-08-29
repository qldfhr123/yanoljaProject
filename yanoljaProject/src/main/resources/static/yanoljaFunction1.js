// registerMember.jsp --------------------------------------------------------------------------------
function individualAgree() {
	const checkboxes = document.querySelectorAll('input[name="agreeBtn"]');
	const checked = document.querySelectorAll('input[name="agreeBtn"]:checked');
	const selectAll = document.querySelector('input[name="agreeAllBtn"]');
	if (checkboxes.length === checked.length) {
		selectAll.checked = true;
	} else {
		selectAll.checked = false;
	}
}
function registerAllAgree(selectAll) {
	const checkboxes = document.getElementsByName('agreeBtn');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
}    

function allCheck(){
	let agreeBtn1 = document.getElementById('agreeBtn1');
 	let agreeBtn2 = document.getElementById('agreeBtn2');
	let id = document.getElementById('id');
	labelId = document.getElementById('labelId');
	let pw = document.getElementById('pw');
	labelPw = document.getElementById('labelPw')
	let email = document.getElementById('email');
	let auth = document.getElementById('auth');
	let name = document.getElementById('name');
	let select_year = document.getElementById('select_year');
	let select_month = document.getElementById('select_month');
	let select_day = document.getElementById('select_day');
	let mobile = document.getElementById('mobile');
	
	if(!agreeBtn1.checked || !agreeBtn2.checked){
		alert('필수 이용약관을 동의하지 않았습니다.');
	}else if(id.value == ""){
		alert('아이디를 입력하세요.');
	}else if(pw.value == ""){
		alert('비밀번호를 입력하세요.');
	}else if(labelPw.textContent !== '일치'){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(email.value == ""){
		alert('이메일를 입력하세요.');
	}else if(auth.value == ""){
		alert('인증번호를 입력하세요.');
	}else if(name.value == ""){
		alert('이름을 입력하세요.');	
	}else if(select_year.value == "" || select_month.value == "" || select_day.value == ""){
		alert('생년월일을 입력하세요.');
	}else if(mobile.value == ""){
		alert('연락처를 입력하세요.');	
	}else{
		alert('회원 가입 완료');
		var f = document.getElementById('f');
		f.submit();
	}
}

function pwCheck(){
	let pw = document.getElementById('pw');
	confirm = document.getElementById('confirm');
	console.log(confirm);
	labelPw = document.getElementById('labelPw');
	if(pw.value == confirm.value){
		labelPw.innerHTML = '일치';
	}else{
		labelPw.innerHTML = '불일치';
	}
}

function selectDob(){
	var year = document.getElementById("select_year").value;
    var month = document.getElementById("select_month").value;
    var day = document.getElementById("select_day").value;
    var userDoc = year + month + day;
    document.getElementById("doc").value = userDoc; 
}

var xhr;
function sendEmail() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'sendEmail')
	xhr.send(document.getElementById('email').value)
	xhr.onreadystatechange = resProc
}

function sendAuth() {
	if (xhr == null) {
		alert('이메일 주소를 입력 후 이용하세요.');
		return;
	}
	xhr.open('post', 'sendAuth');
	xhr.send(document.getElementById('auth').value);
	xhr.onreadystatechange = sendAuthProc
}

function sendAuthProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		alert(xhr.responseText);
	}
	if(xhr.responseText === '인증 성공'){
		document.getElementById('emailBtn').style = 'display:none';
		document.getElementById('authUl').style = 'display:none';
		labelEmail = document.getElementById('labelEmail');
		labelEmail.innerHTML = '인증 완료';
	}
}

function resProc() {
	if (xhr.readyState === 4 && xhr.status === 200) {
		alert(xhr.responseText);
	}
}


function memberdupCheck() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'memberdupCheck')
	xhr.send(document.getElementById('id').value)
	xhr.onreadystatechange = memberdupCheckProc
}
function memberdupCheckProc() {
	document.getElementById('userIdCheck').innerHTML = xhr.responseText;
}


// loginMember.jsp --------------------------------------------------------------------------------
function loginCheck(){
	let id = document.getElementById('id');
	let pw = document.getElementById('pw');
	if(id.value == ""){
		alert('아이디는 필수 항목입니다.');
	}else if(pw.value == ""){
		alert('비밀번호는 필수 항목입니다.');
	}else{
		var f = document.getElementById('f');
		f.submit();
	}
}

// kakaoRegister.jsp --------------------------------------------------------------------------------
function kakaoRegisterCheck(){
	let agreeBtn1 = document.getElementById('agreeBtn1');
 	let agreeBtn2 = document.getElementById('agreeBtn2');
	let pw = document.getElementById('pw');
	labelPw = document.getElementById('labelPw')
	let select_year = document.getElementById('select_year');
	let select_month = document.getElementById('select_month');
	let select_day = document.getElementById('select_day');
	let mobile = document.getElementById('mobile');
	
	if(!agreeBtn1.checked || !agreeBtn2.checked){
		alert('필수 이용약관을 동의하지 않았습니다.');
	}else if(pw.value == ""){
		alert('비밀번호를 입력하세요.');
	}else if(labelPw.textContent !== '일치'){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else if(select_year.value == "" || select_month.value == "" || select_day.value == ""){
		alert('생년월일을 입력하세요.');
	}else if(mobile.value == ""){
		alert('연락처를 입력하세요.');	
	}else{
		alert('회원 가입 완료');
		var f = document.getElementById('f');
		f.submit();
	}
}


// mypageMember.jsp --------------------------------------------------------------------------------
function openInformation(){
   var status = document.getElementById('userInfoBox')
   console.log(status)
   if(document.getElementById('userInfoBox').style.display == 'block' || document.getElementById('userInfoBox').style.display == ''){
      document.getElementById('userInfoBox').style = 'display:none';
      document.getElementById('toggle').textContent = '+';
   }else{
      document.getElementById('userInfoBox').style = 'display:block';
      document.getElementById('toggle').textContent = '-';
   }
}


function memberInfo_save(){
	let pw = document.getElementById('pw');
	labelPw = document.getElementById('labelPw')
	
	if(pw.value == ""){
		alert('비밀번호를 입력하세요.');
	}else if(labelPw.textContent !== '일치'){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else{
		alert('회원정보 수정 완료');
		var f = document.getElementById('f');
		f.submit();
	}
}
function memberInfo_delete(){
	let pw = document.getElementById('pw');
	labelPw = document.getElementById('labelPw')
	
	if(pw.value == ""){
		alert('비밀번호를 입력하세요.');
	}else if(labelPw.textContent !== '일치'){
		alert('비밀번호 확인은 필수 항목입니다.');
	}else{
		alert('회원 삭제 완료');
		var f = document.getElementById('f');
		f.submit();
	}
}


function memReserve(){
	xhr = new XMLHttpRequest();
	xhr.open('post', 'memReserve')
	console.log('memReserve click')
	xhr.send();
	xhr.onreadystatechange = ReserveAndReview
    
	console.log('memReserve  작동');
}

function ReserveAndReview(){
	const promise = new Promise(function(resolve, reject) {

		//function reserveProc(){
			var result='';
			if (xhr.readyState === 4 && xhr.status === 200) {
				console.log('예약내역 출력 중')
				var reserveData = JSON.parse(xhr.responseText);
				if(reserveData == '') {
					document.getElementById('reserveNone').innerHTML = '<h3>예약 내역이 존재하지 않습니다.</h3>';
					document.getElementById('reservationList').innerHTML = '';
					reservationList_cancelBtnClick();  // 예약내역 삭제함수
					resolve();
				}else {
					document.getElementById('reserveNone').style = 'display:none';
					
					var previousReseNum = '';
					for(i = 0; i < reserveData.length; i++) {
						var reseNum = reserveData[i].reseNum;
						var reseDate = reseNum.substring(0, 4) + "." + reseNum.substring(4, 6) + "." + reseNum.substring(6, 8);
						
						result += "<li>";
						
						if(previousReseNum != reseDate) {
				            result += "<input type=\"text\" class=\"reseList_reserveDay\" id=\"reservationList_reserveDay" + i + "\" value=\"" + reseDate + "\" readonly>";
				            previousReseNum = reseDate; // reseDate 업데이트
				        }
				        result += "<input type=\"text\" name=\"reseNum\" class=\"reservationList_rese_number\" id=\"reservationList_rese_number" + i + "\" value=\"숙소 예약번호 " + reserveData[i].reseNum + "\" readonly>";
				        
				        result += "<div>";
				        result += "<span><img src=\"" + reserveData[i].representativeImg + "\"alt=\"img1\"/></span>";
				        
				        result += "<div class=\"reseList_infoCSS\">";
				        result += "<input type=\"text\" class=\"reservationList_houseName\" id=\"reservationList_houseName" + i + "\" value=\"" + reserveData[i].hostName + "\" readonly>";
				        result += "<input type=\"text\" name=\"roomName\" class=\"reservationList_roomName\" id=\"reservationList_roomName" + i + "\" value=\"" + reserveData[i].roomName + "\" readonly>";
				        result += "<input type=\"text\" name=\"checkIn\" class=\"reservationList_checkIn\" id=\"reservationList_checkIn" + i + "\" value=\"체크인 " + reserveData[i].checkIn + "\" readonly>";
				        result += "<input type=\"text\" class=\"reservationList_checkOut\" id=\"reservationList_checkOut" + i + "\" value=\"체크아웃 " + reserveData[i].checkOut + "\" readonly>";
				        
				        result += "<div class=\"reservationList_cancelBtn\">";
				        
				        //console.log("리뷰상태 : " + i + reserveData[i].reviewState)
				        //result += "<form action=\"reseDeleteProc\" class=\"reseDeleteProc_form\" method=\"post\">"
				        if(reserveData[i].reviewState == '후기작성완료'){
							console.log("리뷰상태 : " + i + reserveData[i].reviewState)
							result += "<button class=\"reviewWrite_complete\" id=\"reviewWrite_complete" + i + "\">리뷰 작성 완료</button>";							
					    }else if(reserveData[i].clickCheckOut == '' || reserveData[i].clickCheckOut == null){
							result += "<button class=\"reseDelete_openPopupButton\" id=\"reseDelete_openPopupButton" + i + "\">취소 요청</button>";
					        result += "<div class=\"reseDelete_popup\" id=\"reseDelete_popup" + i + "\" style=\"display:none;\">";
					        result += "<div class=\"reseDelete_popup_content\">";
					        result += "<h3>선택한 항목을 삭제하시겠습니까?</h3>";
					        result += "<button class=\"reseDelete_confirmButton\" id=\"deleteBtn" + i + "\" onclick=\"reseDeleteProc(this)\">확인</button>";
					        result += "<button class=\"reseDelete_cancelButton\">취소</button>";
						}else{
							//console.log("리뷰상태 : " + reserveData[i].reviewState)
							result += "<button class=\"reviewWritePage\" id=\"reviewWritePage" + i + "\" onclick=\"location.href='reviewMember'; sendReviewPage(this)\">리뷰 작성</button>";							
						}
						//result += "</form>"
				        result += "</div></div></div></div></li>";
					}	        
			
					document.getElementById('reservationList').innerHTML = result;
					reservationList_cancelBtnClick();  // 예약내역 삭제함수
					resolve();
		
				}
			//}
		}				
	});

	promise.then(function(){
	   	console.log('memReview  작동')
	    memReview();	    
	}).catch(function(){
		 console.log('error 발생')
	});
}

/* 예약내역 정렬 */
function recent3MonthSort(){
	xhr = new XMLHttpRequest();
	xhr.open('post', 'recent3MonthSort')
	xhr.send();
	console.log('최근 3개월 출력')
	xhr.onreadystatechange = ReserveAndReview
}
function recent6MonthSort(){
	xhr = new XMLHttpRequest();
	xhr.open('post', 'recent6MonthSort')
	xhr.send();
	console.log('최근 6개월 출력')
	xhr.onreadystatechange = ReserveAndReview
}
function recent1YearSort(){
	xhr = new XMLHttpRequest();
	xhr.open('post', 'recent1YearSort')
	xhr.send();
	console.log('최근 1년 출력')
	xhr.onreadystatechange = ReserveAndReview
}

/* 예약내역 삭제버튼*/
function reservationList_cancelBtnClick() {
    const cartCloseButtons = document.querySelectorAll('.reservationList_cancelBtn');
    cartCloseButtons.forEach(cartCloseBtn => {
        const openPopupButton = cartCloseBtn.querySelector('.reseDelete_openPopupButton');
        const confirmationPopup = cartCloseBtn.querySelector('.reseDelete_popup');
        const confirmButton = cartCloseBtn.querySelector('.reseDelete_confirmButton');
        const cancelButton = cartCloseBtn.querySelector('.reseDelete_cancelButton');
        //const form = cartCloseBtn.querySelector('form[action="reseDeleteProc"]');

        if(openPopupButton) {
            openPopupButton.addEventListener('click', function (event) {
				console.log('openPopupButton');
                event.preventDefault();
                confirmationPopup.style.display = 'block';
            });
        }
        if(confirmButton) {
            confirmButton.addEventListener('click', () => {
            	console.log('confirmButton')
				//form.submit();
                confirmationPopup.style.display = 'none';
            });
        }
        if(cancelButton) {
         	cancelButton.addEventListener('click', (event) => {
				console.log('cancelButton');
	            event.preventDefault();
	            confirmationPopup.style.display = 'none';
	        });
        }
    });
    
}

function reseDeleteProc(button) {
	var index =''
	var btnName = button.id;
	index = btnName.substring(9);
	
	console.log('index : ' + btnName.substring(9))
    var reseNumInput = document.getElementById('reservationList_rese_number' + index).value;
    var roomNameInput = document.getElementById('reservationList_roomName' + index).value;
    var checkInInput = document.getElementById('reservationList_checkIn' + index).value;

	var reseNumSet = reseNumInput.match(/\d+/)[0];
	var checkInSet = checkInInput.match(/\d{4}\.\d{2}\.\d{2} \(.+\) \d{2}:\d{2}/)[0];
	
    var reseDeleteData = {
        reseNum: reseNumSet,
        roomName: roomNameInput,
        checkIn: checkInSet
    };
    console.log(reseDeleteData)
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'reseDeleteProc'); 
    xhr.setRequestHeader('Content-Type', 'application/json');
	var reqData = JSON.stringify(reseDeleteData);
	console.log('reqData')
    xhr.send(reqData);
   	document.location.reload();
}


/* 후기작성 정보전달 (마이페이지 -> 후기페이지) */
function sendReviewPage(button){
	var index =''
	var btnName = button.id;
	index = btnName.substring(15);
	
	console.log('삭제 index : ' + btnName.substring(15))
	
	var reseNumInput = document.getElementById('reservationList_rese_number' + index).value;
	var hostNameInput = document.getElementById('reservationList_houseName' + index).value;
	var roomNameInput = document.getElementById('reservationList_roomName' + index).value;
 
    var reseNumSet = reseNumInput.match(/\d+/)[0];
	
    var sendReviewData = {
        reseNum: reseNumSet,
        hostName: hostNameInput,
        roomName: roomNameInput,
    };
    

	console.log(sendReviewData)
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'sendReviewData'); 
    xhr.setRequestHeader('Content-Type', 'application/json');
	var reqData = JSON.stringify(sendReviewData);
	console.log('reqData')
    xhr.send(reqData);
}





/* 후기내역 저장 */
function memReview() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'memReview')
	console.log('memReview click')
	xhr.send();
	xhr.onreadystatechange = reviewProc
}

var xhr;
function reviewProc(){
	var result='';
	var resultTitle ='';
	if (xhr.readyState === 4 && xhr.status === 200) {
		var reviewData = JSON.parse(xhr.responseText);
		console.log('후기내역 출력 중')	
		
		if(reviewData == '') {
			resultTitle += "<h2>나의 후기 (" + reviewData.length + ")</h2>"
			document.getElementById('myReview_part').innerHTML = resultTitle;
			document.getElementById('reviewNone').innerHTML = '<h3>나의 후기가 존재하지 않습니다.</h3>';
			document.getElementById('reviewList').innerHTML = '';
		}else {
			document.getElementById('reviewNone').style = 'display:none';
			resultTitle += "<h2>나의 후기 (" + reviewData.length + ")</h2>"
			for(i = 0; i < reviewData.length; i++) {			
				result += "<li><div class=\"myReviewList\">"
				result += "<input type=\"text\" class=\"myReviewList_hostName\" id=\"myReviewList_hostName" + i + "\" value=\"" + reviewData[i].hostName + "\" readonly>"
				
				result += "<div class=\"reviewCotents\">"
				
				result += "<div class=\"reviewCotents_part1\">"
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
				result += "<div class=\"starsPresent\">" + stars + "</div>";
				console.log("리뷰별점 : " + reviewData[i].reviewPoint)
				
				var writeDate = reviewData[i].writeDate;
				var reviewWriteDate = writeDate.substring(0, 4) + "." + writeDate.substring(4, 6) + "." + writeDate.substring(6, 8);

				result += "<input type=\"text\" class=\"myReviewList_writeDate\" id=\"myReviewList_writeDate" + i + "\" value=\"" + reviewWriteDate + "\" readonly>"
				result += "</div>"
				
				result += "<div class=\"myReviewList_Btn\">"
				//result += "<form action=\"reviewDeleteProc\" method=\"post\">"
				// 후기 수정 버튼
				result += "<button class=\"reviewUpdate_Btn\" id=\"updateBtn" + i + "\" onclick=\"reviewUpdate(this); location.href='reviewUpdateMember';\">"
				result += "<img src=\"img/default/main/edit.png\" alt=\"edit\"/></button>"
				
				// 후기 삭제 버튼
				result += "<div class=\"reviewList_cancelBtn\">";
				result += "<button class=\"reviewDelete_openPopupButton\" id=\"reviewDelete_openPopupButton" + i + "\" style=\"margin-top:10px;\">";
				result += "<img src=\"img/default/main/close.png\" alt=\"close\"/></button>"
		
				result += "<div class=\"reviewDelete_popup\" id=\"reviewDelete_popup" + i + "\" style=\"display:none;\">";
				result += "<div class=\"reviewDelete_popup_content\">";
				result += "<h3>선택한 항목을 삭제하시겠습니까?</h3>";
				result += "<button class=\"reviewDelete_confirmButton\" id=\"deleteBtn" + i + "\" onclick=\"reviewDeleteProc(this)\">확인</button>";
				result += "<button class=\"reviewDelete_cancelButton\">취소</button>";
				result += "</div></div></div>"
				//result += "</form>"
				result += "</div>"
		        
				    
				result += "<div class=\"reviewCotents_part2\">"
				result += "<input type=\"text\" class=\"myReviewList_roomName\" id=\"myReviewList_roomName" + i + "\" value=\"" + reviewData[i].roomName + "\" readonly>"
				result += "</div>"
				
				result += "<textarea>" + reviewData[i].content + "</textarea>"
				
				result += "<input type=\"text\" class=\"myReviewList_checkIn\" id=\"myReviewList_reseNumInput" + i + "\" value=\"" + reviewData[i].reseNum + "\" style=\"display:none;\">"
				
				result += "</div></div></li>"

			}	 
			document.getElementById('myReview_part').innerHTML = resultTitle;       
			document.getElementById('reviewList').innerHTML = result;
			reviewList_cancelBtnClick()// 후기내역 삭제함수
		}
	}
}

/* 후기내역 삭제버튼*/
function reviewList_cancelBtnClick() {
    const cartCloseButtons = document.querySelectorAll('.reviewList_cancelBtn');
    cartCloseButtons.forEach(cartCloseBtn => {
        const openPopupButton = cartCloseBtn.querySelector('.reviewDelete_openPopupButton');
        const confirmationPopup = cartCloseBtn.querySelector('.reviewDelete_popup');
        const confirmButton = cartCloseBtn.querySelector('.reviewDelete_confirmButton');
        const cancelButton = cartCloseBtn.querySelector('.reviewDelete_cancelButton');
        //const form = cartCloseBtn.querySelector('form[action="reseDeleteProc"]');

        if(openPopupButton) {
            openPopupButton.addEventListener('click', function (event) {
				console.log('openPopupButton');
                event.preventDefault();
                confirmationPopup.style.display = 'block';
            });
        }
        if(confirmButton) {
            confirmButton.addEventListener('click', () => {
            	console.log('confirmButton')
				//form.submit();
                confirmationPopup.style.display = 'none';
            });
        }
        if(cancelButton) {
         	cancelButton.addEventListener('click', (event) => {
				console.log('cancelButton');
	            event.preventDefault();
	            confirmationPopup.style.display = 'none';
	        });
        }
    });
    
}

function reviewDeleteProc(button) {
	var index =''
	var btnName = button.id;
	index = btnName.substring(9);
	
	console.log('index : ' + btnName.substring(9))
    var reseNumInput = document.getElementById('myReviewList_reseNumInput' + index).value;
    var roomNameInput = document.getElementById('myReviewList_roomName' + index).value;

    var reviewDeleteData = {
        reseNum: reseNumInput,
        roomName: roomNameInput,
    };
    console.log(reviewDeleteData)
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'reviewDeleteProc'); 
    xhr.setRequestHeader('Content-Type', 'application/json');
	var reqData = JSON.stringify(reviewDeleteData);
	console.log('reqData')
    xhr.send(reqData);
   	document.location.reload();
}

// 후기 수정 버튼
function reviewUpdate(button) {
	var index =''
	var btnName = button.id;
	index = btnName.substring(9);
	
	console.log('index : ' + btnName.substring(9))
    var reseNumInput = document.getElementById('myReviewList_reseNumInput' + index).value;
    var hostNameInput = document.getElementById('myReviewList_hostName' + index).value;
    var roomNameInput = document.getElementById('myReviewList_roomName' + index).value;

    var reviewUpdateData = {
        reseNum: reseNumInput,
        hostName: hostNameInput,
        roomName: roomNameInput
    };
    console.log(reviewUpdateData)
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'reviewUpdate'); 
    xhr.setRequestHeader('Content-Type', 'application/json');
	var reqData = JSON.stringify(reviewUpdateData);
	console.log('reqData')
    xhr.send(reqData);
}

// memberCart.jsp --------------------------------------------------------------------------------
/* 장바구니 내역 저장 */
function memCart() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'memCart')
	console.log('memCart click')
	xhr.send();
	xhr.onreadystatechange = cartProc
}

var xhr;
function cartProc(){
	var resultContent='';
	var resultTotal='';
	var cartCount = 0;
	console.log(xhr.readyState)
	if (xhr.readyState === 4 && xhr.status === 200) {
		var cartData = JSON.parse(xhr.responseText);
		
		console.log('장바구니 내역 출력 중')
		
		if(cartData == '') {
			document.getElementById('cartNone').innerHTML = '<h3>장바구니가 존재하지 않습니다.</h3>';
			document.getElementById('cartList').innerHTML = '';
			//document.getElementById('cartResult').innerHTML = '';
		}else {
			document.getElementById('cartNone').style = 'display:none';
			
			var previousHostName = '';
			for(i = 0; i < cartData.length; i++) {
				resultContent += "<div class=\"cartInfo\">"
				var hostName = cartData[i].hostName;
				resultContent += "<div class=\"cartInfo_house\">"
				if(previousHostName != hostName) {
		            resultContent += "<input type=\"text\" class=\"cart_house_name\" id=\"cart_house_name" + i + "\" value=\"" + hostName + "\" readonly>"
		            previousHostName = hostName; // hostName 업데이트
		            resultContent += "<input type=\"text\" class=\"cart_house_location\" id=\"cart_house_location" + i + "\" value=\"" + cartData[i].region + "\" readonly>"
		        }else{
				    resultContent += "<input type=\"text\" class=\"cart_house_name\" id=\"cart_house_name" + i + "\" value=\"" + hostName + "\" style=\"display:none;\">"
		            resultContent += "<input type=\"text\" class=\"cart_house_location\" id=\"cart_house_location" + i + "\" value=\"" + cartData[i].region + "\" style=\"display:none;\">"	
				}
		            
		        resultContent += "</div>"
		        resultContent += "<li class=\"cartInfo_li\"><div>"
		        resultContent += "<input type=\"checkbox\" name=\"cartSelectBtn\" class=\"cartSelectBtn\" id=\"agreeBtn" + i + "\" value=\"" + cartData[i].reseNum + "\" data_price_input_id=\"cart_roomPriceInput" + i + "\" onclick=\"individualCartSelect(); cartTotalPrice();\">"
		        resultContent += "<label for=\"agreeBtn\"></label>"
		        
		        resultContent += "<span><img src=\"img/default/main/img1.jpg\" alt=\"img1\"/></span>"
		        
		        resultContent += "<div>"
		        resultContent += "<input type=\"text\" class=\"cart_admin_content\" id=\"cart_admin_content" + i + "\" value=\"" + cartData[i].roomName + "\" readonly>"
				
		       	resultContent += "<input type=\"text\" class=\"cart_checkIn\" id=\"cart_checkIn" + i + "\" value=\"체크인        " + cartData[i].checkIn + "\" readonly>"
				resultContent += "<input type=\"text\" class=\"cart_checkOut\" id=\"cart_checkOut" + i + "\" value=\"체크아웃    " + cartData[i].checkOut + "\" readonly>"
				resultContent += "</div>"
		        
		        resultContent += "<div class=\"cartCloseBtn\">"
		        resultContent += "<input type=\"text\" class=\"cart_roomPriceInput\" id=\"cart_roomPriceInput" + i + "\" value=\"" + cartData[i].roomPrice + "\" style=\"display:none;\">"
				
		        //resultContent += "<form action=\"cartDeleteProc\" method=\"post\">"
		        resultContent += "<button class=\"cartDelete_openPopupButton\" id=\"cartDelete_openPopupButton" + i + "\">"
		        resultContent += "<img src=\"img/default/main/close.png\" alt=\"close\"/></button>"
		        
		        resultContent += "<div class=\"cartPriceSet\">"
		        const priceValue = parseFloat(cartData[i].roomPrice.replace(/[^0-9.-]+/g,"")); // 문자열에서 숫자로 변환
		        
				const priceValue1 = parseFloat(cartData[i].roomPrice);
		       	const formattedTotalPrice1 = priceValue1.toLocaleString(); 
		        resultContent += "<input type=\"text\" class=\"cart_house_typePrice\" id=\"cart_house_typePrice" + i + "\" value=\"" + formattedTotalPrice1 + " 원\" readonly>"
				
				resultContent += "<p><b>취소 및 환불불가</b></p>"
		        resultContent += "</div>"
		        
		        resultContent += "<div class=\"cartDelete_popup\" id=\"cartDelete_popup" + i + "\" style=\"display:none;\">"
		        resultContent += "<div class=\"cartDelete_popup_content\">"
		        resultContent += "<h3>선택한 항목을 삭제하시겠습니까?</h3>"
		        resultContent += "<button class=\"cartDelete_confirmButton\" id=\"cartDeleteBtn" + i + "\" onclick=\"cartDeleteProc(this)\">확인</button>"
		        resultContent += "<button class=\"cartDelete_cancelButton\">취소</button>"        
				
				//resultContent += "</form>"
				resultContent += "<input type=\"hidden\" class=\"cart_user_id\" id=\"cart_user_id" + i + "\" value=\"" + cartData[i].userId + "\">"
		        
				resultContent += "</div></div>"
				resultContent += "</li>"
			}	
			
			//resultTotal
			resultTotal += "<p>상품 금액<span><input type=\"text\" class=\"cart_house_price\" id=\"cart_house_price\" value=\"0 원\" readonly></span></p>"
			resultTotal += "<p>할인 금액<span><input type=\"text\" class=\"cart_discount\" id=\"cart_discount\" value=\"- 0 원\" readonly></span></p>"
			resultTotal += "<p><input type=\"text\" class=\"cart_select_count\" id=\"cart_select_count\" value=\"총 0 건\" readonly></span></p>"
			resultTotal += "<p>결제 예상 금액<span><input type=\"text\" class=\"cart_house_totalPrice\" id=\"cart_house_totalPrice\" value=\"총 0 원\" readonly></span></p>"
		
			resultTotal += "<button class=\"cartToReseBtn\" id=\"cartToReseBtn\" onclick=\"cartToRese();\">결제하기</button>"
		    
		    resultTotal += "<div class=\"notation\">"
		    resultTotal += "<p> ㆍ 장바구니에 담긴 상품은 최대 30일간 보관되며 최대 20개의 상품을 담을 수 있습니다.</p>"
		    resultTotal += "<p> ㆍ 일부 상품의 경우, 장바구니에서 수량 및 상세 옵션 수정이 불가하므로 삭제 후 다시 담아주시기 바랍니다.</p>"
		    resultTotal += "<p> ㆍ 쿠폰 및 포인트는 예약화면에서 적용할 수 있습니다.</p>"
			resultTotal += "</div>" 
			      
			document.getElementById('cartList').innerHTML = resultContent;
			cartList_cancelBtnClick();  // 장바구니 내역 삭제함수

			document.getElementById('cartResult').innerHTML = resultTotal;
		}
	}
}			

// 결제하기 (KG이니시스)
function requestPay() {
	xhr = new XMLHttpRequest();
	xhr.open('post', 'requestPay')
	console.log('requestPay click')
	xhr.send();
			
	var IMP = window.IMP;

	var now = new Date();
    var year = now.getFullYear();
    var month = String(now.getMonth() + 1).padStart(2, '0');
    var day = String(now.getDate()).padStart(2, '0');
    var hours = String(now.getHours()).padStart(2, '0');
    var minutes = String(now.getMinutes()).padStart(2, '0');
    var YYYYMMDDHHMM = year + month + day + hours + minutes; 
	// IMP.request_pay(param, callback) 결제창 호출
	console.log('IMP : ')
	console.log(IMP)
	IMP.init("imp02872132");
	
	IMP.request_pay({ // param
	pg: "html5_inicis",
      pay_method: "card",
      merchant_uid: YYYYMMDDHHMM,
      name: "숙소 결제",
      amount: 100,
      buyer_email: "user@user.com",
      buyer_name: "사용자",
      buyer_tel: "010-1111-2222",
      buyer_addr: "서울특별시 강남구 신사동",
      buyer_postcode: "01181"
	}, function (rsp) { // callback
        if (rsp.success) {// 결제성공시 로직     	
            alert("결재 성공");
            document.location.href = 'mypageMember';
        } else {// 결제 실패시
			alert("결재 실패");
			alert(rsp.error_msg);
			document.location.href = 'memberCart';
			console.log(rsp); 
			           
        }
	});
}

/* cart 선택 후 reservation 결제 */
function cartToRese() {
    var selectedItems = document.querySelectorAll('input[name="cartSelectBtn"]:checked');
    var selectedValues = [];

    selectedItems.forEach(function(item) {
        selectedValues.push(item.value);
    });
 
    if (selectedValues.length > 0) {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "cartToRese");
        xhr.setRequestHeader("Content-Type", "application/json");
        xhr.onreadystatechange = requestPay
        //xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {			
                if (xhr.responseText === 'success') {
					console.log('success')
                    document.location.href = 'mypageMember';
                }
            }
        //};
        console.log(selectedValues)
        xhr.send(JSON.stringify(selectedValues));
    } else {
        alert("선택된 상품이 없습니다.");
        location.href = 'memberCart';
    }
}


/* cart 전체 가격 변동 */
function cartTotalPrice() {
    var selectedItems = document.querySelectorAll('input[name="cartSelectBtn"]:checked');
    var totalSelectedPrice = 0;
    var totalSelectedCount = 0;
    
    //var selectedValues = [];
	console.log('가격변동')
    selectedItems.forEach(function(item) {
        var priceInputId = item.getAttribute('data_price_input_id'); // data- 속성을 통해 가격 정보를 가져옴
        var priceInput = document.getElementById(priceInputId);
        
        if(priceInput) {
            var itemPrice = parseFloat(priceInput.value.replace(/[^0-9.-]+/g, ""));
            totalSelectedPrice += itemPrice;
            totalSelectedCount++
        }
    });
    var formattedTotalSelectedPrice = totalSelectedPrice.toLocaleString();
    document.getElementById('cart_house_price').value = formattedTotalSelectedPrice + " 원";
    document.getElementById('cart_house_totalPrice').value = "총 " + formattedTotalSelectedPrice + " 원";
    document.getElementById('cart_select_count').value = "총 " + totalSelectedCount + " 건";
}

/* 장바구니 삭제버튼 */
function cartList_cancelBtnClick() {
    const cartCloseButtons = document.querySelectorAll('.cartCloseBtn');

    cartCloseButtons.forEach(cartCloseBtn => {
        const openPopupButton = cartCloseBtn.querySelector('.cartDelete_openPopupButton');
        const confirmationPopup = cartCloseBtn.querySelector('.cartDelete_popup');
        const confirmButton = cartCloseBtn.querySelector('.cartDelete_confirmButton');
        const cancelButton = cartCloseBtn.querySelector('.cartDelete_cancelButton');
        //const form = cartCloseBtn.querySelector('form[action="cartDeleteProc"]');

        if(openPopupButton) {
            openPopupButton.addEventListener('click', function (event) {
				console.log('openPopupButton');
                event.preventDefault();
                confirmationPopup.style.display = 'block';
            });
        }
        if(confirmButton) {
            confirmButton.addEventListener('click', () => {
            	console.log('confirmButton')
				//form.submit();
                confirmationPopup.style.display = 'none';
            });
        }
        if(cancelButton) {
         	cancelButton.addEventListener('click', (event) => {
				console.log('cancelButton');
	            event.preventDefault();
	            confirmationPopup.style.display = 'none';
	        });
        }
    });
    
}

function cartDeleteProc(button) {
	var index =''
	var btnName = button.id;
	index = btnName.substring(13);
	
	console.log('index : ' + btnName.substring(13))
    var userIdInput = document.getElementById('cart_user_id' + index).value;
    var roomNameInput = document.getElementById('cart_admin_content' + index).value;
    var checkInInput = document.getElementById('cart_checkIn' + index).value;
	
	var startIndex = checkInInput.indexOf('20'); // '20'이 처음 나타나는 위치기준
	var endIndex = startIndex + 20;  // '20'뒤에 오는 정보의 길이 고려
	var checkInInputSet = checkInInput.substring(startIndex, endIndex);

	console.log(checkInInputSet)
    var cartDeleteData = {
        userId: userIdInput,
        roomName: roomNameInput,
        checkIn: checkInInputSet
    };
    console.log(cartDeleteData)
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'cartDeleteProc'); 
    xhr.setRequestHeader('Content-Type', 'application/json');
	var reqData = JSON.stringify(cartDeleteData);
	console.log('reqData')
    xhr.send(reqData);
   	document.location.reload();
}


/* 장바구니 전체선택 */
function individualCartSelect() {
	const checkboxes = document.querySelectorAll('input[name="cartSelectBtn"]');
	const checked = document.querySelectorAll('input[name="cartSelectBtn"]:checked');
	const selectAll = document.querySelector('input[name="cartSelectALLBtn"]');
	if (checkboxes.length === checked.length) {
		selectAll.checked = true;
	} else {
		selectAll.checked = false;
	}
}
function selectCartAll(selectAll) {
	const checkboxes = document.getElementsByName('cartSelectBtn');

	checkboxes.forEach((checkbox) => {
		checkbox.checked = selectAll.checked
	})
}








// reservationPayment.jsp --------------------------------------------------------------------------------
function check_DateTimeSET(){
	var date1 = document.getElementById("roomReservation_checkInDate").value;
    var time1 = document.getElementById("roomReservation_checkInTime").value;
    var checkIn_DateTime = date1 + " " + time1;
    document.getElementById("checkIn_DateTime").value = checkIn_DateTime; 
    
    var date2 = document.getElementById("roomReservation_checkOutDate").value;
    var time2 = document.getElementById("roomReservation_checkOutTime").value;
    var checkOut_DateTime = date2 + " " + time2;
    document.getElementById("checkOut_DateTime").value = checkOut_DateTime;
}
function save_CurrentDateTime() {
	var now = new Date();
    var year = now.getFullYear();
    var month = String(now.getMonth() + 1).padStart(2, '0');
    var day = String(now.getDate()).padStart(2, '0');
    var hours = String(now.getHours()).padStart(2, '0');
    var minutes = String(now.getMinutes()).padStart(2, '0');
    var YYYYMMDDHHMM = year + month + day + hours + minutes; 
    document.getElementById("reserve_number").value = YYYYMMDDHHMM;
}
function calculateNightCount() {
	const startDate = document.getElementById("roomReservation_checkInDate").value; // 시작 날짜
	const endDate = document.getElementById("roomReservation_checkOutDate").value; // 종료 날짜
	// startDate = "2023.07.24"; // 시작 날짜
	//const endDate = "2023.07.25"; // 종료 날짜
	console.log("시작 : " + startDate)
	console.log("끝 : " + endDate)
    const oneDayMs = 24 * 60 * 60 * 1000; // 1일을 밀리초로 변환
    const start = new Date(startDate);
    const end = new Date(endDate);
    const timeDiff = Math.abs(end - start);
    const nightCount = Math.ceil(timeDiff / oneDayMs);
    document.getElementById("roomReservation_DateCount").value = nightCount + "  박";
}
function moneyFormat(){
	const priceInput = document.getElementById("reservationChoice_price_ex");

    if(priceInput) {
		const priceInput = document.getElementById("reservationChoice_price_ex").value;
		const priceValue = parseFloat(priceInput);
		console.log("변환 전 가격 : " + priceValue)
        const formattedPrice = priceValue.toLocaleString(); 
        console.log("변환 후 가격 : " + formattedPrice)
        document.getElementById("reservationChoice_price").value = formattedPrice + " 원"; 
    }
}


// 장바구니 중복저장 팝업알림 실패 - sysout만 출력중
/*
function repeatNoneCart(){
    const rp_openPopupButton = document.getElementById('resePay_openPopupButton');
    const rp_confirmationPopup = document.getElementById('resePay_confirmationPopup');
    const rp_confirmButton = document.getElementById('resePay_confirmButton');
	
    if (rp_openPopupButton) {
		// 중복일 경우에 팝업
        rp_openPopupButton.addEventListener('click', function(event) {
            event.preventDefault();
            rp_confirmationPopup.style.display = 'block';
    	});
    }
    if (rp_confirmButton) {
        rp_confirmButton.addEventListener('click', (event) => {
            event.preventDefault();
            rp_confirmationPopup.style.display = 'none';
        });
    }
}
*/

   



// reviewMember.jsp --------------------------------------------------------------------------------

		































// newHouseManager.jsp --------------------------------------------------------------------------------
// reservationManager.jsp --------------------------------------------------------------------------------
function checkBtn_show() {
	var roomType1 = document.getElementById("roomType1");
	var roomType2 = document.getElementById("roomType2");
	var roomTypeState1 = document.getElementById("roomTypeState1");
	var roomTypeState2 = document.getElementById("roomTypeState2");
	if (roomType1.checked) { // 대실
		roomTypeState1.style.display = "block";
	} else {
		roomTypeState1.style.display = "none";
	}
	if (roomType2.checked) {  // 숙박
		roomTypeState2.style.display = "block";
	} else {
		roomTypeState2.style.display = "none";
	}
}

function roomregisterBtn_show() {
	var room_registerState = document.getElementById("room_registerState");
	if (room_registerState.style.display === 'none') { // 객실등록
		room_registerState.style.display = 'block';
	} else {
		room_registerState.style.display = 'none';
	}
}

function execDaumPostcode() {
	new daum.Postcode({
		oncomplete: function(data) {
			if (data.userSelectedType === 'R') {
				document.getElementById('address').value = data.roadAddress;
			} else {
				document.getElementById('address').value = data.jibunAddress;
			}
			document.getElementById('postcode').value = data.zonecode;
		}
	}).open();
}


// placesDetail.jsp --------------------------------------------------------------------------------
function priceSetPresent(){
	var roomReservation_priceInput = document.getElementById('roomReservation_price').value;
	const roomReservation_priceSet = parseFloat(roomReservation_priceInput);
	const formattedprice = roomReservation_priceSet.toLocaleString();
	document.getElementById('roomReservation_price_set').value = formattedprice + '원';
}

















