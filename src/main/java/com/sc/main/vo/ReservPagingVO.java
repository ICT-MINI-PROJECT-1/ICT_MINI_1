package com.sc.main.vo;

import java.util.List;

public class ReservPagingVO {
	private List<ReservationVO> rv;
	private PagingVO pvo;
	public List<ReservationVO> getRv() {
		return rv;
	}
	public void setRv(List<ReservationVO> rv) {
		this.rv = rv;
	}
	public PagingVO getPvo() {
		return pvo;
	}
	public void setPvo(PagingVO pvo) {
		this.pvo = pvo;
	}

}
