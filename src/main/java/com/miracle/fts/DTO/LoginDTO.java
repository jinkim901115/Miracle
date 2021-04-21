package com.miracle.fts.DTO;

public class LoginDTO {
	private String id; // m_id
	private String pw; // m_pw
	private String name; // m_name
	private String addr; // m_addr
	private String addr2; // m_addr
	private String addr3; // u_addr3
	private String phone; // m_phone
	private String email; // m_email
	private String email2; // m_email
	private String phone2;
	private String phone3;
	private String auth;
	
	// 생성자
	public LoginDTO() {
		super();
//		System.out.println("WriteDTO() 객체 생성");
	}
	
	public LoginDTO(String id, String pw, String name, String addr, String addr2, String phone, String email,
			String email2, String phone2, String phone3, String auth) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.addr = addr;
		this.addr2 = addr2;
		this.addr3 = addr3;
		this.phone = phone;
		this.email = email;
		this.email2 = email2;
		this.phone2 = phone2;
		this.phone3 = phone3;
		this.auth = auth;
	}

	// 웹개발시...
	// 가능한, 다음 3가지는 이름을 일치시켜주는게 좋습니다.
	// 클래스 필드명 = DB 필드명 = form의 name명

	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}

	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	
	
	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getAddr3() {
		return addr3;
	}

	public void setAddr3(String addr3) {
		this.addr3 = addr3;
	}

	@Override
	public String toString() {
		return String.format("LoginDTO] %s : %s : %s : %s : %s : %s : %s : %s", 
				id, pw, name, addr, phone, email, phone2, phone3);
	}
}
