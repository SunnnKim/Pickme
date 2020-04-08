package pickme.com.a.c_apply.dao;

import java.util.List;

import model.CvRequestDto;
import model.FavoriteDto;

public interface CApplyDao {
	
	public List<CvRequestDto> getRequestList();
	
	public int requestDelete(String seq);

	public List<CvRequestDto> requestLike();

	public boolean addLike(FavoriteDto dto);

	public boolean delLike(FavoriteDto dto);

	public boolean requestCancel(String cv_seq);
}
