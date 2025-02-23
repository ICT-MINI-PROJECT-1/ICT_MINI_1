package com.sc.main.vo;

public class ReservationVO {
	private int reservno;
	private String reservdate;
	private String reservenddate;
	private int usercnt;
	private String request;
	private String userid;
	private int roomno;
	public int getReservno() {
		return reservno;
	}
	public void setReservno(int reservno) {
		this.reservno = reservno;
	}
	public String getReservdate() {
		return reservdate;
	}
	public void setReservdate(String reservdate) {
		this.reservdate = reservdate;
	}
	public String getReservenddate() {
		return reservenddate;
	}
	public void setReservenddate(String reservenddate) {
		this.reservenddate = reservenddate;
	}
	public int getUsercnt() {
		return usercnt;
	}
	public void setUsercnt(int usercnt) {
		this.usercnt = usercnt;
	}
	public String getRequest() {
		return request;
	}
	public void setRequest(String request) {
		this.request = request;
	}
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
		return "ReservationVO [reservno=" + reservno + ", reservdate=" + reservdate + ", reservenddate=" + reservenddate
				+ ", usercnt=" + usercnt + ", request=" + request + ", userid=" + userid + ", roomno=" + roomno + "]";
	}
}
