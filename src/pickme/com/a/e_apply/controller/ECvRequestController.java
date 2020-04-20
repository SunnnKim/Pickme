package pickme.com.a.e_apply.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;
import pickme.com.a.e_apply.service.ECvRequestService;

@Controller
@RequestMapping(value="/e_apply")
public class ECvRequestController {
	
	@Autowired
	ECvRequestService eservice;
	
	// 현재 요청목록 가져오기
	@RequestMapping (value="curCvReq.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String getcurCvReq(Model model, HttpSession session, CvReqParam param) {
		
		System.out.println("키워드-: " + param.getsKeyword());
	
		// session에서 login seq 받아와서 param에 세팅하기
		int loginSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		param.setLoginSeq(loginSeq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("??pn: " + pn + " start: " + start + " end: " +end);
	
		// MessageParam에 셋팅 
		param.setStart(start);
		param.setEnd(end);
		
		//요청 리스트 불러오기
		List<CvReqDto> cvReqList = eservice.getCvReqList(param);
		System.out.println("cvReqList: " + cvReqList.size());
		// 총 요청 갯수 
		int totalRecordCount = eservice.getReqTotalCount(param);
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		model.addAttribute("cvReqList", cvReqList);
		model.addAttribute("pageNumber", param.getPageNumber());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("sKeyword", param.getsKeyword());		
		
		return "e_apply/curCvReq";
	}
	
	
	// 지난 요청목록 가져오기
	@RequestMapping(value="pastCvReq.do", method={RequestMethod.GET, RequestMethod.POST})
	public String getPastCvReq(Model model, HttpSession session, CvReqParam param){
		System.out.println("pastCvReq");
		
		int loginSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		param.setLoginSeq(loginSeq);
		System.out.println("loginSeq: " + loginSeq);
		
		int pn = param.getPageNumber(); // 현재페이지넘버
		int start = pn * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (pn + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		System.out.println("pn: " + pn + " start: " + start + " end: " +end + " recordcountperPage: " + param.getRecordCountPerPage());
	
		// MessageParam에 셋팅 
		param.setStart(start);
		param.setEnd(end);
		
		// 지난 요청 내역 받아오기
		List<CvReqDto> pastCvReqList = eservice.getPastCvReqList(param);
		
		// 총 내역 수 불러오기
		int totalRecordCount = eservice.getPastReqTotalCount(param);
		System.out.println("totalRecordCount: " + totalRecordCount);
		
		//
		
		model.addAttribute("pastCvReqList", pastCvReqList);
		model.addAttribute("pageNumber", param.getPageNumber());
		model.addAttribute("totalRecordCount", totalRecordCount);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("sKeyword", param.getsKeyword());		
		
		
		return "e_apply/pastCvReq";
	}
	
	// 다중 이력서 열람 수락
	@ResponseBody
	@RequestMapping(value="cvReqAccepts.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int cvReqAccept(HttpSession session, int[] seqArray, int[] cSeqArray) {
		//List cvReq 불러오기
		AMemberDto login = (AMemberDto)(session.getAttribute("loginuser"));
		 int pseq = login.getSeq();
		 
		 int result = 0; // 최종결과 return값 
		for (int i = 0; i < seqArray.length; i++) {
		
			int seq = seqArray[i];
			int comseq = cSeqArray[i];
		  //System.out.println("seq: " + seq );
		  //System.out.println("cSeq: " + cseq);
			
			// 수락할 항목의 CV_REQUEST accept컬럼을 1로 만들기 
			int success = eservice.doAccept(seq);
			
			//System.out.println("success: " + success);
			
			// main이력서를 dto 안에 담아오기
			CvCompanyDto dto = eservice.getMainResumeSeq(pseq);
			
			// dto에 담은 이력서를 cv_company테이블(회사제출된 이력서 넣는 테이블)안에 담고 그 seq return(service에서 처리)
	
			dto.setComseq(comseq); //넘어온 cSeq를 dto에 세팅하기 
			int cvSeq = eservice.sendResume(dto);
			System.out.println("cvSeq:" + cvSeq);
			
			//return된 seq를 CV_REQUEST테이블의 수락할 항목 row에 CVSEQ 값으로 업데이트하기 
			result = eservice.putCvSeq(seq, cvSeq); 
			
		}	
		
		return result;
	}
	
	
	// 이력서종류선택해서 수락하기 
	@ResponseBody
	@RequestMapping(value="pickNSendResume.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int pickNSendResume(HttpSession session, int seq, int cSeq, int rSeq) {
		System.out.println("요청: " + seq );
		System.out.println("기업: " + cSeq);
		System.out.println("이력서: " + rSeq);
		
		AMemberDto login = (AMemberDto)(session.getAttribute("loginuser"));
		 int pseq = login.getSeq();
		 
		int success = eservice.doAccept(seq);
		
		//System.out.println("success: " + success);
		
		// main이력서를 dto 안에 담아오기
		CvCompanyDto dto = eservice.getMainResumeSeq(pseq);
		
		// dto에 담은 이력서를 cv_company테이블(회사제출된 이력서 넣는 테이블)안에 담고 그 seq return(service에서 처리)

		dto.setComseq(cSeq); //넘어온 cSeq를 dto에 세팅하기 
		int cvSeq = eservice.sendResume(dto);
		System.out.println("cvSeq:" + cvSeq);
		
		//return된 seq를 CV_REQUEST테이블의 수락할 항목 row에 CVSEQ 값으로 업데이트하기 
		int result = eservice.putCvSeq(seq, cvSeq);
		
		return result;
	}
	
	
	
	// 이력서요청수락시 이력서 선택을 위해 이력서 리스트불러오기 
	@ResponseBody
	@RequestMapping(value="getResumeList.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<CvCompanyDto> getResumeList(HttpSession session){
		int loginSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		List<CvCompanyDto> list = eservice.getResumeList(loginSeq);
		
		System.out.println("리스트사이즈::" + list.size());
		for(CvCompanyDto dto : list) {
		System.out.println("name: " + dto.getName());
		}
		
		return list;
	}
	
	
	// 이력서 열람 거절
	@ResponseBody
	@RequestMapping(value="cvReqReject.do", method={RequestMethod.GET, RequestMethod.POST})
	public int cvReqReject(HttpSession session, int seq) {
		System.out.println("seq: " + seq);
		int success = eservice.cvReqReject(seq);
		
		return success;
	}

	@ResponseBody
	@RequestMapping(value="deletePastReq.do", method= {RequestMethod.GET, RequestMethod.POST})
	public int[] deletePastReq(int[] seqArray) {
		System.out.println("seq길이: " + seqArray.length);
		int result[] = new int[seqArray.length];	
		for (int i = 0; i < seqArray.length; i++) {
		 result[i] = eservice.deletePastReq(seqArray[i]); 	
			
		}
		return result;
		
	}
	
	
}
