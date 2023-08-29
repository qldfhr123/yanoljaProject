var popupOverlay2 = document.getElementById('popupOverlayNew');
    popupOverlay2.style.display = 'none';
    
var popupCloseButton1 = document.getElementById('popupClose_check');
popupCloseButton1.addEventListener('click', closePopup1);

// 팝업 열기
function openPopup2() {
     var popupOverlay2 = document.getElementById('popupOverlayNew');
    popupOverlay2.style.display = 'block';
}

function closePopup1() {
    var popupOverlay = document.getElementById('popupOverlayNew');
    popupOverlay.style.display = 'none';
}

var roomType_dae;
var roomType_su;

function roomManager_save(){

	var host_name = document.getElementById("hostname");
	if(host_name === null || host_name ===""){
		alert("숙소 이름이 작성되지않았습니다. 다시한번 확인해주세요");
	}
	
	var formData = new FormData(document.getElementById("MG_frist_form"));
	

	var fileInputs = document.querySelectorAll('input[type="file"][name="file"]');
	for (var i = 0; i < fileInputs.length; i++) {
	    var files = fileInputs[i].files;
	    for (var j = 0; j < files.length; j++) {
	        
	        formData.append("photo_name", files[j].name);
	    }
	}

	

// 첫 번째 폼 데이터를 서버로 전송
	fetch('newHouseManager', {
        method: 'POST',
        body: formData
    })
    .then(response => {
        if (response.ok) {
            console.log('첫 번째 폼 제출 성공');
            tableForm(); 
        } else {
            throw new Error('첫 번째 폼 제출 실패');
        }
    })

    .catch(error => {
        console.error(error);
    });
	 
}

function tableForm(){
	
	console.log('실행시작');
	var roomTableBody = document.getElementById('roomTableBody');
	var roomRows = roomTableBody.querySelectorAll('tr'); // 테이블의 모든 행을 선택
		for (let roomIndex = 0; roomIndex < roomRows.length; roomIndex++) {
			var roomRow = roomRows[roomIndex]; // 현재 순회 중인 행 요소

		    var roomTypeId = roomRow.querySelector('#roomTypeId'+roomIndex);
			var roomType = roomTypeId.getAttribute("data-roomType");
			
			console.log('roomType : ');
			console.log(roomType);

			if (roomType === "대실") {
				var formDataDae = new FormData(document.getElementById("MG_last_form"));
			
				//숙소이름
				var hostNameId = roomRow.querySelector('#host_nameInsert'+roomIndex);
				var hostName = hostNameId.getAttribute("data-hostName").trim();
			
				// 객실명
				var roomNameId = roomRow.querySelector('#table_roomName_dae'+roomIndex);
				var roomName = roomNameId.getAttribute("data-roomName").trim();
				console.log(roomName)
				
				// 인원
				var table_PeopleId = roomRow.querySelector('#table_People_dae'+roomIndex);
				var minPeopole = table_PeopleId.getAttribute("data-minPeopole").trim();
				var maxPeopole = table_PeopleId.getAttribute("data-maxPeopole").trim();
				
				// 이용가능시간
				var table_ableTimeId = roomRow.querySelector('#table_ableTime'+roomIndex);
				var ableTimeStart = table_ableTimeId.getAttribute("data-ableTimeStart");
				var ableTime_last = table_ableTimeId.getAttribute("data-ableTime_last");
				
				// 이미지
				var table_ImgId = roomRow.querySelector('#table_Img'+roomIndex);
				var Img = table_ImgId.getAttribute("data-Img");
				
				// 사용가능시간
				var table_userTimeId = roomRow.querySelector('#table_userTime'+roomIndex);
				var userTime = table_userTimeId.getAttribute("data-userTime");
				
				// 가격
				var table_roomPay_daeId = roomRow.querySelector('#table_roomPay_dae'+roomIndex);
				var romPay_dae = table_roomPay_daeId.getAttribute("data-romPay_dae");
				
				formDataDae.append("hostName_dae",hostName);
				formDataDae.append("roomName_dae",roomName);
				formDataDae.append("minPeopole_dae",minPeopole);
				formDataDae.append("maxPeopole_dae",maxPeopole);
				formDataDae.append("roomType_dae","대실");
				formDataDae.append("romPay_dae",romPay_dae);
				formDataDae.append("userTime",userTime);
				formDataDae.append("ableTimeStart",ableTimeStart);
				formDataDae.append("ableTime_last",ableTime_last);
				formDataDae.append("ImgfileNames",Img);
				
			 var xhr = new XMLHttpRequest();
			    xhr.open("POST", "newHouseManager_dae", true);
			    xhr.onreadystatechange = function () {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                console.log('숙박 폼 제출 성공');
			            } else {
			                console.error('숙박 폼 제출 실패');
			            }
			        }
			    };
			    xhr.send(formDataDae);
}

		// 숙박 폼 전송
		if (roomType === "숙박") {
			var formDataSu = new FormData(document.getElementById("MG_last_form"));
			
				//숙소이름
			var hostNameId = roomRow.querySelector('#host_nameInsert'+roomIndex);
			var hostName = hostNameId.getAttribute("data-hostName").trim();
			
    
		    // 객실명
		    var roomNameId = roomRow.querySelector('#table_roomName_su'+roomIndex);
		    var roomName = roomNameId.getAttribute("data-roomName").trim();
		    
		    // 인원
		    var table_PeopleId = roomRow.querySelector('#table_People_su'+roomIndex);
		    var minPeopole = table_PeopleId.getAttribute("data-minPeopole").trim();
		    var maxPeopole = table_PeopleId.getAttribute("data-maxPeopole").trim();
		    
		    
		    
		    // 이용 가능 시간
		    var table_ableTime_suId = roomRow.querySelector('#table_ableTime_su'+roomIndex);
		    var ableTimeStart_su = table_ableTime_suId.getAttribute("data-ableTime_start_su");
		    var ableTime_last_su = table_ableTime_suId.getAttribute("data-ableTime_last_su");
		    
		    // 이미지
		    var table_ImgId = roomRow.querySelector('#table_Img' + roomIndex);
		    var Img = table_ImgId.getAttribute("data-Img");
		    
		    // 가격
		    var table_roomPay_suId = roomRow.querySelector('#table_roomPay_su'+roomIndex);
		    var romPay_su = table_roomPay_suId.getAttribute("data-romPay_su");
		    
		    /*서버에서는 "roomName_su", "roomType_su", "minPeopole", 등의 파라미터명을 사용중
		    서버에서 해당 값을 읽어오지 못하여 빈 문자열("")로 표시되기때문에 구분하여 파라미터명 설정 */
		    formDataSu.append("hostName_su", hostName);
		    formDataSu.append("roomName_su", roomName);
		    formDataSu.append("minPeopole_su", minPeopole); 
		    formDataSu.append("maxPeopole_su", maxPeopole);
		    formDataSu.append("roomType_su", "숙박");
		    formDataSu.append("ableTimeStart_su", ableTimeStart_su);
		    formDataSu.append("ableTime_last_su", ableTime_last_su);
		    formDataSu.append("romPay_su", romPay_su);
		    formDataSu.append("ImgfileNames", Img);
		    
		    console.log(minPeopole)
		    console.log(roomName)
		    
		     var xhr = new XMLHttpRequest();
			    xhr.open("POST", "newHouseManager_su", true);
			    xhr.onreadystatechange = function () {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                console.log('숙박 폼 제출 성공');
			            } else {
			                console.error('숙박 폼 제출 실패');
			            }
			        }
			    };
			    xhr.send(formDataSu);
		  }
  }
	console.log('하단 폼 제출 완료');
	location.href = "index";
}

