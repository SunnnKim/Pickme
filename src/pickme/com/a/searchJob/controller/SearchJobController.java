
package pickme.com.a.searchJob.controller;

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
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import model.ResumeDto;
import pickme.com.a.searchJob.service.SearchJobService;

@Controller
@RequestMapping(value = "/searchJob")
public class SearchJobController {
	@Autowired
	SearchJobService serv;


	@RequestMapping(value = "recSearch.do")
	public String recSearch(Model model, RecruitParam param) {
		//1차 직군 선택시
		System.out.println("occ : "+ param.getOcc());
		model.addAttribute("occ", param.getOcc());
			
		//2차 직무 선택
		System.out.println("job : "+ param.getJob());
		model.addAttribute("job", param.getJob());
		
		//필터 - sorting(최신순, 인기순)
		System.out.println("sorting : " + param.getSorting());
		model.addAttribute("sorting", param.getSorting());
		
		//경력 정렬
		System.out.println("comJobType : "+param.getComJobType());
		model.addAttribute("comJobType",param.getComJobType());

		//검색
		System.out.println("sKeyword : " + param.getsKeyword());
		model.addAttribute("sKeyword", param.getsKeyword());
		
	
		
		//마감날짜가 지나면 del update
		//serv.dayUpdateDel();
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		//System.out.println("현재 페이지 : "+ nowPage);
		//채용 탐색에서 채용중인 총 게시글 수
		int totalRecCount = serv.getCountRec(param);
		
		param.setStart(start);
		param.setEnd(end);
		
		List<RecruitDto> list = serv.getRecAllList(param);
		System.out.println("recSearch List Size : "+list.size());
		model.addAttribute("recList",list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());	//한페이지에 보일 게시물 수
		model.addAttribute("totalRecCount", totalRecCount); 
		
		

		return "searchJob/recSearch";
	}
	
	
	@RequestMapping(value = "recDetail.do")
	public String recDetail(int seq, Model model,HttpSession session) {
		
		//조회수 업데이트
		serv.readCountUp(seq);
		
		RecruitDto dto = serv.getRecruitDetail(seq);
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
		List<FilesDto> fileslist = serv.getRecFile(seq);
		/*
		System.out.println("detail file count : "+fileslist.size());
		for (int i = 0; i < fileslist.size(); i++) {
			System.out.println("이미지 : "+ fileslist.get(i).getNewname());			
		}/**/
		CMemberDto cmemdto = serv.getAddr(dto.getComSeq());
		
		//주소 제대로 들어오면 지우기
		cmemdto.setAddress("서울 강남구 테헤란로5길 11 YBM빌딩 2층");
		
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
	public Object getMyResume(String memberSeq, HttpSession session) {
		AMemberDto loginuser = (AMemberDto) session.getAttribute("loginuser");
		if(loginuser == null) {
			return "fail";
		}
		int seq = loginuser.getSeq();
		System.out.println("memberseq: " + seq);
		
		// 리스트에 담기 
		List<ResumeDto> myResumes = serv.getMyResumes(seq);
		
		// 리턴값 : map 으로 담아 프론트에 보내기  
        Map<String, Object> retVal = new HashMap<String, Object>();
        retVal.put("myResumes", myResumes);

        return retVal;
	}
	
	@ResponseBody
	@RequestMapping(value="insertResume.do",method=RequestMethod.POST)
	public String insertResume( @RequestParam(required = false) MultipartFile file, ResumeDto resume) {
		// 파일인경우 
		if(file != null ) {
			System.out.println(file.getOriginalFilename());
		}
		//  파일이 아닌 경우 
		else {
			System.out.println(resume);
			// 지원서 전체 불러오기 
			
		}
		
		return "success";
	}
}
