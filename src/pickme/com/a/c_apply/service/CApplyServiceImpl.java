package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageParam;
import pickme.com.a.c_apply.dao.CApplyDao;

@Service
public class CApplyServiceImpl implements CApplyService{
	@Autowired
	CApplyDao cApplyDao;

	@Override
	public List<CvRequestDto> getRequestList(int c_seq) {
		return cApplyDao.getRequestList(c_seq);
	}
	
	@Override
	public List<CvRequestDto> getRequestList(MessageParam param) {
		return cApplyDao.getRequestList(param);
	}

	@Override
	public int requestDelete(String checkRow) {
		String seqs[] = checkRow.split(",");
		
		int count = 0;
		for(int i =0; i < seqs.length; i++) {
			count += cApplyDao.requestDelete(seqs[i]);
		}
		return count;
	}

	@Override
	public List<CvRequestDto> requestLike(int c_seq) {
		return cApplyDao.requestLike(c_seq);
	}

	@Override
	public boolean addLike(FavoriteDto dto) {
		return cApplyDao.addLike(dto);
	}

	@Override
	public boolean delLike(FavoriteDto dto) {
		return cApplyDao.delLike(dto);
	}

	@Override
	public boolean requestCancel(String cv_seq) {
		return cApplyDao.requestCancel(cv_seq);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		return cApplyDao.getTotalRecordCount(param);
	}
	
	
	
	
}
