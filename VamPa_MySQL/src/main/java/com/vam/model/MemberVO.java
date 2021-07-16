package com.vam.model;

import java.util.Objects;

public class MemberVO {
	
	//회원 id
	private String memberId;
	//회원 비밀번호
	private String memberPw;
	//회원 이름
	private String memberName;
	//회원 이메일
	private String memberMail;
	//회원 우편번호
	private String memberAddr1;
	//회원 주소
	private String memberAddr2;
	//회원 상세주소
	private String memberAddr3;
	// 관리자 구분(0:일반사용자, 1:관리자)
	private int adminCk;
	//등록일자
	private int regDate;
	//회원 돈
	private int money;
	//회원 포인트
	private int point;
	
	public MemberVO() {}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPw() {
		return memberPw;
	}

	public void setMemberPw(String memberPw) {
		this.memberPw = memberPw;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getMemberMail() {
		return memberMail;
	}

	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}

	public String getMemberAddr1() {
		return memberAddr1;
	}

	public void setMemberAddr1(String memberAddr1) {
		this.memberAddr1 = memberAddr1;
	}

	public String getMemberAddr2() {
		return memberAddr2;
	}

	public void setMemberAddr2(String memberAddr2) {
		this.memberAddr2 = memberAddr2;
	}

	public String getMemberAddr3() {
		return memberAddr3;
	}

	public void setMemberAddr3(String memberAddr3) {
		this.memberAddr3 = memberAddr3;
	}

	public int getAdminCk() {
		return adminCk;
	}

	public void setAdminCk(int adminCk) {
		this.adminCk = adminCk;
	}

	public int getRegDate() {
		return regDate;
	}

	public void setRegDate(int regDate) {
		this.regDate = regDate;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPoint() {
		return point;
	}

	public void setPoint(int point) {
		this.point = point;
	}

	public MemberVO(String memberId, String memberPw, String memberName, String memberMail, String memberAddr1,
			String memberAddr2, String memberAddr3, int adminCk, int regDate, int money, int point) {
		super();
		this.memberId = memberId;
		this.memberPw = memberPw;
		this.memberName = memberName;
		this.memberMail = memberMail;
		this.memberAddr1 = memberAddr1;
		this.memberAddr2 = memberAddr2;
		this.memberAddr3 = memberAddr3;
		this.adminCk = adminCk;
		this.regDate = regDate;
		this.money = money;
		this.point = point;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", memberPw=" + memberPw + ", memberName=" + memberName
				+ ", memberMail=" + memberMail + ", memberAddr1=" + memberAddr1 + ", memberAddr2=" + memberAddr2
				+ ", memberAddr3=" + memberAddr3 + ", adminCk=" + adminCk + ", regDate=" + regDate + ", money=" + money
				+ ", point=" + point + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(adminCk, memberAddr1, memberAddr2, memberAddr3, memberId, memberMail, memberName, memberPw,
				money, point, regDate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		MemberVO other = (MemberVO) obj;
		return adminCk == other.adminCk && Objects.equals(memberAddr1, other.memberAddr1)
				&& Objects.equals(memberAddr2, other.memberAddr2) && Objects.equals(memberAddr3, other.memberAddr3)
				&& Objects.equals(memberId, other.memberId) && Objects.equals(memberMail, other.memberMail)
				&& Objects.equals(memberName, other.memberName) && Objects.equals(memberPw, other.memberPw)
				&& money == other.money && point == other.point && regDate == other.regDate;
	}

}
