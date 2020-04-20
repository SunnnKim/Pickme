package pickme.com.a.c_apply.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pickme.com.a.c_apply.dao.CApplyDao;

@Service
public class CApplyServiceImpl implements CApplyService {

	@Autowired
	CApplyDao cApplyDao;
	
	
}
