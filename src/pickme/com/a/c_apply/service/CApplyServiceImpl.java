package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CvRequestDto;
import pickme.com.a.c_apply.dao.CApplyDao;

@Service
public class CApplyServiceImpl implements CApplyService{
	@Autowired
	CApplyDao cApplyDao;

	@Override
	public List<CvRequestDto> getRequestList() {
		return cApplyDao.getRequestList();
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
	public List<CvRequestDto> requestLikeList() {
		return cApplyDao.requestListList();
	}
	
	
	
	
}
