package pickme.com.a.resume.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.ibatis.javassist.expr.NewArray;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.AMemberDto;
import model.AwardsEtcDto;
import model.CareerDto;
import model.EducationDto;
import model.LanguageDto;
import model.LinkDto;
import model.ResumeDto;
import model.ResumeFileDto;
import model.ResumeParam;
import pickme.com.a.a_mypage.service.AMypageService;
import pickme.com.a.resume.service.ResumeService;

@Controller
@RequestMapping(value="/resume")
public class ResumeController {
	
	@Autowired
	AMypageService aMypageService;
	
	@Autowired
	ResumeService service;
	
	// 이력서 관리 페이지 이동 paging
	@RequestMapping(value = "resume.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String resumeView(Model model, ResumeParam param,  HttpSession session) {		
		
		int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		param.setMemSeq(memSeq);
		
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("현재 페이지 : "+ nowPage);
		
		param.setStart(start);
		param.setEnd(end);
		
		// 이력서 count
		int totalRecCount = service.ResumeCount(param);
		System.out.println("이력서 count:" + totalRecCount);
		
		List<ResumeDto> list = service.ResumeAllList(param);
		System.out.println("Resume List Size : " + list.size());
		model.addAttribute("resumeList",list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage()); // 한 페이지에 보일 게시물 수
		model.addAttribute("totalRecCount", totalRecCount);
		return "resume/resume";
	}
	
	
	/*
	// 이력서 관리 페이지 이동 
	@RequestMapping(value = "resume.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String resumeView(Model model, ResumeDto dto, HttpSession session) {		
		System.out.println("ResumeController resume.do 도착");
		
		int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		
		
		dto.setMemSeq(memSeq);		
		
		List<ResumeDto> list = service.ResumeAllList02(dto);
		System.out.println("Resume List Size : " + list.size());
		model.addAttribute("resumeList",list);
		model.addAttribute("aMemberDto", aMypageService.profileSelect(memSeq));
		

		return "resume/resume";
	}
	*/
	
