
package pickme.com.a.searchJob.controller;

import java.io.BufferedInputStream;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.AMemberDto;
import model.AwardsEtcDto;
import model.CApplyDto;
import model.CMemberDto;
import model.CareerDto;
import model.EducationDto;
import model.FavoriteDto;
import model.FilesDto;
import model.LanguageDto;
import model.LinkDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeAfterDto;
import model.ResumeDto;
import model.ResumeFileDto;
import pickme.com.a.recruit.service.RecruitService;
import pickme.com.a.searchJob.service.SearchJobService;
import pickme.com.a.util.FUpUtil;

@Controller
@RequestMapping(value = "/searchJob")
public class SearchJobController {
	@Autowired
	SearchJobService searchServ;
	
	@Autowired
	RecruitService recServ;
	

	@RequestMapping(value = "recSearch.do")
	public String recSearch(Model model, RecruitParam param) {
		//1차 직군 선택시
		//System.out.println("occ : "+ param.getOcc());
		model.addAttribute("occ", param.getOcc());
			
		//2차 직무 선택
		//System.out.println("job : "+ param.getJob());
		model.addAttribute("job", param.getJob());
		
		//필터 - sorting(최신순, 인기순)
		//System.out.println("sorting : " + param.getSorting());
		model.addAttribute("sorting", param.getSorting());
		
		//경력 정렬
		//System.out.println("comJobType : "+param.getComJobType());
		model.addAttribute("comJobType",param.getComJobType());
	
		//검색
		//System.out.println("sKeyword : " + param.getsKeyword());
		model.addAttribute("sKeyword", param.getsKeyword());
		
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		//System.out.println("현재 페이지 : "+ nowPage);
		//채용 탐색에서 채용중인 총 게시글 수
		int totalRecCount = searchServ.getCountRec(param);
		
		param.setStart(start);
		param.setEnd(end);
		
		List<RecruitDto> list = searchServ.getRecAllList(param);
		System.out.println("recSearch List Size : "+list.size());
		model.addAttribute("recList",list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());	//한페이지에 보일 게시물 수
		model.addAttribute("totalRecCount", totalRecCount); 
		
		

		return "searchJob/recSearch";
	}
	
	@ResponseBody
	@RequestMapping(value = "recLike.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String recLike(FavoriteDto favDto,HttpSession session,Model model) {
		AMemberDto dto = (AMemberDto) session.getAttribute("loginuser");
		
		if(dto == null || dto.getEmail().equals("")) {
			return "fail";	
		} 
		
		favDto.setEmail(dto.getEmail());
		System.out.println("LIKE DO : "+ favDto.toString());
		int chk = searchServ.likeCountByMem(favDto);
		System.out.println("CHK : "+chk);
		//좋아요 수 
		int likeTotal=searchServ.likeRecTotal(favDto);
		model.addAttribute("likeTotal",likeTotal);
		if (chk==0) {
			//좋아요 가능
			searchServ.likePlus(favDto);
			return "plus";
		} else {
			//좋아요 빼기
			searchServ.likeDel(favDto);
			return "del";
		}
		
	
	}
	
	@RequestMapping(value = "recDetail.do")
	public String recDetail(int seq, Model model,HttpSession session, FavoriteDto favDto) {
		
		//조회수 업데이트
		searchServ.readCountUp(seq);
		
		favDto.setLikePickSeq(seq);
		// 해당 공고물 좋아요 total count 
		int likeTotal = searchServ.likeRecTotal(favDto);
		model.addAttribute("likeTotal", likeTotal);
		
		int chk=-1;
	    AMemberDto adto = (AMemberDto) session.getAttribute("loginuser");
	    if(adto == null || adto.getEmail().equals("")) {
	    	chk = searchServ.likeCountByMem(favDto);
		} else if ( adto != null || !adto.getEmail().equals("")) {
			favDto.setEmail(adto.getEmail());
			chk = searchServ.likeCountByMem(favDto);
	    }
	    model.addAttribute("chk",chk);
		
		
		RecruitDto dto = recServ.getRecruitDetail(seq);
		//System.out.println("detail dto : "+ dto.toString());
		
		//hashtag 빼오기
		System.out.println("해쉬태그 : "+ dto.getHashTag());
		String hashs = dto.getHashTag().replace("\"", " ");
		System.out.println("hashs : "+ hashs);
		int firstBrackets = hashs.indexOf("[");
		int lastBrackets = hashs.indexOf("]");
		String[] hashStr = hashs.substring(firstBrackets+1,lastBrackets).split(",");
		for (int i = 0; i < hashStr.length; i++) {
			System.out.println(i+"번째 hashStr : "+ hashStr[i]);
		}
		
		//첨부한 파일 넘기기
		List<FilesDto> fileslist = recServ.getRecFile(seq);
		/*
		System.out.println("detail file count : "+fileslist.size());
		for (int i = 0; i < fileslist.size(); i++) {
			System.out.println("이미지 : "+ fileslist.get(i).getNewname());			
		}/**/
		CMemberDto cmemdto = recServ.getComInfo(dto.getComSeq());
		
		String address = cmemdto.getAddress().replace("\'", " ");
		int findBracket =  address.indexOf("]");
		//address.substring(findBracket);
		cmemdto.setAddress(address.substring(findBracket+1));
		System.out.println("바뀐 주소 : "+cmemdto.getAddress());
		
		model.addAttribute("recDto", dto);
		model.addAttribute("cmem",cmemdto);
		//model.addAttribute("comAddr", comAddr);
		model.addAttribute("filesList", fileslist);
		model.addAttribute("hashTag",hashStr);
		return "searchJob/recDetail";
	}
	
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
	
	
	
