var contentInserted = false; // 플래그 변수
var contentInserted_region = false;
var ajaxResponse = ""; //ajax저장할 변수
var xhr;
var selectedMotelId = ""; // 선택한 모텔 ID를 저장할 변수
var selectedHotelId = ""; // 선택한 호텔 ID를 저장할 변수
var selectedpensionId = ""; // 선택한 펜션 ID를 저장할 변수
var selectedCampingId = ""; // 선택한 캠핑 ID를 저장할 변수

 var params="";
 var pepole="";
var selectedText="";
var yparams="";


function initialShow(){//초기 클릭 없을 때 모두 출력
	console.log('초기 메인 화면 함수 호출')
	var targetElement = document.getElementById("main");
    targetElement.innerHTML = "";
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            
            console.log(xhr.responseText);
				var responseText = xhr.responseText;
				var startPattern = '<div class="index" id = "main">';
				var endPattern = '</div><!-- 마지막 -->';
				
				var startIndex = responseText.indexOf(startPattern);
				var endIndex = responseText.indexOf(endPattern, startIndex);
				
				if (startIndex !== -1 && endIndex !== -1) {
				    var extractedContent = responseText.substring(startIndex + startPattern.length, endIndex);
				    console.log(extractedContent); 
				    var targetElement = document.getElementById("main");
    				targetElement.insertAdjacentHTML("beforeend", extractedContent);
				    
				    contentInserted = true;
				} else {
				    alert("호텔 선택 오류입니다. 잠시만 기다려주세요"); 
				}
				 ajaxResponse = extractedContent;
        }
    };
 
	xhr.send('initial'); // 데이터 전송
}

function motelCheck(){//모텔 카테고리 선택시
	var img1 = document.getElementById("img1");
	    img1.style.display = "block";

		// 사용자의 동작에 따라 선택한 id 값을 가져와서 컨트롤러로 전송
	selectedMotelId = document.getElementById('selectedMotelId').innerText;
	var targetElement = document.getElementById("main");
    targetElement.innerHTML = "";
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // AJAX 요청이 완료되었을 때의 동작
            console.log(xhr.responseText);
				var responseText = xhr.responseText; // 응답 텍스트
				var startPattern = '<div class="index" id = "main">';	 // 시작 패턴
				var endPattern = '</div><!-- 마지막 -->'; // 종료 패턴
				
				var startIndex = responseText.indexOf(startPattern);
				var endIndex = responseText.indexOf(endPattern, startIndex);
				
				if (startIndex !== -1 && endIndex !== -1) {
				    var extractedContent = responseText.substring(startIndex + startPattern.length, endIndex);
				    console.log(extractedContent); 
				    var targetElement = document.getElementById("main");
    				targetElement.insertAdjacentHTML("beforeend", extractedContent);
				    // 원하는 부분의 내용 출력
				    
				    contentInserted = true; // 내용이 이미 출력되었음을 표시
				    
				} else {
				    alert("오류입니다. 잠시만 기다려주세요"); 
				}
				 ajaxResponse = extractedContent; // Ajax로 가져온 값을 변수에 저장
				
        }
    };
    
	    
	    var data = 'selectedMotelId=' + selectedMotelId;  // 요청 데이터 생성
	    xhr.send(data); // 데이터 전송
	 document.getElementById('chioce_type').innerText = selectedMotelId; // 선택한 텍스트 넣기
}



function hotelCheck(){ //호텔 카테고리 선택시
	selectedHotelId = document.getElementById('selectedHotelId').innerText;
	var targetElement = document.getElementById("main");
    targetElement.innerHTML = "";
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            
            console.log(xhr.responseText);
				var responseText = xhr.responseText;
				var startPattern = '<div class="index" id = "main">';
				var endPattern = '</div><!-- 마지막 -->';
				
				var startIndex = responseText.indexOf(startPattern);
				var endIndex = responseText.indexOf(endPattern, startIndex);
				
				if (startIndex !== -1 && endIndex !== -1) {
				    var extractedContent = responseText.substring(startIndex + startPattern.length, endIndex);
				    console.log(extractedContent); 
				    var targetElement = document.getElementById("main");
    				targetElement.insertAdjacentHTML("beforeend", extractedContent);
				    
				    contentInserted = true;
				} else {
				    alert("호텔 선택 오류입니다. 잠시만 기다려주세요"); 
				}
				 ajaxResponse = extractedContent;
        }
    };

	    var data = 'selectedHotelId=' + selectedHotelId;  // 요청 데이터 생성
	    xhr.send(data); // 데이터 전송
	 document.getElementById('chioce_type').innerText = selectedHotelId; // 선택한 텍스트 넣기
}

