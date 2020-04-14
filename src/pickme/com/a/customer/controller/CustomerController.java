package pickme.com.a.customer.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.NoticeDto;
import pickme.com.a.customer.service.CustomerService;

@Controller
@RequestMapping(value="/customer")
public class CustomerController {

	@Autowired
	CustomerService service;
	
	// 공지사항 리스트 
	@RequestMapping(value="noticeList.do")
	public String noticeList( Model model, Integer pageNumber ) {
		if(pageNumber == null ) {
			System.out.println("첫페이지 ");
			pageNumber = 0;
		}
		List<NoticeDto> list = service.getAllNoticePage(pageNumber);
		int allContents = service.countAllContent();
		// 전체 페이지 수
		int allPage = allContents / 10 + 1;
		if( allContents % 10 == 0 && allContents != 0 ) {
			allPage = allPage - 1;
		}
		// 페이지 10개 중 첫 페이지넘버
		int firstPage = (pageNumber / 10) * 10;
		
		model.addAttribute("list", list);
		model.addAttribute("allPage", allPage);
		model.addAttribute("nowPage", pageNumber);
		model.addAttribute("firstPage", firstPage);
		System.out.println("allContents: "+allContents);
		System.out.println("allPage: "+allPage);
		System.out.println("nowPage: "+pageNumber);
		System.out.println("firstPage: "+firstPage);
		
		return "customer/noticeList";
	}
	// 공지사항디테일뷰
	@RequestMapping(value="noticeDetail.do")
	public String noticeDetail(Model model, int seq ) {
		System.out.println("seq: " + seq);
		NoticeDto detail = service.getNoticeDetail(seq);
		model.addAttribute("detail", detail);
		return "customer/noticeDetail";
	}
	
//	// 에이작스로 받아오기
//	@ResponseBody
//	@RequestMapping(value="getList.do",method=RequestMethod.POST)
//	public Object getNoticeAll(Model model, Integer pageNumber) {
//		System.out.println("Ajax : getList.do");
//		if(pageNumber == null ) {
//			System.out.println("첫페이지 ");
//			pageNumber = 1;
//		}
//		List<NoticeDto> list = service.getAllNoticePage(pageNumber);
//		
//		Map<String, Object> retVal = new HashMap<String, Object>();
//		
//		retVal.put("list", list);
//		
//		return retVal;
//		
//	}
	
}
