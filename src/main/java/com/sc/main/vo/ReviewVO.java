package com.sc.main.vo;


public class ReviewVO {
	private int reviewno;
	private String subject;
	private String writedate;
	private String content;
	private String userid;
	private int reservno;
	private float rating;
	private int hit;
	private int roomno;
	
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWritedate() {
		return writedate;
	}
	public void setWritedate(String writedate) {
		this.writedate = writedate;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getReservno() {
		return reservno;
	}
	public void setReservno(int reservno) {
		this.reservno = reservno;
	}
	public float getRating() {
		return rating;
	}
	public void setRating(float rating) {
		this.rating = rating;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	@Override
	public String toString() {
		return "ReviewVO [reviewno=" + reviewno + ", subject=" + subject + ", writedate=" + writedate + ", content="
				+ content + ", userid=" + userid + ", reservno=" + reservno + ", rating=" + rating + ", hit=" + hit
				+ ", roomno=" + roomno + "]";
	}
}
