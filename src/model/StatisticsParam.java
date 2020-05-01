package model;

public class StatisticsParam {
	
	private int statNum1;
	private int statNum2;
	private int statNum3;
	private String statStr1;
	private String statStr2;
	private String statStr3;
	
	public StatisticsParam() {
		// TODO Auto-generated constructor stub
	}

	public StatisticsParam(int statNum1, int statNum2, int statNum3, String statStr1, String statStr2,
			String statStr3) {
		super();
		this.statNum1 = statNum1;
		this.statNum2 = statNum2;
		this.statNum3 = statNum3;
		this.statStr1 = statStr1;
		this.statStr2 = statStr2;
		this.statStr3 = statStr3;
	}

	public int getStatNum1() {
		return statNum1;
	}

	public void setStatNum1(int statNum1) {
		this.statNum1 = statNum1;
	}

	public int getStatNum2() {
		return statNum2;
	}

	public void setStatNum2(int statNum2) {
		this.statNum2 = statNum2;
	}

	public int getStatNum3() {
		return statNum3;
	}

	public void setStatNum3(int statNum3) {
		this.statNum3 = statNum3;
	}

	public String getStatStr1() {
		return statStr1;
	}

	public void setStatStr1(String statStr1) {
		this.statStr1 = statStr1;
	}

	public String getStatStr2() {
		return statStr2;
	}

	public void setStatStr2(String statStr2) {
		this.statStr2 = statStr2;
	}

	public String getStatStr3() {
		return statStr3;
	}

	public void setStatStr3(String statStr3) {
		this.statStr3 = statStr3;
	}

	@Override
	public String toString() {
		return "StatisticsParam [statNum1=" + statNum1 + ", statNum2=" + statNum2 + ", statNum3=" + statNum3
				+ ", statStr1=" + statStr1 + ", statStr2=" + statStr2 + ", statStr3=" + statStr3 + "]";
	}
	
	
	

}