function handleFiles(newFiles) {
	var fileTableBody = document.getElementById('fileTableBody');
	var formDataimg = new FormData(document.getElementById("MG_last_form")); // 대표 이미지
	 for (var i = 0; i < newFiles.length; i++) {
		 formDataimg.append('RepresentativefileRoom',newFiles[i]);
		 formDataimg.append('RepresentativeimageName',newFiles[i].name);
        var reader = new FileReader();
        var fileSizeMB = (newFiles[i].size / (1024 * 1024)).toFixed(2); // MB 사진 크기
        var newRow = document.createElement('tr');
        var rowIndex = fileTableBody.rows.length;
        
        newRow.innerHTML = `
            <td>
                <input type="checkbox" id="housePhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                <label for="housePhoto${rowIndex}"></label>
            </td>
            <td><img id="preview${rowIndex}" src="" alt="Preview" style="max-width: 100px; display: block; margin: 0 auto; padding: 5px 0 ; " ></td>
            <td>${newFiles[i].name}</td>
            <td>${fileSizeMB} MB</td>`;
        
        fileTableBody.appendChild(newRow);
        reader.onload = createOnLoadHandler(reader, rowIndex);
        reader.readAsDataURL(newFiles[i]);
	    }
	     var xhr = new XMLHttpRequest();
			   xhr.open("POST", "img_Representative", true);
			    xhr.onreadystatechange = function () {
			       if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                console.log('숙박 폼 제출 성공');
			            } else {
			                console.error('숙박 폼 제출 실패');
			            }
			        }
			    };
			    
			    xhr.send(formDataimg);
    }
 
function handleFileInput() {
    var fileInput = document.getElementById('file');
    fileInput.click();
}

/**이미지 미리보기 */
function createOnLoadHandler(reader, index) { //예외 처리기능
    return function(event) {
        document.getElementById(`preview${index}`).src = event.target.result;
    };
}

function createOnLoadHandler_host(reader, index) { //예외 처리기능
    return function(event) {
        document.getElementById(`preview${index}`).src = event.target.result;
    };
}

// 선택된 체크박스 저장
var selectedFiles = [];
var selectedFilesEx = [];

