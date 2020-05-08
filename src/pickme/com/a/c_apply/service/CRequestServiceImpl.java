package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.AMemberDto;
import model.CvCompanyDto;
import model.CvRequestDto;
import model.FavoriteDto;
import model.MessageDto;
import model.MessageParam;
import pickme.com.a.c_apply.dao.CRequestDao;

@Service
public class CRequestServiceImpl implements CRequestService{
	@Autowired
	CRequestDao cApplyDao;

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
	public List<CvRequestDto> requestLike(MessageParam param) {
		return cApplyDao.requestLike(param);
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
	public int requestCancel(String cv_seq) {
		return cApplyDao.requestCancel(cv_seq);
	}

	@Override
	public int getTotalRecordCount(MessageParam param) {
		return cApplyDao.getTotalRecordCount(param);
	}

	@Override
	public int getLikeTotalRecordCount(MessageParam param) {
		return cApplyDao.getLikeTotalRecordCount(param);
	}

	@Override
	public CvCompanyDto reqResumeOpen(CvRequestDto dto) {
		return cApplyDao.reqResumeOpen(dto);
	}

	@Override
	public AMemberDto getaMemberProfile(String seq) {
		return cApplyDao.getaMemberProfile(seq);
	}

	@Override
	public boolean setResumeOpen(int cvSeq) {
		return cApplyDao.setResumeOpen(cvSeq);
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
