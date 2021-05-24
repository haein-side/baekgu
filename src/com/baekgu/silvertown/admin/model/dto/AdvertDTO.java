package com.baekgu.silvertown.admin.model.dto;

import java.sql.Date;

public class AdvertDTO {

	private int code;
	private String advertName;
	private int advertPrice;
	
	public AdvertDTO() {}

	public AdvertDTO(int code, String advertName, int advertPrice) {
		super();
		this.code = code;
		this.advertName = advertName;
		this.advertPrice = advertPrice;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getAdvertName() {
		return advertName;
	}

	public void setAdvertName(String advertName) {
		this.advertName = advertName;
	}

	public int getAdvertPrice() {
		return advertPrice;
	}

	public void setAdvertPrice(int advertPrice) {
		this.advertPrice = advertPrice;
	}

	@Override
	public String toString() {
		return "AdvertDTO [code=" + code + ", advertName=" + advertName + ", advertPrice=" + advertPrice + "]";
	}

	
}