// 체크박스 클릭
function checkboxClicked(index) {
	console.log(index);
    if (selectedFiles.includes(index)) {
        selectedFiles.splice(selectedFiles.indexOf(index), 1);
    } else {
        selectedFiles.push(index);
    }  
    
}

// 예시 체크박스 클릭
function checkboxClickedEx(index) {
	console.log(index);
    if (selectedFilesEx.includes(index)) {
        selectedFilesEx.splice(selectedFilesEx.indexOf(index), 1);
    } else {
        selectedFilesEx.push(index);
    }  
    
}


// 이미지 삭제 
function fileDelete() {
    var fileTableBody = document.getElementById('fileTableBody');
	console.log(selectedFiles);
	
    for (var i = selectedFiles.length - 1; i >= 0; i--) {
        var rowIndex = selectedFiles[i];
        var row = fileTableBody.rows[rowIndex];

        //미리보기 삭제
        var previewImg = row.querySelector('img');
        if (previewImg) {
            previewImg.parentNode.removeChild(previewImg);
        }
 
        var fileInput = document.getElementById('file');// 해당 이미지 파일 삭제
        var fileList = Array.from(fileInput.files);
        fileList.splice(rowIndex, 1);

        fileTableBody.deleteRow(rowIndex);// 테이블에서 해당 행 삭제
    }

    selectedFiles = [];
}


var ImgfileNames = []; // 이미지 파일 이름을 담을 배열
var ImgfileNamesNew = []; // 이미지 파일 이름을 담을 배열