	// 이력서 파일 첨부
	@ResponseBody
	@RequestMapping(value = "resumeFileUpload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String profileUpdate(@ModelAttribute ResumeDto resumeDto, Model model, HttpSession session, MultipartFile file, HttpServletRequest request ) {
		
		System.out.println("ResumeController resumeFileUpload.do 도착");
		
		// 이력서 마지막 시퀀스 번호 +1
		int rsmSeq = service.resumeGetSeq();		
		
		
		// 저장 경로 불러오기 
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/resume/");		
		System.out.println("uploadPath 저장 경로 ____ : " + uploadPath);
		
		if(file != null ) {	// 파일이 있는 경우
			// 파일 원래 이름
			String originalName = file.getOriginalFilename();
			
			// 파일이름 설정
			String fileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println("파일확장자 - "+fileExtension);			
			
			// 바꿀이름
			UUID uuid = UUID.randomUUID();
			String storedName = uuid.toString() + fileExtension;
			System.out.println("NEW FILE NAME - " + storedName);
			
			// 파일 실제로 업로드 하는부분
			File uploadFile = new File(uploadPath + storedName);
			
			ResumeFileDto fileDto = new ResumeFileDto();
			
			fileDto.setRsmSeq(rsmSeq);
			fileDto.setOriginalName(originalName);
			fileDto.setStoredName(storedName);
			fileDto.setFilePath("/upload/resume");
			
			service.resumeFileInsert(fileDto);			
			
			resumeDto.setName(originalName);
			// 이력서 기본 정보 insert 
			service.resumeInsert(resumeDto);
			
			try {
				// 실제 파일을 지정 폴더에 업로드 함 
				FileUtils.writeByteArrayToFile(uploadFile, file.getBytes());
				System.out.println("실제 파일을 지정 폴더에 업로드 완료");
				
			} catch (IOException e) {
				e.getMessage();
				return null;
			}
			
		}
		

		return "true";
		
	}
	
	
	// 첨부 파일 다운로드
	@RequestMapping(value="download.do")
	 protected void imageDownload(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			   
		  request.setCharacterEncoding("utf-8");
		  response.setCharacterEncoding("utf-8");
		  response.setContentType("text/html; charset=utf-8");
	      System.out.println("file download connected");
	      
	      // file 이름 및 경로 받아오기 
	      String filename = request.getParameter("filename");
	      String filepath = request.getParameter("filepath");
	      
	      System.out.println("download serv filepath :"+filepath);
	      System.out.println("download serv filename :"+filename);

	      
	      String uploadRoot = request.getSession().getServletContext().getRealPath(filepath);
	      System.out.println("uploadRoot:"+uploadRoot);

	      File f = new File(uploadRoot + filename);
	      
	      

	      // response.setHeader("Content-Type", "image/jpg");
	      response.setHeader("Content-Type", "application/octet-stream");
	      

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
		
	
	// 파일 다운로드 할 때 필요한 dto
	@ResponseBody
	@RequestMapping(value = "resumeFileSelect.do", method = {RequestMethod.GET, RequestMethod.POST})
	public ResumeFileDto resumeFileSelect(Integer seq, Model model) {		
		System.out.println("ResumeController resumeFileSelect.do 도착");
		
		System.out.println("seq " + seq);
		
		ResumeFileDto fileDto = service.resumeFileSelect(seq);
		
		System.out.println(fileDto.toString());
		
		//model.addAttribute("fileDto", fileDto);

		return fileDto;		
		
	}
	
	// 이력서 관리 이력서명 변경
	@ResponseBody
	@RequestMapping(value = "ResumeNameUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int ResumeNameUpdate(ResumeDto dto, Model model) {		
		System.out.println("ResumeController ResumeNameUpdate.do 도착");
		
		int rs = service.ResumeNameUpdate(dto);	
		
		model.addAttribute("rs", rs);
		System.out.println("rs : " + rs);
		
		return rs;		
		
	}
	
	
	// 이력서 관리 메인 이력서 변경
	@ResponseBody
	@RequestMapping(value = "MainResumeUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int MainResumeUpdate(Integer memSeq, Integer seq, Model model) {		
		System.out.println("ResumeController MainResumeUpdate.do 도착");

		System.out.println("메인이력서 memSeq" + memSeq);
		System.out.println("메인이력서" + seq);
		
		int reset = service.MainResumeReset(memSeq);			
		int update = service.MainResumeUpdate(seq);	
		
		//model.addAttribute("reset", reset);
		//System.out.println("reset : " + reset);
		
		//model.addAttribute("update", update);
		System.out.println("update : " + update);
		
		return update;
		
		
	}
	

	// 이력서 삭제
	@ResponseBody
	@RequestMapping(value = "ResumeDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int MainResumeUpdate(Integer seq, Model model, HttpSession session) {		
		System.out.println("ResumeController ResumeDelete.do 도착");	
		
		int rs = service.ResumeDelete(seq);	
		
		int rsmseq = seq;
		service.careerDeleteAll(rsmseq);
		service.educationDeleteAll(rsmseq);
		service.awardsEtcDeleteAll(rsmseq);
		service.languageDeleteAll(rsmseq);
		service.linkDeleteAll(rsmseq);

		service.fileDelete(seq);
		
		model.addAttribute("rs", rs);
		System.out.println("rs : " + rs);
		
		return rs;		
		
	}
	
	
	// 이력서 detail 
	@RequestMapping(value = "resumeView.do", method = {RequestMethod.GET, RequestMethod.POST})
		public String resumeView(int seq, Model model, HttpSession session) {		
			
		System.out.println("ResumeController resumeView.do 도착");
		
		int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		System.out.println("resumeView 이력서 시퀀스: " + seq);
		System.out.println("resumeView 유저 시퀀스: " + memSeq);
		
		// 이력서 기본 정보 
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("seq", seq);
		map.put("memSeq", memSeq);
		System.out.println("resumeView Map: " + map.values() );

		ResumeDto resumeDto = service.ResumeDetail(map);
		System.out.println(resumeDto.toString());
		model.addAttribute("resumeDto", resumeDto);	
		
		// ------- 이력서 경력  detail ---------------
		System.out.println("이력서 경럭 detail");
		int rsmseq = seq;
		System.out.println("rsmseq +++++++" + rsmseq);
		
		List<CareerDto> careerList = service.CareerDetail(rsmseq);
		List<EducationDto> educationList = service.educationDetail(rsmseq);
		List<AwardsEtcDto> awardsEtcList = service.AwardsEtcDetail(rsmseq);
		List<LanguageDto> languageList = service.LanguageDetail(rsmseq);
		List<LinkDto> linkList = service.LinkDetail(rsmseq);
		
		model.addAttribute("careerList", careerList);
		model.addAttribute("educationList", educationList);
		model.addAttribute("awardsEtcList", awardsEtcList);
		model.addAttribute("languageList", languageList);
		model.addAttribute("linkList", linkList);		

		return "resume/resumeView";
		
	}
	
	// 경력 삭제
	@ResponseBody
	@RequestMapping(value = "careerDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerDelete(Integer seq) {		
		System.out.println("ResumeController careerDelete.do 도착");			
		int rs = service.careerDelete(seq);			
		System.out.println("rs : " + rs);		
		
		return rs;				
	}
	
	// 학력 삭제
	@ResponseBody
	@RequestMapping(value = "educationDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int educationDelete(Integer seq) {		
		System.out.println("ResumeController educationDelete.do 도착");			
		int rs = service.educationDelete(seq);			
		System.out.println("rs : " + rs);		
		
		return rs;				
	}
	
	// 수상 및 기타 삭제
	@ResponseBody
	@RequestMapping(value = "awardsEtcDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int awardsEtcDelete(Integer seq) {		
		System.out.println("ResumeController awardsEtcDelete.do 도착");			
		int rs = service.awardsEtcDelete(seq);			
		System.out.println("rs : " + rs);		
		
		return rs;				
	}
	
	// 외국어 삭제
	@ResponseBody
	@RequestMapping(value = "languageDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int languageDelete(Integer seq) {		
		System.out.println("languageDelete careerDelete.do 도착");			
		int rs = service.languageDelete(seq);			
		System.out.println("rs : " + rs);		
		
		return rs;				
	}
	
	// 경력 삭제
	@ResponseBody
	@RequestMapping(value = "linkDelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int linkDelete(Integer seq) {		
		System.out.println("ResumeController linkDelete.do 도착");			
		int rs = service.linkDelete(seq);			
		System.out.println("rs : " + rs);		
		
		return rs;				
	}
	
	//	이력서 기본 정보 update
	@ResponseBody
	@RequestMapping(value = "ResumeUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int ResumeUpdate(ResumeDto dto) {		
		System.out.println("ResumeController ResumeUpdate.do 도착");
		
		int rs = service.resumeUpdate(dto);

		System.out.println("rs : " + rs);
		
		return rs;		
		
	}
	
	// 경력 update 
	@ResponseBody
	@RequestMapping(value = "careerUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerUpdate(String str_rsmseq, @RequestBody Map<String, Object> careerUpdate, Model model) {		
		System.out.println("ResumeController careerUpdate.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : careerUpdate.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);
		System.out.println("zzzzzzzzzzzzzzzz rsmseq " + rsmseq);

		CareerDto dto = new CareerDto();
		
		service.careerDeleteAll(rsmseq);
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);

			dto.setRsmseq(rsmseq); 	  				  // 이력서 시퀀스
			dto.setCompany(list.get("company"));	  // 회사명
			dto.setPosition(list.get("position"));	  // 부서명/직책
			dto.setStartdate(list.get("startdate"));  // 입사 날짜
			dto.setEnddate(list.get("enddate")); 	  // 퇴사 날짜
			dto.setIng(list.get("ing")); 			  // 현재 재직중 (0 퇴사, 1 재직중)

			service.careerUpdate(dto);	
			
		}	
		
		return 1;			
		
	}
	
