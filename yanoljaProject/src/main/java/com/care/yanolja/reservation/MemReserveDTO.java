package com.care.yanolja.reservation;

public class MemReserveDTO {
	
	private String reseNum;      // 예약번호(12자리 : YYYYMMDDHHMM)
	private String userName;     // 사용자 이름
	private String userId;       // 사용자 ID
	private String userMobile;   // 사용자 폰번호
	private String hostName;     // 숙소 이름
	private String roomName;     // 객실 이름
	private String adminName;    // 사업자 이름
	private String region;       // 숙소 위치
	private String representativeImg;     // 숙소 대표이미지

	private String children;     // 아동 인원
	private String people;       // 성인 인원
	
	private String checkIn;       // 체크인 정보
	private String checkOut; 	  // 체크아웃 정보	
	private String clickCheckIn;  // 체크인 정보(X)
	private String clickCheckOut; // 체크아웃 상태(X)
    
	private String peoplePlus;    // 인원추가(아동인원 + 성인인원 - 객실기본인원수)
	private String roomInfo;      // 객실정보
	private String idSelectLod;
	
	private String roomType;
	private String roomPrice;
	private String reviewState;   // 사용자 리뷰작성 전후 구분 
	
	
	
	public String getReseNum() {
		return reseNum;
	}
	public void setReseNum(String reseNum) {
		this.reseNum = reseNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserMobile() {
		return userMobile;
	}
	public void setUserMobile(String userMobile) {
		this.userMobile = userMobile;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getRepresentativeImg() {
		return representativeImg;
	}
	public void setRepresentativeImg(String representativeImg) {
		this.representativeImg = representativeImg;
	}
	public String getChildren() {
		return children;
	}
	public void setChildren(String children) {
		this.children = children;
	}
	public String getPeople() {
		return people;
	}
	public void setPeople(String people) {
		this.people = people;
	}
	public String getCheckIn() {
		return checkIn;
	}
	public void setCheckIn(String checkIn) {
		this.checkIn = checkIn;
	}
	public String getCheckOut() {
		return checkOut;
	}
	public void setCheckOut(String checkOut) {
		this.checkOut = checkOut;
	}
	public String getClickCheckIn() {
		return clickCheckIn;
	}
	public void setClickCheckIn(String clickCheckIn) {
		this.clickCheckIn = clickCheckIn;
	}
	public String getClickCheckOut() {
		return clickCheckOut;
	}
	public void setClickCheckOut(String clickCheckOut) {
		this.clickCheckOut = clickCheckOut;
	}
	public String getPeoplePlus() {
		return peoplePlus;
	}
	public void setPeoplePlus(String peoplePlus) {
		this.peoplePlus = peoplePlus;
	}
	public String getRoomInfo() {
		return roomInfo;
	}
	public void setRoomInfo(String roomInfo) {
		this.roomInfo = roomInfo;
	}
	public String getIdSelectLod() {
		return idSelectLod;
	}
	public void setIdSelectLod(String idSelectLod) {
		this.idSelectLod = idSelectLod;
	}
	public String getRoomType() {
		return roomType;
	}
	public void setRoomType(String roomType) {
		this.roomType = roomType;
	}
	public String getRoomPrice() {
		return roomPrice;
	}
	public void setRoomPrice(String roomPrice) {
		this.roomPrice = roomPrice;
	}
	public String getReviewState() {
		return reviewState;
	}
	public void setReviewState(String reviewState) {
		this.reviewState = reviewState;
	}
	


}
	