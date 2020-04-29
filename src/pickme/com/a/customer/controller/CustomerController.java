package pickme.com.a.customer.controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.swing.Box.Filler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.FilesDto;
import model.NoticeDto;import model.PremierServiceDto;
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
		// 조회수 증가 + 공지사항 디테일받아오기 
		NoticeDto detail = service.getNoticeDetail(seq);
		// 파일 목록 받아오기 
		List<FilesDto> files = service.getNoticeFiles(seq);
		// jsp로 전달
		model.addAttribute("detail", detail);
		model.addAttribute("files", files);
		return "customer/noticeDetail";
	}
	
	// 공지사항 파일다운로드
	@RequestMapping(value="noticeFileDownload.do",method = { RequestMethod.GET, RequestMethod.POST })
	public String noticeFileDownload(String filename, HttpServletRequest request, Model model) {
			
			// download 경로
			// tomcat
			String fupload = request.getServletContext().getRealPath("/upload/notice");
			System.out.println("Download filename: " + filename);
			File downloadFile = new File(fupload + "/" + filename);
			
			model.addAttribute("downloadFile", downloadFile);
			
			return "downloadView";	// 다른 뷰로 이동하는 것이 아니고 다운로드만 됨
	}
	
	
	// 기업 유료서비스 뷰로 이동하기
	@RequestMapping(value="paidService.do", method=RequestMethod.GET)
	public String paidService(Model model) {
		List<PremierServiceDto> list = service.getPremierService();
		model.addAttribute("list", list);
		
		return "customer/paidService/paidService";
	}
	

	// 기업 유료서비스 디테일 뷰로 이동하기
	@RequestMapping(value="paidServiceDetail.do", method=RequestMethod.GET)
	public String paidService(Model model, int seq) {
		PremierServiceDto dto = service.getServiceDetail(seq);
		model.addAttribute("dto", dto);
		
		return "customer/paidService/paidServiceDetail";
	}
	
	
	// @@@@@@@@@@@
	// 문의하기 뷰 
	@RequestMapping(value="customerService.do")
	public String questionView( ) {
		return "customer/customerService";
	}
	
	
}
