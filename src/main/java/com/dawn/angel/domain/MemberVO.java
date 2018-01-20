package com.dawn.angel.domain;

public class MemberVO { // 일반회원
	
	private String id; // 아이디
	private String pwd; // 비밀번호
	private String name; // 이름 
	private String birth; // 생년월일
	private int gender; // 성별 (남자 : 1, 여자 : 2)
	private String phone; // 핸드폰
	private String address; // 주소
	private String email; // 이메일
	private char useyn; // 사용여부 (사용가능 : y, 사용 불가능 : n)
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public int getGender() {
		return gender;
	}
	public void setGender(int gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public char getUseyn() {
		return useyn;
	}
	public void setUseyn(char useyn) {
		this.useyn = useyn;
	}
	@Override
	public String toString() {
		return "MemberVO [id=" + id + ", pwd=" + pwd + ", name=" + name + ", birth=" + birth + ", gender=" + gender
				+ ", phone=" + phone + ", address=" + address + ", email=" + email + ", useyn=" + useyn + "]";
	}
}
