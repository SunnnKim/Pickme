package model;

public class EInterestDto {
	private int likepickseq; // 좋아요 한 게시물 or 기업 seq
    private String name;     // 좋아요 한 기업이름- c_member 용  
    private String tel;		 // 좋아요 한 기업 번호 	
    private String title;    // 좋아요 한 채용공고 제목 
    private String comName;  // 좋아요 한 채용공고 올린 기업이름 
    private String logopath; // 기업 로고 이름
    private String logoname;
    private String comjob1;  // 직무 
    private String edate;    // 채용 마감일
    private int apply;       // 지원여부  
    private int seq;         // 채용공고 seq 
    private int comseq;
  
    
    public EInterestDto() {
    	
    }


	public EInterestDto(int likepickseq, String name, String tel, String title, String comName, String logopath,
			String logoname, String comjob1, String edate, int apply, int seq, int comseq) {
		super();
		this.likepickseq = likepickseq;
		this.name = name;
		this.tel = tel;
		this.title = title;
		this.comName = comName;
		this.logopath = logopath;
		this.logoname = logoname;
		this.comjob1 = comjob1;
		this.edate = edate;
		this.apply = apply;
		this.seq = seq;
		this.comseq = comseq;
	}


	public int getLikepickseq() {
		return likepickseq;
	}


	public void setLikepickseq(int likepickseq) {
		this.likepickseq = likepickseq;
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


	public String getTitle() {
		return title;
	}


	public void setTitle(String title) {
		this.title = title;
	}


	public String getComName() {
		return comName;
	}


	public void setComName(String comName) {
		this.comName = comName;
	}


	public String getLogopath() {
		return logopath;
	}


	public void setLogopath(String logopath) {
		this.logopath = logopath;
	}


	public String getLogoname() {
		return logoname;
	}


	public void setLogoname(String logoname) {
		this.logoname = logoname;
	}


	public String getComjob1() {
		return comjob1;
	}


	public void setComjob1(String comjob1) {
		this.comjob1 = comjob1;
	}


	public String getEdate() {
		return edate;
	}


	public void setEdate(String edate) {
		this.edate = edate;
	}


	public int getApply() {
		return apply;
	}


	public void setApply(int apply) {
		this.apply = apply;
	}


	public int getSeq() {
		return seq;
	}


	public void setSeq(int seq) {
		this.seq = seq;
	}


	public int getComseq() {
		return comseq;
	}


	public void setComseq(int comseq) {
		this.comseq = comseq;
	}


	@Override
	public String toString() {
		return "EInterestDto [likepickseq=" + likepickseq + ", name=" + name + ", tel=" + tel + ", title=" + title
				+ ", comName=" + comName + ", logopath=" + logopath + ", logoname=" + logoname + ", comjob1=" + comjob1
				+ ", edate=" + edate + ", apply=" + apply + ", seq=" + seq + ", comseq=" + comseq + "]";
	}


	
	
    
}
