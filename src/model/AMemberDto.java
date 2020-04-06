package model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class AMemberDto implements UserDetails {

	private String email;		// 이메일
	private String password;	// 패스워드 
	private String name;		// 이름 
	private String phone;		// 핸드폰번호 
	private String profilePath;	// 프로필이미지 경로 
	private String profileName;	// 프로필이미지 이름 
	private String introduce;	// 자기 소개 
	private String job;			// 직업 
	private String career;		// 분야 
	private String hashtag;		// 해시태그
	private int mainResume;  	// 대표 이력서
	private int del;			// 삭제 여부 
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getProfilePath() {
		return profilePath;
	}

	public void setProfilePath(String profilePath) {
		this.profilePath = profilePath;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
	}

	public String getHashtag() {
		return hashtag;
	}

	public void setHashtag(String hashtag) {
		this.hashtag = hashtag;
	}

	public int getMainResume() {
		return mainResume;
	}

	public void setMainResume(int mainResume) {
		this.mainResume = mainResume;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public void setAuthorities(Collection<GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	private Collection<GrantedAuthority> authorities;
	
	
	
	public AMemberDto () {}
	
	public AMemberDto(String email) {
		this.email = email;
	}
	public AMemberDto(String email, String password, String name) {
		this.email = email;
		this.password = password;
		this.name = name;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	//	 계정이 갖고있는 권한 목록을 리턴한다.
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	//	 계정의 비밀번호를 리턴한다.
	@Override
	public String getPassword() {
		return password;
	}

	//	 계정의 아이디를 리턴한다. ( 또는 이메일 )
	@Override
	public String getUsername() {
		return this.email;
	}

	//	 계정이 만료되지 않았는 지 리턴한다. (true: 만료안됨)
	@Override
	public boolean isAccountNonExpired() {
		return false;
	}

	//	 계정이 잠겨있지 않았는 지 리턴한다. (true: 잠기지 않음)
	@Override
	public boolean isAccountNonLocked() {
		return false;
	}

	//	 비밀번호가 만료되지 않았는 지 리턴한다. (true: 만료안됨)
	@Override
	public boolean isCredentialsNonExpired() {
		return false;
	}
	
	//	 계정이 활성화(사용가능)인 지 리턴한다. (true: 활성화)
	@Override
	public boolean isEnabled() {
		return true;
	}

	@Override
	public String toString() {
		return "AMemberDto [email=" + email + ", password=" + password + ", name=" + name + "]";
	}
	
}
