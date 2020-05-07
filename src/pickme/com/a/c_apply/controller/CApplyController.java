package pickme.com.a.c_apply.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.AMemberDto;
import model.AwardsEtcDto;
import model.CApplyDto;
import model.CMemberDto;
import model.CareerDto;
import model.CvRecruitDto;
import model.EducationDto;
import model.FavoriteDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.MessageDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeFileDto;
import pickme.com.a.c_apply.service.CApplyService;
import pickme.com.a.c_apply.service.CMsgService;
import pickme.com.a.recruit.service.RecruitService;
import pickme.com.a.searchJob.service.SearchJobService;

@Controller
@RequestMapping(value = "/c_apply")
public class CApplyController {

	@Autowired
	CApplyService cApplyService;
	@Autowired
	CMsgService cMsgService;
	@Autowired
	RecruitService serv;
	@Autowired
	SearchJobService searchServ;
	
	
	
	@RequestMapping(value = "cApplyMain.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cApplyMain(RecruitParam param, Model model, HttpSession session) {
		
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq(); 
		param.setComSeq(c_seq);
		System.out.println("seq : " + c_seq);
		
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		//System.out.println("현재 페이지 : "+ nowPage);
		//채용 탐색에서 채용중인 총 게시글 수
		int totalRecordCount = cApplyService.getComRecCount(c_seq);
		
		param.setStart(start);
		param.setEnd(end);
		List<RecruitDto> list = cApplyService.myCurrentRecList(param);
		
		//int recCount = cApplyService.myCurrentRecCount(param);
		
		//System.out.println("?>???????????????????? : " + recCount);
		
		
		model.addAttribute("comCurrentRecList", list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", 8);	//한페이지에 보일 게시물 수
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		return "c_apply/cApplyMain";
	}
	
	
	@RequestMapping(value = "cApplyList.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String cApplyList(Model model, HttpSession session, int jobSeq, CApplyDto dto) {
		
		int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq(); 
		dto.setComSeq(c_seq);
		System.out.println("seq : " + c_seq);
		
		List<CApplyDto> list = cApplyService.getCApplyList(jobSeq);
		
		for(int i = 0; i < list.size(); i++) {
			System.out.println(i +" : " + list.get(i));
		}
		
		
		
		model.addAttribute("cApplyList", list);
		
		
		return "c_apply/cApplyList";
	}
	
	
	
	
	
	// 이력서 열람 버튼 Ajax file인지 아닌지 판별
	@ResponseBody
	@RequestMapping(value = "apResumeOpen.do", method = { RequestMethod.POST })
	public Map<String, Object> apResumeOpen(int cvSeq, HttpSession session) {
		//System.out.println("memSeq : " + memSeq );
		
		// 열람 확인 DB 저장
		boolean b = cApplyService.resumeOpenConfirm(cvSeq);
		System.out.println("열람 확인 DB 저장 : " + b);
		ResumeFileDto dto = cApplyService.findResumeFile(cvSeq);
				
		
		// 시퀀스로 RESUME_FILE_AFTER 조회
		// 리턴이 null 이면 "cant find file"
		
		// null이 아니면 모든 내용 리턴
		
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("fileDto", dto);
		
		
		
		//CvRecruitDto apResumeDto = cApplyService.apResumeOpen(cvSeq);
		//System.out.println(apResumeDto.toString());
		System.out.println("왜 안되니 : " + map);
		return map;
		
	}
	
	
	@RequestMapping(value = "openResumeDetail.do",  method = { RequestMethod.POST, RequestMethod.GET })
	public String openResumeDetail(int seq, Model model) {
		
		System.out.println("openResume : " + seq);
		
		/* RESUME_AFTER 이력서 가져오기 */
		ResumeAfterDto dto = cApplyService.getResumeAfter(seq);
		System.out.println("★openResumeDetail : " +dto.toString());
		
		int rsmseq = dto.getSeq();
		/* CAREER_AFTER 경력 가져오기 */
		List<CareerDto> careerList = cApplyService.getCareerAfter(rsmseq);
				
		/* EDUCATION_AFTER 학력 가져오기 */
		List<EducationDto> educationList = cApplyService.getEducationAfter(rsmseq);
		
		/* AWARDSETC_AFTER 수상 및 기타 가져오기 */
		List<AwardsEtcDto> awardsList = cApplyService.getAwardsAfter(rsmseq);
		
		/* LANGUAGE_AFTER 외국어 가져오기 */
		List<LanguageDto> languageList = cApplyService.getLanguageAfter(rsmseq);
		
		/* LINK_AFTER 링크 가져오기 */
		List<LinkDto> linkList = cApplyService.getLinkAfter(rsmseq);
		
		
		model.addAttribute("dto", dto);
		model.addAttribute("careerList", careerList);
		model.addAttribute("educationList", educationList);
		model.addAttribute("awardsList", awardsList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("linkList", linkList);
		
		return "c_apply/openResumeDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "cApply_myRecDetail.do")
	public String recDetail(int seq, Model model,HttpSession session,FavoriteDto favDto) {
		
		System.out.println("seq :::: " + seq);
		RecruitDto dto = serv.getRecruitDetail(seq);
		System.out.println("myRec: "+dto.toString());
		

		favDto.setLikePickSeq(seq);
		// 해당 공고물 좋아요 total count 
		int likeTotal = searchServ.likeRecTotal(favDto);
		model.addAttribute("likeTotal", likeTotal);
		
		//hashtag 빼오기
		//System.out.println("해쉬태그 : "+ dto.getHashTag());
		String hashs = dto.getHashTag().replace("\"", " ");
		//System.out.println("hashs : "+ hashs);
		int firstBrackets = hashs.indexOf("[");
		int lastBrackets = hashs.indexOf("]");
		String[] hashStr = hashs.substring(firstBrackets+1,lastBrackets).split(",");
		/*
		 * for (int i = 0; i < hashStr.length; i++) {
		 * System.out.println(i+"번째 hashStr : "+ hashStr[i]); }
		 */
		
		//첨부한 파일 넘기기
		List<FilesDto> fileslist = serv.getRecFile(seq);
		/*
		System.out.println("detail file count : "+fileslist.size());
		for (int i = 0; i < fileslist.size(); i++) {
			System.out.println("이미지 : "+ fileslist.get(i).getNewname());			
		}/**/
		CMemberDto cmemdto = serv.getComInfo(dto.getComSeq());
		
		//주소 제대로 들어오면 지우기
		cmemdto.setAddress("서울 강남구 테헤란로5길 11 YBM빌딩 2층");
		
		model.addAttribute("recDto", dto);
		model.addAttribute("cmem",cmemdto);
		//model.addAttribute("comAddr", comAddr);
		model.addAttribute("filesList", fileslist);
		model.addAttribute("hashTag",hashStr);
		
		model.addAttribute("location", "cApply");
		
		return "recruit/myRecDetail";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "resumeDownLoad.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String resumeDownLoad(String filename, HttpServletRequest request, Model model) {
			// download 경로
			// tomcat
			String fupload = request.getServletContext().getRealPath("/upload/resume");
			System.out.println("Download filename: " + filename);
			File downloadFile = new File(fupload + "/" + filename);
			
			model.addAttribute("downloadFile", downloadFile);
			
			return "downloadView";	// 파일만 다운로드
		
	}
	
	
	
	
	
	
	
	
	// 파일 다운로드
	@RequestMapping("/filedownload.do")
	public void FileDownload (HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	      
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  response.setContentType("text/html; charset=utf-8");
	      System.out.println("file download connected");
	      
	      // file 이름 및 경로 받아오기 
	      String filename = request.getParameter("filename"); 	// ex ) filename.jpg
	      String filepath = request.getParameter("filepath");	// ex ) /upload/amypage/
	      
	      System.out.println("download serv filepath :"+filepath);
	      System.out.println("download serv filename :"+filename);

	      
	      String uploadRoot = request.getSession().getServletContext().getRealPath(filepath);
	      System.out.println("uploadRoot:"+uploadRoot);

	      File f = new File(uploadRoot + filename);

	      response.setHeader("Content-Type", "image/jpg");

	      // 파일을 읽고 사용자에게 전송
	      FileInputStream fis;
		try {
			fis = new FileInputStream(f);
			BufferedInputStream bis = new BufferedInputStream(fis);
			OutputStream out = response.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(out);
			
			while (true) {
				int ch = bis.read();
				if (ch == -1)
					break;
				bos.write(ch);
			}
			
			bis.close();
			fis.close();
			bos.close();
			out.close();
			
			
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			System.out.println("filedownload error:" + e.getMessage());
		}
	
	}
	
	
}
