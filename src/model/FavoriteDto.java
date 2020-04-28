package model;

public class FavoriteDto {

	private int seq;				// Favorite table seq
	private String email; 			// 기업 및 회원 email
	private int likePickSeq; 		// 회원 seq 및 기업 seq
	private int auth; 				// 구분 (0:인재 , 1:기업 , 3:게시물)

	public FavoriteDto() {
		// TODO Auto-generated constructor stub
	}



	public FavoriteDto(int seq, String email, int likePickSeq,int auth) {
		super();
		this.seq = seq;
		this.email = email;
		this.likePickSeq = likePickSeq;
		this.auth = auth;
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

	public int getLikePickSeq() {
		return likePickSeq;
	}

	public void setLikePickSeq(int likePickSeq) {
		this.likePickSeq = likePickSeq;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}



	@Override
	public String toString() {
		return "FavoriteDto [seq=" + seq + ", email=" + email + ", likePickSeq=" + likePickSeq + ", auth=" + auth + "]";
	}


	
}