function roominfo_save(){ //객실추가 > 객실정보 저장하는 곳


	var count = 1;
    var roomTableBody = document.getElementById('roomTableBody');
    for (var i = 0; i < count; i++) {
        count+1;
        var newRow = document.createElement('tr');
        var newRow1 = document.createElement('tr');
        var host_nameInsert = document.getElementById("host_nameInsert").value;
        var roomName = document.getElementById("roomName").value;
        var minPeopole = document.getElementById("minPeopole").value;
        var maxPeopole = document.getElementById("maxPeopole").value;
        var rowIndex = roomTableBody.rows.length;
        roomType_dae = document.getElementById("roomType1").checked; // checked 상태 확인
        roomType_su = document.getElementById("roomType2").checked; // checked 상태 확인
        var roomPay_dae = document.getElementById("roomPay_dae").value;
        var roomPay_su = document.getElementById("roomPay_su").value; 
        var userTime = document.getElementById("userTime").value;
        var ableTime_start = document.getElementById("ableTime_start").value;
        var ableTime_last = document.getElementById("ableTime_last").value;
        var ableTime_start_su = document.getElementById("ableTime_start_su").value;
        var ableTime_last_su = document.getElementById("ableTime_last_su").value;
        
        
        if(roomType_dae && roomType_su){
			newRow.innerHTML = `
                <td>
                    <input type="checkbox" id="roomPhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                    <label for="roomPhoto${rowIndex}"></label>
                </td>
                <td id = "table_roomName_dae${rowIndex}" data-roomName="${roomName}">${roomName}</td>
                <td id ="table_People_dae${rowIndex}" data-minPeopole="${minPeopole}" data-maxPeopole="${maxPeopole}" >기준 인원 : ${minPeopole}  최대인원 : ${maxPeopole}</td>
                <td id ="table_roomPay_dae${rowIndex}" data-romPay_dae="${roomPay_dae}">판매 가격 : ${roomPay_dae}원</td>
                <td>대실을 선택하셨습니다</td>
                <td style="display: none" id ="table_userTime${rowIndex}" data-userTime="${userTime}시간">이용 시간 : ${userTime}시간</td>
                <td style="display: none" id="table_ableTime${rowIndex}" data-ableTimeStart="${ableTime_start}시" data-ableTime_last="${ableTime_last}시">운영 시간 : ${ableTime_start}시 ~ ${ableTime_last}시</td>
                <td style="display: none" id ="table_Img${rowIndex}" data-Img="${ImgfileNames}">이미지 이름 : ${ImgfileNames}</td>
                <td style="display: none" id ="host_nameInsert${rowIndex}" data-hostName="${host_nameInsert}">숙소 이름 : ${host_nameInsert}</td>
                <td style="display: none" id ="roomTypeId${rowIndex}" data-roomType="대실">판매 종류 : 대실</td> `;
            
            newRow1.innerHTML = `    
                <td>
                    <input type="checkbox" id="roomPhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                    <label for="roomPhoto${rowIndex}"></label>
                </td>
                <td id ="table_roomName_su${rowIndex}" data-roomName="${roomName}">${roomName}</td>
                <td id ="table_People_su${rowIndex}" data-minPeopole="${minPeopole}" data-maxPeopole="${maxPeopole}" >기준 인원 :${minPeopole}  최대인원 :${maxPeopole}</td>
                <td>숙박을 선택하셨습니다</td>
                <td id ="table_roomPay_su${rowIndex}" data-romPay_su="${roomPay_su}">판매 가격 : ${roomPay_su}원</td>
                <td style="display: none" id="table_ableTime_su${rowIndex}" data-ableTime_start_su="${ableTime_start_su}시" data-ableTime_last_su="${ableTime_last_su}시">입실시간 : ${ableTime_start_su}시 ~ ${ableTime_last_su}시</td>
                <td style="display: none" id ="table_Img${rowIndex}" data-Img="${ImgfileNames}">이미지 이름 : ${ImgfileNames}</td>
                <td style="display: none" id ="host_nameInsert${rowIndex}" data-hostName="${host_nameInsert}">숙소 이름 : ${host_nameInsert}</td>
                <td style="display: none"id ="roomTypeId${rowIndex}" data-roomType="숙박">판매 종류 : 숙박</td>
                
                `; // 추가
			
			
		} else if  (roomType_dae){
            newRow.innerHTML = `
                <td>
                    <input type="checkbox" id="roomPhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                    <label for="roomPhoto${rowIndex}"></label>
                </td>
                <td id = "table_roomName_dae${rowIndex}" data-roomName="${roomName}">${roomName}</td>
                <td id ="table_People_dae${rowIndex}" data-minPeopole="${minPeopole}" data-maxPeopole="${maxPeopole}" >기준 인원 : ${minPeopole}  최대인원 : ${maxPeopole}</td>
                <td id ="table_roomPay_dae${rowIndex}" data-romPay_dae="${roomPay_dae}">판매 가격 : ${roomPay_dae}원</td>
                <td>대실을 선택하셨습니다</td>
                <td style="display: none" id ="table_userTime${rowIndex}" data-userTime="${userTime}시간">이용 시간 : ${userTime}시간</td>
                <td style="display: none" id="table_ableTime${rowIndex}" data-ableTimeStart="${ableTime_start}시" data-ableTime_last="${ableTime_last}시">운영 시간 : ${ableTime_start}시 ~ ${ableTime_last}시</td>
                <td style="display: none" id ="table_Img${rowIndex}" data-Img="${ImgfileNames}">이미지 이름 : ${ImgfileNames}</td>
                <td style="display: none" id ="host_nameInsert${rowIndex}" data-hostName="${host_nameInsert}">숙소 이름 : ${host_nameInsert}</td>
                <td style="display: none" id ="roomTypeId${rowIndex}" data-roomType="대실">판매 종류 : 대실</td>`; // 추가
                
                
        }else if(roomType_su){
            newRow.innerHTML = `
                <td>
                    <input type="checkbox" id="roomPhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                    <label for="roomPhoto${rowIndex}"></label>
                </td>
                <td id ="table_roomName_su${rowIndex}" data-roomName="${roomName}">${roomName}</td>
                <td id ="table_People_su${rowIndex}" data-minPeopole="${minPeopole}" data-maxPeopole="${maxPeopole}" >기준 인원 :${minPeopole}  최대인원 :${maxPeopole}</td>
                <td>숙박을 선택하셨습니다</td>
                <td id ="table_roomPay_su${rowIndex}" data-romPay_su="${roomPay_su}">판매 가격 : ${roomPay_su}원</td>
                <td style="display: none" id="table_ableTime_su${rowIndex}" data-ableTime_start_su="${ableTime_start_su}시" data-ableTime_last_su="${ableTime_last_su}시">입실시간 : ${ableTime_start_su}시 ~ ${ableTime_last_su}시</td>
                <td style="display: none" id ="table_Img${rowIndex}" data-Img="${ImgfileNames}">이미지 이름 : ${ImgfileNames}</td>
                <td style="display: none" id ="host_nameInsert${rowIndex}" data-hostName="${host_nameInsert}">숙소 이름 : ${host_nameInsert}</td>
                <td style="display: none"id ="roomTypeId${rowIndex}" data-roomType="숙박">판매 종류 : 숙박</td>`; // 추가
        }
        
        
        
        // 추가한 부분: fileUpdate 함수 호출
        fileUpdate(roomType_dae, roomType_su, roomName, minPeopole, maxPeopole, roomPay_dae, roomPay_su, userTime, ableTime_start, ableTime_last, ableTime_start_su, ableTime_last_su,ImgfileNames,host_nameInsert);
        
        console.log(ImgfileNames);
        
        
        
        roomTableBody.appendChild(newRow);
        if(newRow1.innerHTML == null && newRow1.innerHTML == '')
        {}else{
			roomTableBody.appendChild(newRow1);
		}
        
        
    }
    
    var room_registerState = document.getElementById('room_registerState');
    var room_registerState_update = document.getElementById('room_registerState_update');
    room_registerState.style.display = 'none';
    room_registerState_update.style.display = 'none';

    // 추가적으로 필요한 초기화 작업 수행
    var roomNameInput = document.getElementById('roomName');
    var minPeopleInput = document.getElementById('minPeopole');
    var maxPeopleInput = document.getElementById('maxPeopole');
    var roomType1Checkbox = document.getElementById('roomType1');
    var roomType2Checkbox = document.getElementById('roomType2');
    var roomPayDaeInput = document.getElementById('roomPay_dae');
    var roomPaySuInput = document.getElementById('roomPay_su');
    var userTimeSelect = document.getElementById('userTime');
    var ableTimeStartSelect = document.getElementById('ableTime_start');
    var ableTimeLastSelect = document.getElementById('ableTime_last');
    var host_nameInsertInput = document.getElementById("host_nameInsert");
    

    // 값 초기화
    host_nameInsertInput.value = '';
    roomNameInput.value = '';
    minPeopleInput.value = '';
    maxPeopleInput.value = '';
    roomType1Checkbox.checked = false;
    roomType2Checkbox.checked = false;
    roomPayDaeInput.value = '';
    roomPaySuInput.value = '';
    userTimeSelect.selectedIndex = 0;
    ableTimeStartSelect.selectedIndex = 0;
    ableTimeLastSelect.selectedIndex = 0;
    var roomInsertBody = document.getElementById('roomInsertBody');
	ImgfileNames=[];
	// 이미지 행들 초기화
	while (roomInsertBody.firstChild) {
	    roomInsertBody.removeChild(roomInsertBody.firstChild);
	    }
  	
	
}

