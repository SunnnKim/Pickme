package pickme.com.a.admin.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.MemberDto;
import pickme.com.a.admin.dao.AdminDao;


@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminDao memberDao;

	@Override
	public MemberDto test() {
		return memberDao.test();
	}
	
	
	
	
}


