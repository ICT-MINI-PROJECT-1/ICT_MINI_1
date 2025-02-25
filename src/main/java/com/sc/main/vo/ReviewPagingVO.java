package com.sc.main.vo;

import java.util.List;

public class ReviewPagingVO {
	private List<ReviewVO> rv;
	private PagingVO pvo;
	
	public List<ReviewVO> getRv() {
		return rv;
	}
	public void setRv(List<ReviewVO> rv) {
		this.rv = rv;
	}
	public PagingVO getPvo() {
		return pvo;
	}
	public void setPvo(PagingVO pvo) {
		this.pvo = pvo;
	}
	
	
}