function roomFileInput(){
	var fileInput = document.getElementById('fileRoom');

    fileInput.click();

}



function roomInput(newFiles){
    var fileTableBody = document.getElementById('roomInsertBody');
    var fileRoom = document.getElementById('fileRoom');
    var formDataSu1 = new FormData(document.getElementById("MG_last_form"));
    
    
    
	 for (var i = 0; i < newFiles.length; i++) {
		 
		 formDataSu1.append('fileRoomImg',newFiles[i]);
		 formDataSu1.append('imageName',newFiles[i].name);
    	
        var reader = new FileReader();
        var fileSizeMB = (newFiles[i].size / (1024 * 1024)).toFixed(2); // MB 사진 크기
        var newRow = document.createElement('tr');
        var rowIndex = fileTableBody.rows.length;
        
        newRow.innerHTML = `
            <td>
                <input type="checkbox" id="housePhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                <label for="housePhoto${rowIndex}"></label>
            </td>
            <td><img id="preview${rowIndex}" src="" alt="Preview" style="max-width: 100px; display: block; margin: 0 auto; padding: 5px 0 ; " ></td>
            <td id="photoName${rowIndex}">${newFiles[i].name}</td>
            <td>${fileSizeMB} MB</td>`;
        console.log(ImgfileNames)    
        ImgfileNames.push(newFiles[i].name); // 이미지 파일 이름을 배열에 추가
        
        
        fileTableBody.appendChild(newRow);
        reader.onload = createOnLoadHandler_host(reader, rowIndex);
        reader.readAsDataURL(newFiles[i]);
	    }
	     var xhr = new XMLHttpRequest();
			    xhr.open("POST", "newHouseManager_img", true);
			    xhr.onreadystatechange = function () {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                console.log('숙박 폼 제출 성공');
			            } else {
			                console.error('숙박 폼 제출 실패');
			            }
			        }
			    };
			    
			    xhr.send(formDataSu1);
}

function roomFileInput_Update(){
	var fileInput = document.getElementById('fileRoom_Update');
    fileInput.click();
    
}

function roomUpdate(newFiles){
    var roomUpdateBody = document.getElementById('roomUpdateBody');
    var formDataHost = new FormData(document.getElementById("MG_last_form"));

	 for (var i = 0; i < newFiles.length; i++) {
		formDataHost.append('fileRoomUpdate',newFiles[i]);
		 formDataHost.append('UpdateimageName',newFiles[i].name);
        var reader = new FileReader();
        var fileSizeMB = (newFiles[i].size / (1024 * 1024)).toFixed(2); // MB 사진 크기
        var newRow = document.createElement('tr');
        var rowIndex = roomUpdateBody.rows.length;
        
        newRow.innerHTML = `
            <td>
                <input type="checkbox" id="housePhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                <label for="housePhoto${rowIndex}"></label>
            </td>
            <td><img id="preview${rowIndex}" src="" alt="Preview" style="max-width: 100px; display: block; margin: 0 auto; padding: 5px 0 ; " ></td>
            <td id="photoName${rowIndex}">${newFiles[i].name}</td>
            <td>${fileSizeMB} MB</td>`;
            
        
        ImgfileNamesNew.push(newFiles[i].name);
        roomUpdateBody.appendChild(newRow);
        reader.onload = createOnLoadHandler(reader, rowIndex);
        reader.readAsDataURL(newFiles[i]);

	    }
	    
	     var xhr = new XMLHttpRequest();
			   xhr.open("POST", "newHouseManager_img_update", true);
			    xhr.onreadystatechange = function () {
			       if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                console.log('숙박 폼 제출 성공');
			            } else {
			                console.error('숙박 폼 제출 실패');
			            }
			        }
			    };
			    
			    xhr.send(formDataSu1);
	   
}


