package pickme.com.a.c_apply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CApplyDto;
import pickme.com.a.c_apply.dao.CApplyDao;

@Service
public class CApplyServiceImpl implements CApplyService{
	@Autowired
	CApplyDao cApplyDao;

	@Override
	public List<CApplyDto> getRequestList() {
		return cApplyDao.getRequestList();
	}
	
}