	// 학력 update 
	@ResponseBody
	@RequestMapping(value = "educationUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int educationUpdate(String str_rsmseq, @RequestBody Map<String, Object> educationUpdate, Model model) {		
		System.out.println("ResumeController educationUpdate.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : educationUpdate.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		EducationDto dto = new EducationDto();
		
		service.educationDeleteAll(rsmseq);
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setSchool(list.get("school"));	  
			dto.setMajor(list.get("major"));	  	
			dto.setStudy(list.get("study"));
			dto.setStartdate(list.get("startdate")); 
			dto.setEnddate(list.get("enddate")); 	 
			dto.setIng(list.get("ing")); 			
			
			service.educationUpdate(dto);
			
			//System.out.println("EducationDto dto : " + dto.toString());			
			
		}	
		
		return 1;			
		
	}	
		
	// 수상 및 기타 update 
	@ResponseBody
	@RequestMapping(value = "AwardsEtcUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int AwardsEtcUpdate(String str_rsmseq, @RequestBody Map<String, Object> AwardsEtcUpdate, Model model) {		
		System.out.println("ResumeController AwardsEtcUpdate.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : AwardsEtcUpdate.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		AwardsEtcDto dto = new AwardsEtcDto();
		
		service.awardsEtcDeleteAll(rsmseq);
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setAwards(list.get("awards"));	  
			dto.setDetail(list.get("detail"));	  	
			dto.setDate(list.get("date"));			
			
			service.AwardsEtcUpdate(dto);	
			
			//System.out.println("AwardsEtcDto dto : " + dto.toString());			
			
		}	
		
		return 1;			
		
		
	}
	