/**이미지 미리보기 */
function createOnLoadHandler(reader, index) { //예외 처리기능
    return function(event) {
	document.getElementById(`preview${index}`).src = event.target.result;
    };
}


// 이미지 삭제 
function roomfileimgDelete() {
    var roomInsertBody = document.getElementById('roomInsertBody');
	console.log(selectedFiles);
	
    for (var i = selectedFiles.length - 1; i >= 0; i--) {
        var rowIndex = selectedFiles[i];
        var row = roomInsertBody.rows[rowIndex];

        //미리보기 삭제
        var previewImg = row.querySelector('img');
        if (previewImg) {
            previewImg.parentNode.removeChild(previewImg);
        }
 
        var fileInput = document.getElementById('file');// 해당 이미지 파일 삭제
        var fileList = Array.from(fileInput.files);
        fileList.splice(rowIndex, 1);

        roomInsertBody.deleteRow(rowIndex);// 테이블에서 해당 행 삭제
    }

    selectedFiles = [];
}

function roomfileDelete() {
    var roomTableBody = document.getElementById('roomTableBody');
    
	console.log('selectedFiles : ');
	console.log(selectedFiles);
	
    for (var i = selectedFiles.length - 1; i >= 0; i--) {
        var rowIndex = selectedFiles[i];
        var row = roomTableBody.rows[rowIndex];

        roomTableBody.deleteRow(rowIndex); // 역순으로 삭제

        // 선택된 행을 삭제하면서 selectedFiles 배열에서도 해당 인덱스를 제거
        selectedFiles.splice(i, 1);
	}
	selectedFiles = [];
}


//객실정보 수정 누른후 나오는 값들 표현
function fileUpdate(roomType_dae, roomType_su, roomName, minPeopole, maxPeopole, roomPay_dae, roomPay_su, userTime, ableTime_start, ableTime_last, ableTime_start_su, ableTime_last_su,) {

var room_registerState_update = document.getElementById('room_registerState_update');
		room_registerState_update.style = 'display:none';

 if (selectedFiles.length === 0) {
	 var room_registerState_update = document.getElementById('room_registerState_update');
		room_registerState_update.style = 'display:none';
        openPopup2();

    }
   	else{ 
		  var room_registerState_update = document.getElementById('room_registerState_update');
		room_registerState_update.style.display = 'block';
	   }
	
	
	var roomUpdateBody = document.getElementById('roomUpdateBody');
    roomUpdateBody.innerHTML = ''; // 이미지 미리보기를 초기화합니다.
    host_nameInsert
    
    if (roomType_dae) {
        // Set values for 대실 room type
        document.getElementById('roomName_Update').value = roomName;
        document.getElementById('minPeopole_Update').value = minPeopole;
        document.getElementById('maxPeopole_Update').value = maxPeopole;	
        document.getElementById('roomPay_dae_Update').value = roomPay_dae;
        document.getElementById('userTime_Update').value = userTime;
        document.getElementById('ableTime_start_Update').value = ableTime_start;
        document.getElementById('ableTime_last_Update').value = ableTime_last;
        document.getElementById('roomType1_Update').checked = true;
        document.getElementById('roomTypeState1_Update').style.display = 'block';
        document.getElementById('roomTypeState2_Update').style.display = 'none'; // 숙박 설정 숨기기
        
        var roomUpdateBody_Ex = document.getElementById('roomUpdateBody_Ex');
        var newRow = document.createElement('tr');
        
        for (var i = 0; i < ImgfileNames.length; i++) {
        
            newRow.innerHTML = `
                <td>
                    <input type="checkbox" id="roomPhotoEx${i}" name="fileNumEx" value="${i}" onclick="checkboxClickedEx(${i})">
                    <label for="roomPhotoEx${i}"></label>
                </td>
               
                <td id ="table_Img${i}" data-Img="${ImgfileNames}">기존 이름 : ${ImgfileNames}</td>`; // 추가
			roomUpdateBody_Ex.appendChild(newRow);                
        	}
        	
        
    } 
    if (roomType_su) {
        // Set values for 숙박 room type
        document.getElementById('roomName_Update').value = roomName;
        document.getElementById('minPeopole_Update').value = minPeopole;
        document.getElementById('maxPeopole_Update').value = maxPeopole;
        document.getElementById('roomPay_su_Update').value = roomPay_su;
        document.getElementById('ableTime_start_su_Update').value = ableTime_start_su;
        document.getElementById('ableTime_last_su_Update').value = ableTime_last_su;
        document.getElementById('roomType2_Update').checked = true;
        document.getElementById('roomTypeState2_Update').style.display = 'block';
        document.getElementById('roomTypeState1_Update').style.display = 'none'; // 대실 설정 숨기기
        
        
        var roomUpdateBody_Ex = document.getElementById('roomUpdateBody_Ex');
        var newRow = document.createElement('tr');
        for (var i = 0; i <	 ImgfileNames.length; i++) {
        
            newRow.innerHTML = `
                <td>
                    <input type="checkbox" id="roomPhotoEx${i}" name="fileNumEx" value="${i}" onclick="checkboxClickedEx(${i})">
                    <label for="roomPhotoEx${i}"></label>
                </td>
               
                <td id ="table_Img${i}" data-Img="${ImgfileNames}">기존 이름 : ${ImgfileNames}</td>`; // 추가
            roomUpdateBody_Ex.appendChild(newRow);   
             
        	}
        	
    }
}


