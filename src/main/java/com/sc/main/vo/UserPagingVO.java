package com.sc.main.vo;

import java.util.List;

public class UserPagingVO {
	private List<UserVO> uv;
	private PagingVO pvo;
	public List<UserVO> getUv() {
		return uv;
	}
	public void setUv(List<UserVO> uv) {
		this.uv = uv;
	}
	public PagingVO getPvo() {
		return pvo;
	}
	public void setPvo(PagingVO pvo) {
		this.pvo = pvo;
	}
}
