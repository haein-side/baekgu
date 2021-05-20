package com.baekgu.silvertown.admin.model.dto;

import java.sql.Date;

public class MemberDTO implements java.io.Serializable{
	
	
	/* DB에 등록되어 있는 개인 회원들의 목록을 뽑아온다. 회원정보에서 리스트 뽑아올때 사용한다. */
	private int code;
	private String name;
	private String phone;
	private Date bday;
	private String gender;
	private String address;
	private Date rday;
	private int block;
	private int rCode;
	private Date rwday;
	private String rPhone;
	private String rLetter;
	private String rAdvan;
	
	public MemberDTO() {
		
	}

	public MemberDTO(int code, String name, String phone, Date bday, String gender, String address, Date rday,
			int block, int rCode, Date rwday, String rPhone, String rLetter, String rAdvan) {
		super();
		this.code = code;
		this.name = name;
		this.phone = phone;
		this.bday = bday;
		this.gender = gender;
		this.address = address;
		this.rday = rday;
		this.block = block;
		this.rCode = rCode;
		this.rwday = rwday;
		this.rPhone = rPhone;
		this.rLetter = rLetter;
		this.rAdvan = rAdvan;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Date getBday() {
		return bday;
	}

	public void setBday(Date bday) {
		this.bday = bday;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Date getRday() {
		return rday;
	}

	public void setRday(Date rday) {
		this.rday = rday;
	}

	public int getBlock() {
		return block;
	}

	public void setBlock(int block) {
		this.block = block;
	}

	public int getrCode() {
		return rCode;
	}

	public void setrCode(int rCode) {
		this.rCode = rCode;
	}

	public Date getRwday() {
		return rwday;
	}

	public void setRwday(Date rwday) {
		this.rwday = rwday;
	}

	public String getrPhone() {
		return rPhone;
	}

	public void setrPhone(String rPhone) {
		this.rPhone = rPhone;
	}

	public String getrLetter() {
		return rLetter;
	}

	public void setrLetter(String rLetter) {
		this.rLetter = rLetter;
	}

	public String getrAdvan() {
		return rAdvan;
	}

	public void setrAdvan(String rAdvan) {
		this.rAdvan = rAdvan;
	}

	@Override
	public String toString() {
		return "MemberDTO [code=" + code + ", name=" + name + ", phone=" + phone + ", bday=" + bday + ", gender="
				+ gender + ", address=" + address + ", rday=" + rday + ", block=" + block + ", rCode=" + rCode
				+ ", rwday=" + rwday + ", rPhone=" + rPhone + ", rLetter=" + rLetter + ", rAdvan=" + rAdvan + "]";
	}
	
	
	
	
	
	
	
}