function pensionCheck(){//펜션 선택
	selectedpensionId = document.getElementById('selectedpensionId').innerText;
	var targetElement = document.getElementById("main");
    targetElement.innerHTML = "";
    var xhr = new XMLHttpRequest();
    
    xhr.open('POST', 'index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            
            console.log(xhr.responseText);
				var responseText = xhr.responseText;
				var startPattern = '<div class="index" id = "main">';
				var endPattern = '</div><!-- 마지막 -->';
				
				var startIndex = responseText.indexOf(startPattern);
				var endIndex = responseText.indexOf(endPattern, startIndex);
				
				if (startIndex !== -1 && endIndex !== -1) {
				    var extractedContent = responseText.substring(startIndex + startPattern.length, endIndex);
				    console.log(extractedContent); 
				    var targetElement = document.getElementById("main");
    				targetElement.insertAdjacentHTML("beforeend", extractedContent);
				    
				    contentInserted = true;
				} else {
				    alert("펜션 선택 오류입니다. 잠시만 기다려주세요"); 
				}
				 ajaxResponse = extractedContent;
        }
    };

	    var data = 'selectedpensionId=' + selectedpensionId;  // 요청 데이터 생성
	    xhr.send(data); // 데이터 전송
	 document.getElementById('chioce_type').innerText = selectedpensionId; // 선택한 텍스트 넣기
}

function campingCheck(){//캠핑 선택시
	selectedCampingId = document.getElementById('selectedCampingId').innerText;
	var targetElement = document.getElementById("main");
    targetElement.innerHTML = "";
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            
            console.log(xhr.responseText);
				var responseText = xhr.responseText;
				var startPattern = '<div class="index" id = "main">';
				var endPattern = '</div><!-- 마지막 -->';
				
				var startIndex = responseText.indexOf(startPattern);
				var endIndex = responseText.indexOf(endPattern, startIndex);
				
				if (startIndex !== -1 && endIndex !== -1) {
				    var extractedContent = responseText.substring(startIndex + startPattern.length, endIndex);
				    console.log(extractedContent); 
				    var targetElement = document.getElementById("main");
    				targetElement.insertAdjacentHTML("beforeend", extractedContent);
				    
				    contentInserted = true;
				} else {
				    alert("캠핑장 선택 오류입니다. 잠시만 기다려주세요"); 
				}
				 ajaxResponse = extractedContent;
        }
    };

	    var data = 'selectedCampingId=' + selectedCampingId;  // 요청 데이터 생성
	    xhr.send(data); // 데이터 전송
	 document.getElementById('chioce_type').innerText = selectedCampingId; // 선택한 텍스트 넣기}
}

/////////////////////////////////////////////////////////////////////

//지역 선택 하는곳
// 같은 함수를 호출 시키고 지역의 값이 있으면 기본 출력 지역값이 있으면 지역을 포함한 리스트를 출력