	// 외국어 update 
	@ResponseBody
	@RequestMapping(value = "LanguageUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int LanguageUpdate(String str_rsmseq, @RequestBody Map<String, Object> LanguageUpdate, Model model) {		
		System.out.println("ResumeController LanguageUpdate.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : LanguageUpdate.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		LanguageDto dto = new LanguageDto();
		
		service.languageDeleteAll(rsmseq);
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setLang(list.get("lang"));	
			dto.setLevel(list.get("level"));	
			dto.setTest(list.get("test"));	
			dto.setScore(list.get("score"));	  	
			dto.setDate(list.get("date"));			
			
			service.LanguageUpdate(dto);	
			
			//System.out.println("LanguageDto dto : " + dto.toString());			
			
		}	
		
		return 1;				
		
	}
	
	// 링크 update 
	@ResponseBody
	@RequestMapping(value = "LinkUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int LinkUpdate(String str_rsmseq, @RequestBody Map<String, Object> LinkUpdate, Model model) {		
		System.out.println("ResumeController LinkUpdate.do 도착");
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : LinkUpdate.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		LinkDto dto = new LinkDto();
		
		service.linkDeleteAll(rsmseq);
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setUrl(list.get("url"));	

			service.LinkUpdate(dto);	
			
			//System.out.println("LinkDto dto : " + dto.toString());			
			
		}	
		
