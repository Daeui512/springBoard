package com.spring.board.vo;

public class MemberVo {

	private String userId;
	private String userPw;
	private String userName;
	private String userPhone1;
	private String userPhone2;
	private String userPhone3;
	private String userAddr1;
	private String userAddr2;
	private String userCompany;
	
	public MemberVo() {
		// TODO Auto-generated constructor stub
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserPw() {
		return userPw;
	}
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserPhone1() {
		return userPhone1;
	}
	public void setUserPhone1(String userPhone1) {
		this.userPhone1 = userPhone1;
	}
	public String getUserPhone2() {
		return userPhone2;
	}
	public void setUserPhone2(String userPhone2) {
		this.userPhone2 = userPhone2;
	}
	public String getUserPhone3() {
		return userPhone3;
	}
	public void setUserPhone3(String userPhone3) {
		this.userPhone3 = userPhone3;
	}
	public String getUserAddr1() {
		return userAddr1;
	}
	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}
	public String getUserAddr2() {
		return userAddr2;
	}
	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}
	
	public String getUserCompany() {
		return userCompany;
	}
	public void setUserCompany(String userCompany) {
		this.userCompany = userCompany;
	}

	@Override
	public String toString() {
		return "MemberVo [userId=" + userId + ", userPw=" + userPw + ", userName=" + userName + ", userPhone1="
				+ userPhone1 + ", userPhone2=" + userPhone2 + ", userPhone3=" + userPhone3 + ", userAddr1=" + userAddr1
				+ ", userAddr2=" + userAddr2 + ", userCompany=" + userCompany + "]";
	}

	public MemberVo(String userId, String userPw, String userName, String userPhone1, String userPhone2,
			String userPhone3, String userAddr1, String userAddr2, String userCompany) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userPhone1 = userPhone1;
		this.userPhone2 = userPhone2;
		this.userPhone3 = userPhone3;
		this.userAddr1 = userAddr1;
		this.userAddr2 = userAddr2;
		this.userCompany = userCompany;
	}
	
	
	
	
	
}