function roomfileimgDelete_update() {
    var roomInsertBody = document.getElementById('roomUpdateBody');
	console.log(selectedFiles);
	
    for (var i = selectedFiles.length - 1; i >= 0; i--) {
        var rowIndex = selectedFiles[i];
        var row = roomInsertBody.rows[rowIndex];

        //미리보기 삭제
        var previewImg = row.querySelector('img');
        if (previewImg) {
            previewImg.parentNode.removeChild(previewImg);
        }
 
        var fileInput = document.getElementById('file');// 해당 이미지 파일 삭제
        var fileList = Array.from(fileInput.files);
        fileList.splice(rowIndex, 1);

        roomInsertBody.deleteRow(rowIndex);// 테이블에서 해당 행 삭제
    }

    selectedFiles = [];
}

function roomfileimgDelete_updateEx(){
	    var roomUpdateBody_Ex = document.getElementById('roomUpdateBody_Ex');
	
    for (var i = selectedFilesEx.length - 1; i >= 0; i--) {
        var rowIndex = selectedFilesEx[i];
        var row = roomInsertBody.rows[rowIndex];

        var fileInput = document.getElementById('file');// 해당 이미지 파일 삭제
        var fileList = Array.from(fileInput.files);
        fileList.splice(rowIndex, 1);

        roomUpdateBody_Ex.deleteRow(rowIndex);// 테이블에서 해당 행 삭제
    }

    selectedFilesEx = [];

}

function roominfo_save_update() { //객실 수정 > 객실정보 수정하기 버튼
	 var room_registerState_update = document.getElementById('room_registerState_update');
	room_registerState_update.style.display = 'none';
	var room_registerState = document.getElementById('room_registerState');
    room_registerState.style.display = 'none';

	 var count = 1;
    var roomTableBody = document.getElementById('roomTableBody');
    for (var i = 0; i < count; i++) {
        count+1;
        
        var roomName = document.getElementById("roomName_Update").value;
        var minPeopole = document.getElementById("minPeopole_Update").value;
        var maxPeopole = document.getElementById("maxPeopole_Update").value;
        var rowIndex = document.getElementById('roomTableBody').rows[rowIndex];
        var roomType_dae = document.getElementById("roomType1_Update").checked; // checked 상태 확인
        var roomType_su = document.getElementById("roomType2_Update").checked; // checked 상태 확인
        var roomPay_dae = document.getElementById("roomPay_dae_Update").value;
        var roomPay_su = document.getElementById("roomPay_su_Update").value; 
        var userTime = document.getElementById("userTime_Update").value;
        var ableTime_start = document.getElementById("ableTime_start_Update").value;
        var ableTime_last = document.getElementById("ableTime_last_Update").value;
        var ableTime_start_su = document.getElementById("ableTime_start_su_Update").value;
        var ableTime_last_su = document.getElementById("ableTime_last_su_Update").value;
        var host_nameInsert = document.getElementById("hont_nameUpdate").value;
        

        fileUpdate(roomType_dae, roomType_su, roomName, minPeopole, maxPeopole, roomPay_dae, roomPay_su, userTime, ableTime_start, ableTime_last, ableTime_start_su, ableTime_last_su);
        
	}
	updateSelectedRows(roomType_dae, roomType_su, roomName, minPeopole, maxPeopole, roomPay_dae, roomPay_su, userTime, ableTime_start, ableTime_last, ableTime_start_su, ableTime_last_su,rowIndex,host_nameInsert);
	roomfileDelete();
}

