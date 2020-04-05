package model;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
public class AMemberDto implements UserDetails {

	private String email;		// 이메일
	private String password;	// 패스워드 
	private String name;		// 이름 
	
	
	
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
