package model;

public class AdminDto {

	private int seq;
	private String id;
	private String password;
	private int auth;
	
	public AdminDto() {
		// TODO Auto-generated constructor stub
	}

	
	public AdminDto(int seq, String id, String password, int auth) {
		super();
		this.seq = seq;
		this.id = id;
		this.password = password;
		this.auth = auth;
	}


	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}


	@Override
	public String toString() {
		return "AdminDto [seq=" + seq + ", id=" + id + ", password=" + password + ", auth=" + auth + "]";
	}
	
	
	
}
