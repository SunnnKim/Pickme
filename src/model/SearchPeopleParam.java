package model;

import java.util.Arrays;

public class SearchPeopleParam {

	private String career;
	private String job1;
	private String job2;
	private String hashTags[];
	private int moreContentNum;

	public SearchPeopleParam() {

	}

	public SearchPeopleParam(String career, String job1, String job2, String[] hashTags, int moreContentNum) {
		super();
		this.career = career;
		this.job1 = job1;
		this.job2 = job2;
		this.hashTags = hashTags;
		this.moreContentNum = moreContentNum;
	}

	public String getCareer() {
		return career;
	}

	public void setCareer(String career) {
		this.career = career;
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

	public String[] getHashTags() {
		return hashTags;
	}

	public void setHashTags(String[] hashTags) {
		this.hashTags = hashTags;
	}

	public int getMoreContentNum() {
		return moreContentNum;
	}

	public void setMoreContentNum(int moreContentNum) {
		this.moreContentNum = moreContentNum;
	}

	@Override
	public String toString() {
		return "SearchPeopleParam [career=" + career + ", job1=" + job1 + ", job2=" + job2 + ", hashTags="
				+ Arrays.toString(hashTags) + ", moreContentNum=" + moreContentNum + "]";
	}

	

	
	
}