function updateSelectedRows(roomType_dae, roomType_su, roomName, minPeopole, maxPeopole, roomPay_dae, roomPay_su, userTime, ableTime_start, ableTime_last, ableTime_start_su, ableTime_last_su,rowIndex,host_nameInsert) {
    var checkboxes = document.querySelectorAll('input[type="checkbox"][name="fileNum"]:checked');
    

    checkboxes.forEach(function (checkbox) {
    	var newRow = document.createElement('tr');
        var rowIndex = checkbox.value; //체크박스 아이디 호출후 가져오기
        var row = document.getElementById('roomTableBody').rows[rowIndex];
        
        
       
           if(roomType_dae){
            newRow.innerHTML = `
                <td>
                    <input type="checkbox" id="roomPhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                    <label for="roomPhoto${rowIndex}"></label>
                </td>
                <td id = "table_roomName_dae${rowIndex}" data-roomName="${roomName}">${roomName}</td>
                <td id ="table_People_dae${rowIndex}" data-minPeopole="${minPeopole}" data-maxPeopole="${maxPeopole}" >기준 인원 : ${minPeopole}  최대인원 : ${maxPeopole}</td>
                <td id ="table_roomPay_dae${rowIndex}" data-romPay_dae="${roomPay_dae}">판매 가격 : ${roomPay_dae}원</td>
                <td>대실을 선택하셨습니다</td>
                <td style="display: none" id ="table_userTime${rowIndex}" data-userTime="${userTime}시간">이용 시간 : ${userTime}시간</td>
                <td style="display: none" id="table_ableTime${rowIndex}" data-ableTimeStart="${ableTime_start}시" data-ableTime_last="${ableTime_last}시">운영 시간 : ${ableTime_start}시 ~ ${ableTime_last}시</td>
                <td style="display: none" id ="table_Img${rowIndex}" data-Img="${ImgfileNamesNew}">신규 이미지 이름 : ${ImgfileNamesNew}</td>
                <td style="display: none" id ="roomTypeId${rowIndex}" data-roomType="대실">판매 종류 : 대실</td>
                <td style="display: none" id ="table_ImgEx${rowIndex}" data-Img="${ImgfileNames}">기존 이미지 이름 : ${ImgfileNames}</td>
                <td style="display: none" id ="host_nameInsert${rowIndex}" data-hostName="${host_nameInsert}">숙소 이름 : ${host_nameInsert}</td>`; // 추가
                
                roomTableBody.appendChild(newRow);
        }
        
        if(roomType_su){
            newRow.innerHTML = `
                  <td>
                    <input type="checkbox" id="roomPhoto${rowIndex}" name="fileNum" value="${rowIndex}" onclick="checkboxClicked(${rowIndex})">
                    <label for="roomPhoto${rowIndex}"></label>
                </td>
                <td id = "table_roomName_su${rowIndex}" data-roomName="${roomName}">${roomName}</td>
                <td id ="table_People_su${rowIndex}" data-minPeopole="${minPeopole}" data-maxPeopole="${maxPeopole}" >기준 인원 : ${minPeopole}  최대인원 : ${maxPeopole}</td>
                <td>숙박을 선택하셨습니다</td>
                <td id ="table_roomPay_su${rowIndex}" data-romPay_su="${roomPay_su}">판매 가격 : ${roomPay_su}원</td>
                <td style="display: none" id="table_ableTime_su${rowIndex}" data-ableTime_start_su="${ableTime_start_su}시" data-ableTime_last_su="${ableTime_last_su}시">입실시간 : ${ableTime_start_su}시 ~ ${ableTime_last_su}시</td>
                <td style="display: none" id ="table_Img${rowIndex}" data-Img="${ImgfileNamesNew}">신규 이미지 이름 : ${ImgfileNamesNew}</td>
                <td style="display: none"id ="roomTypeId${rowIndex}" data-roomType="숙박">판매 종류 : 숙박</td>
                <td style="display: none" id ="table_ImgEx${rowIndex}" data-Img="${ImgfileNames}">기존 이미지 이름 : ${ImgfileNames}</td>
                <td style="display: none" id ="host_nameInsert${rowIndex}" data-hostName="${host_nameInsert}">숙소 이름 : ${host_nameInsert}</td>`; // 추가
                roomTableBody.appendChild(newRow);
        }

    });
	    var room_registerState_update = document.getElementById('room_registerState_update');
	room_registerState_update.style.display = 'none';
	var room_registerState = document.getElementById('room_registerState');
    room_registerState.style.display = 'none';

    // 추가적으로 필요한 초기화 작업 수행
    var roomNameInput = document.getElementById('roomName_Update');
    var minPeopleInput = document.getElementById('minPeopole_Update');
    var maxPeopleInput = document.getElementById('maxPeopole_Update');
    var roomType1Checkbox = document.getElementById('roomType1');
    var roomType2Checkbox = document.getElementById('roomType2');
    var roomPayDaeInput = document.getElementById('roomPay_dae_Update');
    var roomPaySuInput = document.getElementById('roomPay_su_Update');
    var userTimeSelect = document.getElementById('userTime_Update');
    var ableTimeStartSelect = document.getElementById('ableTime_start_Update');
    var ableTimeLastSelect = document.getElementById('ableTime_last_Update');
    

    // 값 초기화
    roomNameInput.value = '';
    minPeopleInput.value = '';
    maxPeopleInput.value = '';
    roomType1Checkbox.checked = false;
    roomType2Checkbox.checked = false;
    roomPayDaeInput.value = '';
    roomPaySuInput.value = '';
    userTimeSelect.selectedIndex = 0;
    ableTimeStartSelect.selectedIndex = 0;
    ableTimeLastSelect.selectedIndex = 0;
    var roomUpdateBody = document.getElementById('roomUpdateBody');
	ImgfileNames=[];
	ImgfileNamesNew=[];
	// 이미지 행들 초기화
	while (roomUpdateBody.firstChild) {
	    roomUpdateBody.removeChild(roomUpdateBody.firstChild);
	    }
	    
roomfileDelete();
}



