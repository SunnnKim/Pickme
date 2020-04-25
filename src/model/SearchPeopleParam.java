package model;

public class SearchPeopleParam {

	private String peopleType;
	private String job1;
	private String job2;
	private String hashTags;

	public SearchPeopleParam() {
		// TODO Auto-generated constructor stub
	}

	public SearchPeopleParam(String peopleType, String job1, String job2, String hashTags) {
		super();
		this.peopleType = peopleType;
		this.job1 = job1;
		this.job2 = job2;
		this.hashTags = hashTags;
	}

	public String getPeopleType() {
		return peopleType;
	}

	public void setPeopleType(String peopleType) {
		this.peopleType = peopleType;
	}

	public String getJob1() {
		return job1;
	}

	public void setJob1(String job1) {
		this.job1 = job1;
	}

	public String getJob2() {
		return job2;
	}

	public void setJob2(String job2) {
		this.job2 = job2;
	}

	public String getHashTags() {
		return hashTags;
	}

	public void setHashTags(String hashTags) {
		this.hashTags = hashTags;
	}

	@Override
	public String toString() {
		return "SearchPeopleParam [peopleType=" + peopleType + ", job1=" + job1 + ", job2=" + job2 + ", hashTags="
				+ hashTags + "]";
	}
	
	
}