var selectedChoices = []; //선택한 단어를 담기위한 배열
var choice_selec=false;
function regionChoice(choice){
var img2 = document.getElementById("img2");
	    img2.style.display = "block";
	 // 이미 선택된 값인지 확인
    if (selectedChoices.includes(choice)) {
        // 이미 선택되었다면 배열에서 제거
        selectedChoices = selectedChoices.filter(item => item !== choice);
    } else {
        // 선택되지 않았다면 배열에 추가
        selectedChoices.push(choice);
    }
    
    // 선택된 값들을 출력
    var choice_region = document.getElementById("choice_region");
    choice_region.innerHTML = selectedChoices.join(", ");
    choice_selec=true;
    //기존의 데이터 지우기
    var targetElement = document.getElementById("main");
    targetElement.innerHTML = "";
    contentInserted_region = false;
    
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'index', true);
    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
    
    xhr.onreadystatechange = function () {
        if (xhr.readyState === 4 && xhr.status === 200) {
            // AJAX 요청이 완료되었을 때의 동작
             console.log(xhr.responseText);
				var responseText = xhr.responseText; // 응답 텍스트
				var startPattern = '<div class="index" id = "main">'; // 시작 패턴
				var endPattern = '</div><!-- 마지막 -->'; // 종료 패턴
				
				var startIndex = responseText.indexOf(startPattern);
				var endIndex = responseText.indexOf(endPattern, startIndex);
				
				if (startIndex !== -1 && endIndex !== -1) {
				    var extractedContent = responseText.substring(startIndex + startPattern.length, endIndex);
				    console.log(extractedContent); 
				    var targetElement = document.getElementById("main");
    				targetElement.insertAdjacentHTML("beforeend", extractedContent);
				    // 원하는 부분의 내용 출력
				    
				    contentInserted = true; // 내용이 이미 출력되었음을 표시
				
				} else {
				    alert("지역 선택 오류입니다. 잠시만 기다려주세요"); 
				}
				 ajaxResponse = extractedContent; // Ajax로 가져온 값을 변수에 저장
				
        }
    };
    /** 선택한 카테고리만 전송 */
	var requestData = '';
			    
			   if(yparams){
					requestData += yparams+ '&';
				}
			     if(selectedText){
					requestData += selectedText+ '&';
				}
			    if(pepole){
					requestData += pepole+ '&';
				}
			    if(params){ 
					requestData += params + '&';
				}
			    
			    if (selectedChoices.length > 0) {
				    requestData += 'selectedChoices=' + encodeURIComponent(selectedChoices.join(',')) + '&';
				}
				
				if (selectedMotelId) {
				    requestData += 'selectedMotelId=' + encodeURIComponent(selectedMotelId) + '&';
				}
				
				if (selectedHotelId) {
				    requestData += 'selectedHotelId=' + encodeURIComponent(selectedHotelId) + '&';
				}
				
				if (selectedpensionId) {
				    requestData += 'selectedpensionId=' + encodeURIComponent(selectedpensionId) + '&';
				}
				
				if (selectedCampingId) {
				    requestData += 'selectedCampingId=' + encodeURIComponent(selectedCampingId);
				}
				
				// 마지막에 & 문자가 남아있을 수 있으므로 제거
				if (requestData.endsWith('&')) {
				    requestData = requestData.slice(0, -1);
				}
			
				xhr.send(requestData);
     

	
}

function clearChoice(id) { //x 이미지 눌렀을때 지우기
    document.getElementById(id).innerText = ""; // 해당 값 지우기 
    selectedMotelId = ""; 
	selectedHotelId = ""; 
	selectedpensionId = ""; 
	selectedCampingId = ""; 
    ajaxResponse = ""; // Ajax로 가져온 값을 초기화
    contentInserted = false;
    selectedChoices = [];
    contentInserted_region = false;
    var targetElement = document.getElementById("main");
    targetElement.innerHTML = ""; // targetElement의 내용 비워주기
    
}

////////////////////////////////////////////
//달력
// 모달 창 열기
	var tbCalendar; // 전역 변수로 선언
	let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
    let today = new Date();     // 페이지를 로드한 날짜를 저장
    today.setHours(0, 0, 0, 0);    // 비교 편의를 위해 today의 시간을 초기화	
   
   let selectedDates = [];
   let selectedMonths = [];
   let selectedYear;
	//today 보조. 고정
	
	var selectedCell;
	var realMonth = today.getMonth()+1;
	var realToDay = today.getDate();
	
	let nextCalendarExecuted = false;
	
 
