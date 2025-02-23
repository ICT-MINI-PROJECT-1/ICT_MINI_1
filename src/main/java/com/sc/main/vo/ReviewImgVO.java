package com.sc.main.vo;

import java.util.Arrays;

public class ReviewImgVO {
	public int imgno;
	public int reviewno;
	public String filename;	
	

	@Override
	public String toString() {
		return "ReviewImgVO [filename="+filename+",imgno=" + imgno + ", reviewno=" + reviewno+"]";
	}
	
	public int getImgno() {
		return imgno;
	}
	public void setImgno(int imgno) {
		this.imgno = imgno;
	}
	public int getReviewno() {
		return reviewno;
	}
	public void setReviewno(int reviewno) {
		this.reviewno = reviewno;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
}
