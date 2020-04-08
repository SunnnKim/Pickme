package model;

public class FavoriteDto {

	private String email; 			// 기업 및 회원 email
	private int likePickSeq; 		// 회원 seq 및 기업 seq
	private int likePickCount; 		// 찜 +팔로우 count
	private int auth; 				// 구분 (0:인재 , 1:기업 , 3:게시물)

	public FavoriteDto() {
		// TODO Auto-generated constructor stub
	}

	public FavoriteDto(String email, int likePickSeq, int likePickCount, int auth) {
		super();
		this.email = email;
		this.likePickSeq = likePickSeq;
		this.likePickCount = likePickCount;
		this.auth = auth;
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

	public int getLikePickCount() {
		return likePickCount;
	}

	public void setLikePickCount(int likePickCount) {
		this.likePickCount = likePickCount;
	}

	public int getAuth() {
		return auth;
	}

	public void setAuth(int auth) {
		this.auth = auth;
	}

	@Override
	public String toString() {
		return "FavoriteDto [email=" + email + ", likePickSeq=" + likePickSeq + ", likePickCount=" + likePickCount
				+ ", auth=" + auth + "]";
	}

	
	
}