function showCalendar() {
	var modal = document.getElementById("calendarModal");
		modal.style.display = "block";
		buildCalendar();


        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
            
            

            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }
			const SATURDAY = 6;  // 토요일의 요일 값
  		    const SUNDAY = 0;    // 일요일의 요일 값
            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고


                let newDIV = document.createElement("p");
                newDIV.innerHTML = leftPad(nowDay.getDate());        // 추가한 열에 날짜 입력
                nowColumn.appendChild(newDIV);
                
                if (nowDay.getDay() == SATURDAY) {  
		            newDIV.className = "saturday";  // 토요일 스타일 클래스 적용
		            newDIV.onclick = function () { choiceDate(this); }
			            if (nowDay < today) {                       // 지난날인 경우
	                    newDIV.className = "pastDay";
	                }
		            
		        } 
		        else if (nowDay.getDay() == SUNDAY) {  
		            newDIV.className = "sunday";  // 일요일 스타일 클래스 적용
		            newDIV.onclick = function () { choiceDate(this); }
			            if (nowDay < today) {                       // 지난날인 경우
	                    newDIV.className = "pastDay";
                	}
				}
					
                else if (nowDay < today) {                       // 지난날인 경우
                    newDIV.className = "pastDay";
                }
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) { // 오늘인 경우           
                    newDIV.className = "today";
                    newDIV.onclick = function () { choiceDate(this); }
                }
                else {                                      // 미래인 경우
                    newDIV.className = "futureDay";
                    newDIV.onclick = function () { choiceDate(this); }
                }
                 if (nowDay.getDay() == 6) {                 // 토요일인 경우
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }
            }
        }
	
	}
	
	   // 이전달 버튼 클릭
        function prevCalendar() {
			if (nowMonth.getMonth() < realMonth){
			alert("예약은 금일기준 다음날부터 예약 가능합니다 다시한번 확인하세요.");	
			return false;
		}
		if(nowMonth.getMonth() >= realMonth){
			 nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            showCalendar();    // 달력 다시 생성
			
			}
           
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
			if (nowMonth.getMonth() > realMonth ){
			alert("예약은 금월기준 2개월 이후까지 가능합니다.");	
			return false;
		}
		
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            nextCalendarExecuted = true;
            var nextMonth = nowMonth.getMonth()+1;
            showSelectedDates(nextMonth);
            
            showCalendar();    // 달력 다시 생성
        }
	
	// 날짜 선택
        function choiceDate(newDIV) {
               if (selectedDates.length === 2 && selectedMonths.length === 2) {
			        selectedDates = [];
			        selectedMonths = [];
			        selectedDates.push(newDIV.textContent);
			        selectedMonths.push(nowMonth.getMonth() + 1);
			    }
			    else {
			        selectedDates.push(newDIV.textContent);
			        selectedMonths.push(nowMonth.getMonth() + 1);
			    }
			
			   if (document.getElementsByClassName("choiceDay").length > 0) {                              
			        document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");
			    }
			  		 newDIV.classList.add("choiceDay");
			
			    if (selectedDates.length === 2 && selectedMonths.length === 2) {
			        showSelectedDates();
			    }     
			    
			            
		}
			
		// input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
		function leftPad(value) {
			 if (value < 10) {
			   value = "0" + value;
			      return value;
			     }
			     return value;
			   }
        
       
        
        // 선택한 날짜 출력
		function showSelectedDates() {
			 if (selectedDates.length === 2 && selectedMonths.length === 2) {
		        let startDay = parseInt(selectedDates[0]);
		        let endDay = parseInt(selectedDates[1]);
		        
		        let startMonth = selectedMonths[0];
				let endMonth = selectedMonths[1];
		       

		         if (startMonth === endMonth) {
		            if (startDay > endDay) {
		                [startDay, endDay] = [endDay, startDay];
		            }
		        }
		        var startMonthSet = String(startMonth).padStart(2, '0');
    			var endMonthSet = String(endMonth).padStart(2, '0');
    			var startDaySet = String(startDay).padStart(2, '0');
    			var endDaySet = String(endDay).padStart(2, '0');
    			
		        var ShowstartDate = startMonth + "월 " + startDay + "일";
		        var ShowendDate = endMonth + "월 " + endDay + "일";
		        
		        var YShowstartDate = "2023."+startMonthSet + "." + startDaySet ;
		        var YShowendDate = "2023."+endMonthSet + "." + endDaySet;
		        
		
		        let selectedDatesOutput = document.getElementById("reservationDate");
		        selectedDatesOutput.textContent = "선택한 기간: " + ShowstartDate + " ~ " + ShowendDate;
		        
		         var xhr = new XMLHttpRequest();
			    xhr.open("POST", "index", true);
			    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
			    xhr.onreadystatechange = function () {
			    };
			    
			    var requestData = '';
			    params = 'startDate=' + encodeURIComponent(ShowstartDate) + '&endDate=' + encodeURIComponent(ShowendDate);
			    yparams = 'YShowstartDate=' + encodeURIComponent(YShowstartDate) + '&YShowendDate=' + encodeURIComponent(YShowendDate);
			    if(yparams){
					requestData += yparams+ '&';
				}
			     if(selectedText){
					requestData += selectedText+ '&';
				}
			    if(pepole){
					requestData += pepole+ '&';
				}
			    if(params){ 
					requestData += params + '&';
				}
			    
			    if (selectedChoices.length > 0) {
				    requestData += 'selectedChoices=' + encodeURIComponent(selectedChoices.join(',')) + '&';
				}
				
				if (selectedMotelId) {
				    requestData += 'selectedMotelId=' + encodeURIComponent(selectedMotelId) + '&';
				}
				
				if (selectedHotelId) {
				    requestData += 'selectedHotelId=' + encodeURIComponent(selectedHotelId) + '&';
				}
				
				if (selectedpensionId) {
				    requestData += 'selectedpensionId=' + encodeURIComponent(selectedpensionId) + '&';
				}
				
				if (selectedCampingId) {
				    requestData += 'selectedCampingId=' + encodeURIComponent(selectedCampingId);
				}
				
				// 마지막에 & 문자가 남아있을 수 있으므로 제거
				if (requestData.endsWith('&')) {
				    requestData = requestData.slice(0, -1);
				}
			
				xhr.send(requestData);

		
		        var modal = document.getElementById("calendarModal");
		        modal.style.display = "none";
       
		    }
		  }

	// 모달 창 닫기
	function closeModal() {
	    var modal = document.getElementById("calendarModal");
	    modal.style.display = "none";
		var closeBtn = document.getElementsByClassName("close")[0];
		closeBtn.addEventListener("click", closeModal);
	}
	
	
	//인원 선택창
	function selectPeopole(){
	    var modal_li = document.getElementById("last_li");
	    modal_li.style.display = "inline-block";
	    
	    var choice_user_fomr = document.getElementById("choice_user_form");
	    choice_user_fomr.style.display = "inline-block";
	    
	    
	    if(user_submit.clicked){
			var submit = document.getElementById("choice_user_fomr")
			submit.submit(choice_user_fomr)
		}
		
	}
	
	// 저장한 인원 정보를 보여주는 함수
	function showPeople(adultCount, childrenCount) {
	    let reservationPersonNumber = document.getElementById("reservationPersonNumber");
	    reservationPersonNumber.textContent = `성인: ${adultCount}명, 아동: ${childrenCount}명`;
	}
	
	// 저장한 인원 정보를 초기화하는 함수
	function resetPeople() {
	    let reservationPersonNumber = document.getElementById("reservationPersonNumber");
	    reservationPersonNumber.textContent = "인원 입력하기";
	}
	// 저장 버튼을 누를 때 실행되는 함수
	function savePeople() {
	    let adultCount = parseInt(document.getElementById("adult").value);
	    let childrenCount = parseInt(document.getElementById("children").value);
		
	    if (!isNaN(adultCount) && !isNaN(childrenCount)) {
	        showPeople(adultCount, childrenCount);
	        closeUser(); // 선택 창 닫기
	   
		    var xhr = new XMLHttpRequest();
		    xhr.open('POST', 'index', true);
		    xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded; charset=UTF-8');
		    xhr.onreadystatechange = function () {
	        };
			pepole = 'adult=' +adultCount +'&children=' +childrenCount;  // 요청 데이터 생성
			 var requestData = '';
			    
			    if(yparams){
					requestData += yparams+ '&';
				}
			     if(selectedText){
					requestData += selectedText+ '&';
				}
			    if(pepole){
					requestData += pepole+ '&';
				}
			    if(params){ 
					requestData += params + '&';
				}
			    
			    if (selectedChoices.length > 0) {
				    requestData += 'selectedChoices=' + encodeURIComponent(selectedChoices.join(',')) + '&';
				}
				
				if (selectedMotelId) {
				    requestData += 'selectedMotelId=' + encodeURIComponent(selectedMotelId) + '&';
				}
				
				if (selectedHotelId) {
				    requestData += 'selectedHotelId=' + encodeURIComponent(selectedHotelId) + '&';
				}
				
				if (selectedpensionId) {
				    requestData += 'selectedpensionId=' + encodeURIComponent(selectedpensionId) + '&';
				}
				
				if (selectedCampingId) {
				    requestData += 'selectedCampingId=' + encodeURIComponent(selectedCampingId);
				}
				
				// 마지막에 & 문자가 남아있을 수 있으므로 제거
				if (requestData.endsWith('&')) {
				    requestData = requestData.slice(0, -1);
				}
			
				xhr.send(requestData);
			
	}
}
	function closeUser() {
		    var modal = document.getElementById("last_li");
		    modal.style.display = "none";
			var closeBtn = document.getElementsByClassName("close")[0];
			closeBtn.addEventListener("click", last_li);
		}
		
		function allDelete(){
			var targetElement = document.getElementById("main");
    			targetElement.innerHTML = "";
    			
    			var targetElement_type_div = document.getElementById("chioce_type");
    			targetElement_type_div.innerHTML = "";
    			var img1 = document.getElementById("img1");
	   			img1.style.display = "none";
    			
    			var targetElement_region_div = document.getElementById("choice_region");
    			targetElement_region_div.innerHTML = "";
    			var img2 = document.getElementById("img2");
	    		img2.style.display = "none";
			
		}
		
	function handleSortClick(selectedText) {
	  var xhr = new XMLHttpRequest();
            var url = '서버 요청을 보낼 URL'; // 실제 URL로 대체해야 합니다.
            selectedText = 'selectedText=' + encodeURIComponent(selectedText);

            xhr.open('POST', 'index', true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');

            xhr.onreadystatechange = function () {
                if (xhr.readyState === XMLHttpRequest.DONE) {
                    if (xhr.status === 200) {
                        // 요청에 대한 성공적인 처리
                        console.log(xhr.responseText);
                    } else {
                        // 요청에 대한 처리 중 오류 발생
                        console.error('Error:', xhr.status);
                    }
                }
            };

			
			 var requestData = '';
			    
			    if(selectedText){
					requestData += selectedText+ '&';
				}
			    if(pepole){
					requestData += pepole+ '&';
				}
			    if(params){ 
					requestData += params + '&';
				}
			    
			    if (selectedChoices.length > 0) {
				    requestData += 'selectedChoices=' + encodeURIComponent(selectedChoices.join(',')) + '&';
				}
				
				if (selectedMotelId) {
				    requestData += 'selectedMotelId=' + encodeURIComponent(selectedMotelId) + '&';
				}
				
				if (selectedHotelId) {
				    requestData += 'selectedHotelId=' + encodeURIComponent(selectedHotelId) + '&';
				}
				
				if (selectedpensionId) {
				    requestData += 'selectedpensionId=' + encodeURIComponent(selectedpensionId) + '&';
				}
				
				if (selectedCampingId) {
				    requestData += 'selectedCampingId=' + encodeURIComponent(selectedCampingId);
				}
				
				// 마지막에 & 문자가 남아있을 수 있으므로 제거
				if (requestData.endsWith('&')) {
				    requestData = requestData.slice(0, -1);
				}
			
				xhr.send(requestData);
            
  
}

function pageChange(imgClick){
   var index =''
   var btnName = imgClick.id;
   index = btnName.substring(8);
   
   console.log('index 숙소 정보전달 : ' + btnName.substring(8))
   
   var hostNameInput = document.getElementById('index_host_name_send' + index).value;
   var roomNameInput = document.getElementById('index_room_name_send' + index).value;
   var adminIdInput = document.getElementById('index_admin_id_send' + index).value;
   var adminNameInput = document.getElementById('index_admin_name_send' + index).value;
   var roomPriceInput = document.getElementById('index_room_price_send' + index).value;
 
    var sendHostInfoData = {
        host_name: hostNameInput,
        room_name: roomNameInput,
        admin_id: adminIdInput,
        admin_name: adminNameInput,
        room_pay: roomPriceInput
    };

   console.log(sendHostInfoData)
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'pageChange'); 
    xhr.setRequestHeader('Content-Type', 'application/json');
   var reqData = JSON.stringify(sendHostInfoData);
   console.log('reqData')
    xhr.send(reqData);
}


function priceSetPresent(sendData){
	var index =''
    var btnName = sendData.id;
    index = btnName.substring(8);
    console.log('index sendData : ' + btnName.substring(8))
    
    if(document.getElementById('index_room_payDae' + index) !== null){
		var payDaeInput = document.getElementById('index_room_payDae' + index).value;
		console.log('대실 가격 : ' + payDaeInput)
		const payDaeSet = parseFloat(payDaeInput);
		const formattedpayDaeSet = payDaeSet.toLocaleString();
		document.getElementById('index_room_payDae_Set' + index).value = formattedpayDaeSet;
	}
	
	if(document.getElementById('index_room_paySu' + index) !== null){
		var paySuInput = document.getElementById('index_room_paySu' + index).value;
		console.log('숙박 가격 : ' + paySuInput)
		const paySuSet = parseFloat(paySuInput);
		const formattedpaySuSet = paySuSet.toLocaleString();
		document.getElementById('index_room_paySu_Set' + index).value = formattedpaySuSet;
	}
	
	
	
	
}

