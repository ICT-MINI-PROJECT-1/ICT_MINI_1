package com.sc.main.vo;

public class DiningVO {
	
	private String foodType;
	private String subject;
	private String content;
	
	
	public String getFoodType() {
		return foodType;
	}
	public void setFoodType(String foodType) {
		this.foodType = foodType;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	
	
	@Override
	public String toString() {
		return "DiningVO [음식종류=" + foodType + ", 제목=" + subject + ", 내용=" + content + "]";
	}	
}