	// @@@@@ 이력서 지원하기 @@@@@@ 
	// 나의 이력서 불러오기 
	@ResponseBody
	@RequestMapping(value="getMyResume.do", method=RequestMethod.POST)
	public Object getMyResume(String jobseq, HttpSession session) {
		AMemberDto loginuser = (AMemberDto) session.getAttribute("loginuser");
		if(loginuser == null) {
			return "fail";
		}
		int seq = loginuser.getSeq();
		System.out.println("memberseq: " + seq);
		// 지원내역이 있을 경우
		int jobSeq = Integer.parseInt(jobseq);
		ResumeAfterDto dto = new ResumeAfterDto(0, seq, jobSeq, 0, null, null, null, 0, 0, 0);
		int count = searchServ.checkIfApply(dto);
		if(count > 0 ) {
			return "alreadyApply";
		}
		
		// 리스트에 담기 
		List<ResumeDto> myResumes = searchServ.getMyResumes(seq);
		
		
		
		// 리턴값 : map 으로 담아 프론트에 보내기  
        Map<String, Object> retVal = new HashMap<String, Object>();
        retVal.put("myResumes", myResumes);

        return retVal;
	}
	
	// 지원하기 
	@ResponseBody
	@RequestMapping(value="insertResume.do",method=RequestMethod.POST)
	public boolean insertResume( @RequestParam(required = false) MultipartFile file, ResumeAfterDto resume, String comName,
									HttpServletRequest request) {
		
		// 파일인경우 
		if(file != null ) {
			
			System.out.println( resume );

			// 파일 저장
			// 저장 경로 불러오기 
			String uploadPath = request.getSession().getServletContext().getRealPath("/upload/resume");
			// 파일이름 설정
			String originalName = file.getOriginalFilename();
			// 바꿀이름
			String newFilename = FUpUtil.getNewFileName(originalName);
			// 파일 실제로 업로드 하부분
			File uploadFile = new File(uploadPath + "/" + newFilename);
			
			try {
				// 실제 파일을 지정 폴더에 업로드 함 
				FileUtils.writeByteArrayToFile(uploadFile, file.getBytes());
			} catch (IOException e) {
				e.getMessage();
				return false;
			}
			// 데이터베이스 지원이력서 저장
			ResumeAfterDto insertResume = new ResumeAfterDto(0, resume.getMemSeq(), resume.getJobSeq(), resume.getComSeq(), originalName, resume.getUserName(), null, 0, 0, 0);
			int rsmseq = recServ.insertResume(insertResume);

			// apply 테이블에 데이터 집어넣기
			CApplyDto dto = new CApplyDto( 0, 
										 insertResume.getJobSeq(), 
										 insertResume.getComSeq(),
										 comName,
										 insertResume.getMemSeq(),
										 null, 0, 0, 
										 rsmseq, 0, 
										 null, null, null);
			int a = recServ.insertApply(dto);
			
			// 데이터베이스에 파일저장내역 저장 
			ResumeFileDto resumeFile = new ResumeFileDto(0, rsmseq, originalName, newFilename, "/upload/resume");
			int number = recServ.insertResumeFile(resumeFile);
			
			return number > 0 ? true:false;
			
		}
		//  등록한 이력서인 경우 
		else {
			System.out.println("******************************여기는 컨트롤러 ");
			System.out.println(resume);
			// 이력서 서브 테이블들 
			boolean careerCheck = true;
			boolean educationCheck = true;
			boolean awardCheck = true;
			boolean languageCheck = true;
			boolean linkCheck = true;
			
			int rsmSeq = resume.getSeq();	// 지원서에 넣은 인덱스 
			//ResumeAfterDto insertResume = new ResumeAfterDto(seq, memSeq, jobSeq, comSeq, name, userName, wDate, whose, del, open)
			
			// 지원서 전체 불러오기 
			ResumeAfterDto selectResume = recServ.getSelectedResume(rsmSeq);
			System.out.println("selectResume : " + selectResume);
			// 지원서 디비에 넣기 
			// 데이터베이스 지원이력서 저장
			ResumeAfterDto insertResume = new ResumeAfterDto(0, selectResume.getMemSeq(), 
																	resume.getJobSeq(),
																	resume.getComSeq(),
																	selectResume.getName(), 
																	selectResume.getUserName(), 
																	selectResume.getPhone(), 
																	selectResume.getEmail(), 
																	selectResume.getIntroduce(), 
																	null, 0, 0, 0, 0, 0);
			// DB에 지원데이터 넣고 rsmseq 꺼내오기 
			int rsmseq = recServ.insertResume(insertResume);
			
			// apply 테이블에 데이터 집어넣기
			CApplyDto dto = new CApplyDto( 0, 
										 insertResume.getJobSeq(), 
										 insertResume.getComSeq(),
										 comName,
										 insertResume.getMemSeq(),
										 null, 0, 0, 
										 rsmseq, 0, 
										 null, null, null);
			int a = recServ.insertApply(dto);
			ResumeFileDto fileDto = recServ.getResumeFile(rsmSeq);
			// 등록된 지원서가 파일인 경우 
			if( fileDto != null ) {
				System.out.println("지원서가 파일인경우 ");
				// 데이터 베이스에서 파일저장내역 불러오기 
				fileDto.setRsmSeq(rsmseq);
				// 데이터베이스에 파일저장내역 저장 
				
				//ResumeFileDto resumeFile = new ResumeFileDto(0, rsmseq,resume.getName(), newFilename, "/upload/resume");
				//new ResumeFileDto(seq, rsmseq, originalName, storedName, filePath)
				int number = recServ.insertResumeFile(fileDto);
			}
			// 그냥 이력서인경우 
			else {
				System.out.println("지원서가 그냥 이력서인경우 ");
				
				// 경력불러오기 
				List<CareerDto> careerList = recServ.getSelectedResumeCareer(rsmSeq);
				// 경력 rsmseq 바꾸기 
				for( CareerDto c : careerList ) c.setRsmseq(rsmseq);
				// 테이블에 집어넣기
				if( careerList.size() > 0 ) careerCheck = recServ.insertCareerAfter(careerList);
				if( !careerCheck ) return false;
				
				// 학력사항불러오기 + 집어넣기
				List<EducationDto> eduList = recServ.getSelectedResumeEducation(rsmSeq);
				// 경력 rsmseq 바꾸기 
				for( EducationDto c : eduList ) c.setRsmseq(rsmseq);
				// 테이블에 집어넣기
				if( eduList.size() > 0 ) educationCheck = recServ.insertEducationAfter(eduList);
				if( !educationCheck ) return false;
	
				// 수상 및 기타 불러오기  + 집어넣기
				List<AwardsEtcDto> awardsList = recServ.getSelectedResumeAwards(rsmSeq);
				// 경력 rsmseq 바꾸기 
				for( AwardsEtcDto c : awardsList ) c.setRsmseq(rsmseq);
				// 테이블에 집어넣기
				if( awardsList.size() > 0 ) awardCheck = recServ.insertAwardsAfter(awardsList);
				if( !awardCheck ) return false;
				
				// 어학 불러오기 + 집어넣기
				List<LanguageDto> langList = recServ.getSelectedResumeLanguage(rsmSeq);
				// 경력 rsmseq 바꾸기 
				for( LanguageDto c : langList ) c.setRsmseq(rsmseq);
				// 테이블에 집어넣기
				if( langList.size() > 0 ) languageCheck = recServ.insertLanguageAfter(langList);
				if( !languageCheck ) return false;
				
				// 링크 불러오기 + 집어넣기
				List<LinkDto> linkList = recServ.getSelectedResumeLink(rsmSeq);
				// 경력 rsmseq 바꾸기 
				for( LinkDto c : linkList ) c.setRsmseq(rsmseq);
				// 테이블에 집어넣기
				if( linkList.size() > 0 ) linkCheck = recServ.insertLinkAfter(linkList);
				if( !linkCheck ) return false;
			}
		
		
		}
		
		
		return true;
	}
}
