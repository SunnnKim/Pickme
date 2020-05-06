package pickme.com.a.searchPeople.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.CMemberDto;
import model.CvRecruitDto;
import model.CvRequestDto;
import model.SearchPeopleParam;
import pickme.com.a.searchPeople.service.SearchPeopleService;

@Controller
@RequestMapping("/searchPeople")
public class SearchPeopleController {

	@Autowired
	SearchPeopleService service;
	
	
	// 인재탐색 인트로 (검색창)
	@RequestMapping(value="searchPeopleIntro.do")
	public String searchPeopleIntro(Model model, HttpSession session) {
		int seq = ((CMemberDto) session.getAttribute("logincompany")).getSeq();
		boolean isPremier = service.isPremierMember(seq);
		model.addAttribute("isPremier", isPremier);
		return "searchPeople/searchPeopleIntro";
	}
	
	// 인재탐색 결과창 
	@RequestMapping(value="searchPeopleResult.do", method=RequestMethod.POST)
	public String searchPeopleResult( SearchPeopleParam searchParam, Model model) {
		
		// 검색용 데이터 보내기 
		model.addAttribute("searchParam", searchParam);

		// 검색 개수 설정 (초기 0)
		searchParam.setMoreContentNum(0);

		// 검색용 % 달기 
		searchParam.setCareer( addPercentToBack( searchParam.getCareer() ) );
		searchParam.setJob1( addPercentToBack( searchParam.getJob1() ) );
		searchParam.setJob2( addPercentToBack( searchParam.getJob2() ) );
		
		
		List<AMemberDto> searchList;
		int dataNumber;
		// 해시태그 존재할 때 
		if( searchParam.getHashTags().length != 0 ) {
			
			searchList = service.getSearchDetail(searchParam);
			// 검색데이터 총 개수 
			dataNumber = service.getSearchDetailNumber(searchParam);
		}
		// 해시태그 없을 시  
		else {
			
			searchList = service.getSearchBasic(searchParam);
			// 검색데이터 총 개수 
			dataNumber = service.getSearchBasicNumber(searchParam);
		}
		System.out.println(searchParam);
		
		// 검색 데이터 보내기 
		model.addAttribute("searchList", searchList);
		model.addAttribute("dataNumber", dataNumber);
		
		return "searchPeople/searchPeopleResult";
		
	}
	// 더보기로 데이터 끌어오기
	@ResponseBody
	@RequestMapping(value="moreContent.do")
	public Map<String, Object> moreContent(SearchPeopleParam searchParam, int contentNumber){
		// 더보기 오프셋 설정
		searchParam.setMoreContentNum(contentNumber * 5);
		List<AMemberDto> searchList = service.getSearchBasic(searchParam);
		System.out.println(searchParam);
		//리턴값
        Map<String, Object> sendData = new HashMap<String, Object>();
        
        //성공했다고 처리
        sendData.put("searchList", searchList);
		
		return sendData;
	}
	
	// 인재 디테일 가져오기
	@ResponseBody
	@RequestMapping(value="getPeopleDetail.do", method=RequestMethod.POST)
	public Map<String, Object> getPeopleDetail(int seq){
		
		Map<String, Object> data = new HashMap<>();
		AMemberDto people = service.getPeopleDetail(seq);
		data.put("people", people);
		return data;
	}
	
	// 이력서 열람요청하기 
	@ResponseBody
	@RequestMapping(value="requestResume.do", method=RequestMethod.POST)
	public boolean requestResume( CvRequestDto cv, HttpSession session ) {
		System.out.println(cv);
		int comSeq = ((CMemberDto) session.getAttribute("logincompany")).getSeq();
		cv.setComSeq(comSeq);
		boolean success = service.insertCvRequest(cv);
	
		return success;
	}
	
	
	
	
	// 기능함수 앞 뒤로( % ) 붙여줌 
	public String addPercentToBack(String component) {
		String newStr = "%"+component.trim()+"%";
		return newStr;
	}
}
