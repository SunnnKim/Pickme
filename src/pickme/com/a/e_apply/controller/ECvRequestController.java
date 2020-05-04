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
import model.AwardsEtcDto;
import model.CareerDto;
import model.CvCompanyDto;
import model.CvReqDto;
import model.CvReqParam;
import model.EducationDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeAfterDto;
import model.ResumeDto;
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
		 int n = 0; 
		for (int i = 0; i < seqArray.length; i++) {
		
			int seq = seqArray[i];
			int comSeq = cSeqArray[i];
		 
			// 수락할 항목의 CV_REQUEST accept컬럼을 1로 만들기 
			
			
			//System.out.println("success: " + success);
			
			// main이력서를 resumeDto 안에 담은 다음 resumeAfter테이블에 넣기 
			 /*가져오기*/ 
			ResumeAfterDto rdto = eservice.getMainResume(pseq);
			int originalId = rdto.getSeq();
			 /*넣기*/
			// 수락할 회사시퀀스 셋팅 
			rdto.setComSeq(comSeq);
			n = eservice.putResume(rdto);
			System.out.println("resume insert: " + n);
			int rsmSeq = eservice.getLastId();
			
			// 이력서를 직접 작성한 것인지, 파일로 올린것인지 구분하기  
			if(rdto.getStatus() == 1) { // 직접 작성한 경우 
				// career를 careerDto에 담은 다음 careerAfter테이블에 넣기 
				CareerDto cdto = eservice.getCareer(originalId);
				//cdto에 새로 집어넣은 afterResumeId를 rsmseq로 세팅하기( resume를 기준으로 관련 경력을 한번에 꺼내기 위함)
				cdto.setRsmseq(rsmSeq);
				n = eservice.putCareer(cdto);
				System.out.println("career insert: " + n);
				// awards를 awardsEtcDto에 담은 다음 awardAfter테이블에 넣기
				AwardsEtcDto adto = eservice.getAwardsEtc(originalId);
				
				adto.setRsmseq(rsmSeq);
				n = eservice.putAwardsEtc(adto);
				System.out.println("awardsEtc insert: " + n);
				// language를 languageDto에 담은 다음 languageAfter 테이블에 넣기 
				LanguageDto langdto = eservice.getLanguage(originalId);
				
				langdto.setRsmseq(rsmSeq);
				n = eservice.putLanguage(langdto);
				System.out.println("language insert; " + n);
				// education을 educationDto 에 담은 다음 educatonAfter테이블에 넣기 
				EducationDto edto = eservice.getEducation(originalId);
				
				edto.setRsmseq(rsmSeq);
				n = eservice.putEducation(edto);
				System.out.println("educatioin insert: " + n);
				
				// link를 
				LinkDto  linkdto = eservice.getLink(originalId);
				
				linkdto.setRsmseq(rsmSeq);
				n = eservice.putLink(linkdto);
				System.out.println("link insert: " + n);
			
			}else if(rdto.getStatus() == 3) { // 파일로 업로드 한 경우 (나중에 dto만들면 하기)
				
				
				
			}
				
			// 이력서 열람 수락한 것으로 표시 + 수락한 resume 시퀀스 cvRequest테이블에 넣기 
				n = eservice.doAccept(seq, rsmSeq);
							
		}	
		
		return n;
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
		 int n = 0;
		// 선택한이력서를 dto 안에 담아오기
		ResumeAfterDto rdto = eservice.getResume(rSeq);
		
		 /*넣기*/
		// 수락할 회사시퀀스 셋팅 
		rdto.setComSeq(cSeq);
		n = eservice.putResume(rdto);
		System.out.println("resume insert: " + n);
		int rsmSeq = eservice.getLastId();
		
		// 이력서를 직접 작성한 것인지, 파일로 올린것인지 구분하기  
		if(rdto.getStatus() == 1) { // 직접 작성한 경우 
			// career를 careerDto에 담은 다음 careerAfter테이블에 넣기 
			CareerDto cdto = eservice.getCareer(rSeq);
			//cdto에 새로 집어넣은 afterResumeId를 rsmseq로 세팅하기( resume를 기준으로 관련 경력을 한번에 꺼내기 위함)
			cdto.setRsmseq(rsmSeq);
			n = eservice.putCareer(cdto);
			System.out.println("career insert: " + n);
			// awards를 awardsEtcDto에 담은 다음 awardAfter테이블에 넣기
			AwardsEtcDto adto = eservice.getAwardsEtc(rSeq);
			
			adto.setRsmseq(rsmSeq);
			n = eservice.putAwardsEtc(adto);
			System.out.println("awardsEtc insert: " + n);
			// language를 languageDto에 담은 다음 languageAfter 테이블에 넣기 
			LanguageDto langdto = eservice.getLanguage(rSeq);
			
			langdto.setRsmseq(rsmSeq);
			n = eservice.putLanguage(langdto);
			System.out.println("language insert; " + n);
			// education을 educationDto 에 담은 다음 educatonAfter테이블에 넣기 
			EducationDto edto = eservice.getEducation(rSeq);
			
			edto.setRsmseq(rsmSeq);
			n = eservice.putEducation(edto);
			System.out.println("educatioin insert: " + n);
			
			// link를 
			LinkDto  linkdto = eservice.getLink(rSeq);
			
			linkdto.setRsmseq(rsmSeq);
			n = eservice.putLink(linkdto);
			System.out.println("link insert: " + n);
		
		}else if(rdto.getStatus() == 3) { // 파일로 업로드 한 경우 (나중에 dto만들면 하기)
			
			
			
		}
		
		// 이력서 열람 수락한 것으로 표시 + 수락한 resume 시퀀스 cvRequest테이블에 넣기 
		n = eservice.doAccept(seq, rsmSeq);
		
		return n;
	}
	
	
	
	// 이력서요청수락시 이력서 선택을 위해 이력서 리스트불러오기 
	@ResponseBody
	@RequestMapping(value="getResumeList.do", method={RequestMethod.GET, RequestMethod.POST})
	public List<ResumeDto> getResumeList(HttpSession session){
		int loginSeq = ((AMemberDto) session.getAttribute("loginuser")).getSeq();
		List<ResumeDto> list = eservice.getResumeList(loginSeq);
		
		System.out.println("리스트사이즈::" + list.size());
		for(ResumeDto dto : list) {
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
