package com.mystudy.vo;

import java.sql.Date;

public class EmployeeVO {
	private int sabun;
	private String name; //이왕이면 db에 있는 컬럼명과 일치시키고 소문자로 작성
	private Date regdate;
	private int pay;
	
	//생성자
	public EmployeeVO() {
		super();
	}

	public EmployeeVO(int sabun, String name, Date regdate, int pay) {
		super();
		this.sabun = sabun;
		this.name = name;
		this.regdate = regdate;
		this.pay = pay;
	}
	
	//set,get 메소드
	public int getSabun() {
		return sabun;
	}

	public void setSabun(int sabun) {
		this.sabun = sabun;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getPay() {
		return pay;
	}

	public void setPay(int pay) {
		this.pay = pay;
	}

	@Override
	public String toString() {
		return "EmployeeVO [sabun=" + sabun + ", name=" + name + ", regdate=" + regdate + ", pay=" + pay + "]";
	}
	
	
	
}
