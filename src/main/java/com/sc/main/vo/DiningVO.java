package com.sc.main.vo;

public class DiningVO {
	
	private String Category;
	private String dishName;
	private String dateOfManufacture;
	
	
	public String getCategory() {
		return Category;
	}
	public void setCategory(String category) {
		Category = category;
	}
	public String getDishName() {
		return dishName;
	}
	public void setDishName(String dishName) {
		this.dishName = dishName;
	}
	public String getDateOfManufacture() {
		return dateOfManufacture;
	}
	public void setDateOfManufacture(String dateOfManufacture) {
		this.dateOfManufacture = dateOfManufacture;
	}
	
	
	@Override
	public String toString() {
		return "DiningVO [음식종류 = " + Category + ", 음식종류 = " + dishName + ", 제조일 = " + dateOfManufacture+ "]";
	}
}

