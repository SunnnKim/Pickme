package pickme.com.a.searchPeople.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import model.SearchPeopleParam;
import pickme.com.a.searchJob.service.SearchJobService;

@Controller
@RequestMapping("/searchPeople")
public class SearchPeopleController {

	@Autowired
	SearchJobService service;
	
	
	// 인재탐색 인트로 (검색창)
	@RequestMapping(value="searchPeopleIntro.do")
	public String searchPeopleIntro() {
		
		return "searchPeople/searchPeopleIntro";
	}
	
	// 인재탐색 결과창 
	@RequestMapping(value="searchPeopleResult.do", method=RequestMethod.POST)
	public String searchPeopleResult( SearchPeopleParam searchParam) {
		System.out.println(searchParam);
		
		return "searchPeople/searchPeopleResult";
	}
	
}
