
package pickme.com.a.searchJob.controller;

import java.io.BufferedInputStream;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import pickme.com.a.searchJob.service.SearchJobService;

@Controller
@RequestMapping(value = "/searchJob")
public class SearchJobController {
	@Autowired
	SearchJobService serv;
	

	@RequestMapping(value = "recSearch.do")
	public String recSearch(Model model, RecruitParam param) {
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		System.out.println("현재 페이지 : "+ nowPage);
		//채용 탐색에서 채용중인 총 게시글 수
		int totalRecCount = serv.getCountRec();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<RecruitDto> list = serv.getRecAllList();
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
		RecruitDto dto = serv.getRecruitDetail(seq);
		System.out.println("detail dto : "+ dto.toString());
		
		
		List<FilesDto> fileslist = serv.getRecFile(seq);
		System.out.println("detail file count : "+fileslist.size());
		String comAddr = serv.getAddr(dto.getComSeq());
		comAddr = "서울 강남구 테헤란로5길 11 YBM빌딩 2층";
		model.addAttribute("recDto", dto);
		model.addAttribute("comAddr", comAddr);
		model.addAttribute("filesList", fileslist);
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
}
