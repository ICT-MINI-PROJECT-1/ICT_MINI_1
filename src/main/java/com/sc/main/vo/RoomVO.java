package com.sc.main.vo;

public class RoomVO {
	private int roomno;
	private String roomconcept;
	private String roominfo;
	private int price;
	private String bedtype;
	private String viewtype;
	private int capacity;
	private int area;
	private int reservno;
	private String checkin;
	private String checkout;
	private int rating;
	public int getRoomno() {
		return roomno;
	}
	public void setRoomno(int roomno) {
		this.roomno = roomno;
	}
	@Override
	public String toString() {
		return "RoomVO [roomno=" + roomno + ", roomconcept=" + roomconcept + ", roominfo=" + roominfo + ", price="
				+ price + ", bedtype=" + bedtype + ", viewtype=" + viewtype + ", capacity=" + capacity + ", area="
				+ area + ", reservno=" + reservno + ", checkin=" + checkin + ", checkout=" + checkout + ", rating="
				+ rating + "]";
	}
	public String getRoominfo() {
		return roominfo;
	}
	public void setRoominfo(String roominfo) {
		this.roominfo = roominfo;
	}
	public String getRoomconcept() {
		return roomconcept;
	}
	public void setRoomconcept(String roomconcept) {
		this.roomconcept = roomconcept;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getBedtype() {
		return bedtype;
	}
	public void setBedtype(String bedtype) {
		this.bedtype = bedtype;
	}
	public String getViewtype() {
		return viewtype;
	}
	public void setViewtype(String viewtype) {
		this.viewtype = viewtype;
	}
	public int getCapacity() {
		return capacity;
	}
	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}
	public int getArea() {
		return area;
	}
	public void setArea(int area) {
		this.area = area;
	}
	public int getReservno() {
		return reservno;
	}
	public void setReservno(int reservno) {
		this.reservno = reservno;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	public int getRating() {
		return rating;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
}