		return 1;		
		
		
	}
	
	
	// 이력서 작성 페이지 이동
	@RequestMapping(value = "resumeWrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String resumeWriteView(Model model, HttpSession session) {		

		int memSeq = ((AMemberDto)session.getAttribute("loginuser")).getSeq(); 
		model.addAttribute("memdto", aMypageService.profileSelect(memSeq));
		
		int resumeSeq = service.resumeGetSeq();
		System.out.println("resumeSeq" + resumeSeq);
		
		model.addAttribute("resumeSeq", resumeSeq);

		return "resume/resumeWrite";
		
	}
	

	// 이력서 작성 insert 
	@ResponseBody
	@RequestMapping(value = "resumeInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int resumeInsert(ResumeDto dto, Model model) {		
		System.out.println("ResumeController resumeInsert.do 도착");
		
		
		System.out.println("ResumeDto dto : " + dto.toString());

		int a = service.resumeInsert(dto);	
		
		model.addAttribute("a", a);
		System.out.println("a : " + a);
		
		return a;
		
		
	}
	
	// 경력 insert 
	@ResponseBody
	@RequestMapping(value = "careerInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int careerInsert(String str_rsmseq, @RequestBody Map<String, Object> careerObject, Model model) {		
		System.out.println("ResumeController careerInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		//int rsmseq = Integer.parseInt(strRsmseq);
		System.out.println("###################### rsmseq" + strRsmseq);
		
		
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		System.out.println(careerObject);
		System.out.println(careerObject.get("career"));
		System.out.println(careerObject.get("rsmseq"));
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : careerObject.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			System.out.println("key : "+key);
			System.out.println(value);
			jsonObject.put(key, value);
			w++;
		}
		System.out.println("@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);
		System.out.println("rsmseq : " +rsmseq);
		System.out.println(a);
		System.out.println(a.get(0));

		
		LinkedHashMap<String, String> careerMap = (LinkedHashMap<String, String>) a.get(0); 
		System.out.println("startdate : " + careerMap.get("startdate"));
		System.out.println("enddate : " + careerMap.get("enddate"));
		System.out.println("company  : " + careerMap.get("company"));
		System.out.println("position: " + careerMap.get("position"));
		System.out.println("ing : " + careerMap.get("ing"));

		System.out.println(((LinkedHashMap<String, Object>)a.get(0)).get("startdate"));
		CareerDto dto = new CareerDto();
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  // 이력서 시퀀스
			dto.setCompany(list.get("company"));	  // 회사명
			dto.setPosition(list.get("position"));	  // 부서명/직책
			dto.setStartdate(list.get("startdate"));  // 입사 날짜
			dto.setEnddate(list.get("enddate")); 	  // 퇴사 날짜
			dto.setIng(list.get("ing")); 			  // 현재 재직중 (0 퇴사, 1 재직중)
			
			service.careerInsert(dto);	
			
			System.out.println("CareerDto dto : " + dto.toString());			
			
		}	
		
		return 1;	
		
	}
	
	
	// 학력 insert 
	@ResponseBody
	@RequestMapping(value = "educationInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int educationInsert(String str_rsmseq, @RequestBody Map<String, Object> educationObject, Model model) {		
		System.out.println("ResumeController educationInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : educationObject.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		EducationDto dto = new EducationDto();
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setSchool(list.get("school"));	  
			dto.setMajor(list.get("major"));	  	
			dto.setStudy(list.get("study"));
			dto.setStartdate(list.get("startdate")); 
			dto.setEnddate(list.get("enddate")); 	 
			dto.setIng(list.get("ing")); 			
			
			service.educationInsert(dto);	
			
			System.out.println("EducationDto dto : " + dto.toString());			
			
		}	
		
		return 1;			
		
	}
	
	// 수상 및 기타 insert 
	@ResponseBody
	@RequestMapping(value = "AwardsEtcInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int AwardsEtcInsert(String str_rsmseq, @RequestBody Map<String, Object> awardsObject, Model model) {		
		System.out.println("ResumeController AwardsEtcInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : awardsObject.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		AwardsEtcDto dto = new AwardsEtcDto();
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setAwards(list.get("awards"));	  
			dto.setDetail(list.get("detail"));	  	
			dto.setDate(list.get("date"));			
			
			service.AwardsEtcInsert(dto);	
			
			System.out.println("AwardsEtcDto dto : " + dto.toString());			
			
		}	
		
		return 1;			
		
		
	}
	
	// 외국어 insert 
	@ResponseBody
	@RequestMapping(value = "LanguageInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int LanguageInsert(String str_rsmseq, @RequestBody Map<String, Object> langObject, Model model) {		
		System.out.println("ResumeController LanguageInsert.do 도착");
		
		String strRsmseq = str_rsmseq;
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : langObject.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		LanguageDto dto = new LanguageDto();
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setLang(list.get("lang"));	
			dto.setLevel(list.get("level"));	
			dto.setTest(list.get("test"));	
			dto.setScore(list.get("score"));	  	
			dto.setDate(list.get("date"));			
			
			service.LanguageInsert(dto);	
			
			System.out.println("LanguageDto dto : " + dto.toString());			
			
		}	
		
		return 1;		
		
		
	}
	
	// 링크 insert 
	@ResponseBody
	@RequestMapping(value = "LinkInsert.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int LinkInsert(String str_rsmseq, @RequestBody Map<String, Object> linkObject, Model model) {		
		System.out.println("ResumeController LinkInsert.do 도착");
		
		JSONObject jsonObject = new JSONObject();

		Object arr[] = new Object[2];
		int w = 0;
		for (Map.Entry<String, Object> entry : linkObject.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			arr[w] = value;
			jsonObject.put(key, value);
			w++;
		}

		ArrayList<Object> a = (ArrayList<Object>)arr[0];
		int rsmseq = Integer.parseInt((String) arr[1]);

		LinkDto dto = new LinkDto();
		
		for(int i = 0; i < a.size(); i++) {
			LinkedHashMap<String, String> list = (LinkedHashMap<String, String>)a.get(i);
			dto.setRsmseq(rsmseq); 	  				  
			dto.setUrl(list.get("url"));	

			service.LinkInsert(dto);	
			
			System.out.println("LinkDto dto : " + dto.toString());			
			
		}	
		
		return 1;		
		
		
	}
	
	
	
	
	
	
	
}
