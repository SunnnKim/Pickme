package pickme.com.a.c_apply.dao;

import java.util.List;

import model.AMemberDto;
import model.CvCompanyDto;
import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageDto;
import model.MessageParam;

public interface CRequestDao {
	
	public List<CvRequestDto> getRequestList(int c_seq);

	public List<CvRequestDto> getRequestList(MessageParam param);
	
	public int requestDelete(String seq);

	public List<CvRequestDto> requestLike(int c_seq);
	public List<CvRequestDto> requestLike(MessageParam param);

	public boolean addLike(FavoriteDto dto);

	public boolean delLike(FavoriteDto dto);

	public int requestCancel(String cv_seq);

	public int getTotalRecordCount(MessageParam param);
	public int getLikeTotalRecordCount(MessageParam param);

	public CvCompanyDto reqResumeOpen(CvRequestDto dto);

	public AMemberDto getaMemberProfile(String seq);

	public boolean setResumeOpen(int cvSeq);

	
	
	
	

}
