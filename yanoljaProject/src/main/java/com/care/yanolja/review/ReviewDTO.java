package com.care.yanolja.review;

public class ReviewDTO {
	private String reseNum;
	private String roomName;
	private String hostName;
	private String userId;
	private String content;
	private String writeDate;
	private int reviewPoint;
	private String adminId;
	private String adminContent;
	private String adminWriteDate;
	
	
	public String getAdminId() {
		return adminId;
	}
	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}
	public String getAdminContent() {
		return adminContent;
	}
	public void setAdminContent(String adminContent) {
		this.adminContent = adminContent;
	}
	public String getAdminWriteDate() {
		return adminWriteDate;
	}
	public void setAdminWriteDate(String adminWriteDate) {
		this.adminWriteDate = adminWriteDate;
	}
	public String getReseNum() {
		return reseNum;
	}
	public void setReseNum(String reseNum) {
		this.reseNum = reseNum;
	}
	public String getRoomName() {
		return roomName;
	}
	public void setRoomName(String roomName) {
		this.roomName = roomName;
	}
	public String getHostName() {
		return hostName;
	}
	public void setHostName(String hostName) {
		this.hostName = hostName;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public int getReviewPoint() {
		return reviewPoint;
	}
	public void setReviewPoint(int review_point) {
		this.reviewPoint = review_point;
	}
	
	
}
