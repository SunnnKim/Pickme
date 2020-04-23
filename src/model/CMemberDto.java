package model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CMemberDto implements UserDetails {
	
	
	// 기업 회원 정보 수정
	private int seq;				// 기업시퀀스
	private String email;			// 이메일
	private String password;		// 비밀번호
	private String president;		// 대표자 성명
	private String name;				// 기업명
	private String tel;				// 전화번호
	private String department;		// 기업분야
	private String type;				// 기업종류
	private String address;			// 주소
	private String introduce;		// 기업소개
	private int del;				// 탈퇴여부 (0 등록 / 1 삭제)
	private String hashTag;			// 해시태그
	private long number;				// 사업자등록번호
	private String logoPath;		// 로고이미지 경로
	private String logoName;		// 로고이미지 이름
	private String signDate;		// 가입일자
	
	// 로그인 시큐리티용 변수 
	private Collection<GrantedAuthority> authorities;
	
	// 로그인 시큐리티용 함수 
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public String getUsername() {
		return this.email;
	}

	@Override
	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isAccountNonLocked() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean isEnabled() {
		// TODO Auto-generated method stub
		return true;
	}	
	
	
	// 기본 생성자 
	public CMemberDto() {
	}
	
	// email 생성자 
	public CMemberDto(String email) {
		this.email = email;
	}

	
	
	public CMemberDto(int seq, String email, String password, String president, String name, String tel,
			String department, String type, String address, String introduce, int del, String hashTag, long number,
			String logoPath, String logoName, String signDate) {
		super();
		this.seq = seq;
		this.email = email;
		this.password = password;
		this.president = president;
		this.name = name;
		this.tel = tel;
		this.department = department;
		this.type = type;
		this.address = address;
		this.introduce = introduce;
		this.del = del;
		this.hashTag = hashTag;
		this.number = number;
		this.logoPath = logoPath;
		this.logoName = logoName;
		this.signDate = signDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPresident() {
		return president;
	}

	public void setPresident(String president) {
		this.president = president;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address == null ? "등록된 주소가 없습니다." : address;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce == null ? "등록된 소개가 없습니다." : introduce;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public String getHashTag() {
		return hashTag;
	}

	public void setHashTag(String hashTag) {
		this.hashTag = hashTag == null ? "" : hashTag;
	}

	public long getNumber() {
		return number;
	}

	public void setNumber(long number) {
		this.number = number;
	}

	public String getLogoPath() {
		return logoPath;
	}

	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}

	public String getLogoName() {
		return logoName;
	}

	public void setLogoName(String logoName) {
		this.logoName = logoName;
	}

	public String getSignDate() {
		return signDate;
	}

	public void setSignDate(String signDate) {
		this.signDate = signDate;
	}

	@Override
	public String toString() {
		return "CMemberDto [seq=" + seq + ", email=" + email + ", password=" + password + ", president=" + president
				+ ", name=" + name + ", tel=" + tel + ", department=" + department + ", type=" + type + ", address="
				+ address + ", introduce=" + introduce + ", del=" + del + ", hashTag=" + hashTag + ", number=" + number
				+ ", logoPath=" + logoPath + ", logoName=" + logoName + ", signDate=" + signDate + "]";
	}

	
}






