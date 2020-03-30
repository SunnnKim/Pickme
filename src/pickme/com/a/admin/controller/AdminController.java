package pickme.com.a.admin.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import pickme.com.a.admin.service.AdminService;


@Controller
public class AdminController {

	@Autowired
	AdminService service;

}
