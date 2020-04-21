package model;

public class PremierMemDto {

	private int seq;
	private int userSeq;
	private String name;
	private String serviceName;
	private String startDate;
	private String endDate;
	
	public PremierMemDto() {
		// TODO Auto-generated constructor stub
	}

	public PremierMemDto(int seq, int userSeq, String userName, String serviceName, String startDate, String endDate) {
		super();
		this.seq = seq;
		this.userSeq = userSeq;
		this.name = userName;
		this.serviceName = serviceName;
		this.startDate = startDate;
		this.endDate = endDate;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public int getUserSeq() {
		return userSeq;
	}

	public void setUserSeq(int userSeq) {
		this.userSeq = userSeq;
	}

	public String getName() {
		return name;
	}

	public void setName(String userName) {
		this.name = userName;
	}

	public String getServiceName() {
		return serviceName;
	}

	public void setServiceName(String serviceName) {
		this.serviceName = serviceName;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	@Override
	public String toString() {
		return "PremierMemDto [seq=" + seq + ", userSeq=" + userSeq + ", userName=" + name + ", serviceName="
				+ serviceName + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}

	
	
}
