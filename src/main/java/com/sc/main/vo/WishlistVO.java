package com.sc.main.vo;

public class WishlistVO {
	private String userid;
	private int roomno;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	@Override
	public String toString() {
		return "WishlistVO [userid=" + userid + ", roomno=" + roomno + "]";
	}
}
