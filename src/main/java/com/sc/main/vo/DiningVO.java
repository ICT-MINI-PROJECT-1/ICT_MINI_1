package com.sc.main.vo;

public class DiningVO {
	
	private int titleno;
	private String content;
	
	
	public int getTitleno() {
		return titleno;
	}
	public void setTitleno(int titleno) {
		this.titleno = titleno;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "DiningVO [titleno=" + titleno + ", content=" + content + "]";
	}
}

