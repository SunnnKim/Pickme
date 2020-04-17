package pickme.com.a.recruit.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.mysql.cj.Session;

import model.CMemberDto;
import model.FilesDto;
import model.RecruitDto;
import model.RecruitParam;
import pickme.com.a.recruit.service.RecruitService;
import pickme.com.a.util.FUpUtil;

@Controller
@RequestMapping(value = "/recruit")
public class RecruitController {
	
	@Autowired
	RecruitService serv;
	
	
	@RequestMapping(value = "recInsert.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String recInsert(Model model) {
		int ref = serv.getRef();
		model.addAttribute("ref",ref);
		return "recruit/recInsert";
	}
	
	@RequestMapping(value = "recNow.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String recNow(Integer seq, RecruitParam param, Model model, HttpServletRequest req) {
		
		if( seq == null ) {
			 seq = (Integer)req.getAttribute("seq"); 
		}
		param.setComSeq(seq);
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		//System.out.println("현재 페이지 : "+ nowPage);
		//채용 탐색에서 채용중인 총 게시글 수
		int totalRecCount = serv.getComRecCount(seq);
		
		param.setStart(start);
		param.setEnd(end);
		List<RecruitDto> list = serv.myCurrentRecList(param);
		
		model.addAttribute("comCurrentRecList", list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());	//한페이지에 보일 게시물 수
		model.addAttribute("totalRecCount", totalRecCount); 
		return "recruit/recNow";
	}
	
	@RequestMapping(value = "recPast.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String recPast(Integer seq,RecruitParam param, Model model, HttpServletRequest req) {

		if( seq == null ) {
			 seq = (Integer)req.getAttribute("seq"); 
		}
		param.setComSeq(seq);
		int nowPage = param.getPageNumber(); // 현재페이지넘버
		int start = nowPage * param.getRecordCountPerPage(); // 1, 11, 21
		int end = (nowPage + 1) * param.getRecordCountPerPage(); // 10, 20, 30
		
		//System.out.println("현재 페이지 : "+ nowPage);
		//채용 탐색에서 채용중인 총 게시글 수
		int totalRecCount = serv.getComPastCount(seq);
		
		param.setStart(start);
		param.setEnd(end);
		List<RecruitDto> list = serv.myPastRecList(param);
		model.addAttribute("comPastRecList", list);
		model.addAttribute("pageNumber", nowPage);	//현재페이지
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());	//한페이지에 보일 게시물 수
		model.addAttribute("totalRecCount", totalRecCount); 

		return "recruit/recPast";
	}

	
	@ResponseBody
	@RequestMapping(value = "recInsertAf.do",method = RequestMethod.POST)
	public int recInsertAf(RecruitDto dto) {
		System.out.println(dto.toString());
		int count = serv.insertRecruit(dto);
	
		System.out.println("insert success : " + count);
		  		  
		return count;
	}
	
	@RequestMapping(value = "recfileup.do",method = RequestMethod.POST)
	public String recFileUp(RecruitDto recdto,MultipartFile [] originfile,HttpServletRequest req, HttpSession session) {
		// ref(그룹번호) 불러오기  
		int ref = serv.getLastSeq();
		
		// 첨부파일용 파일 테이블에 저장할 리스트 만들기 
		boolean result = true;
		System.out.println("num of files : " + originfile.length);
		
		if(originfile.length > 0) {	// 첨부파일이 있을 경우 
			List<FilesDto> list = new ArrayList<>();
			for( int i = 0; i < originfile.length; i++ ) {
				// 파일 새이름 등록 
				String originName = originfile[i].getOriginalFilename();
				if( !originName.equals("") ) {
				System.out.println("오리지날 이름: "+originName);
				String newname = FUpUtil.getNewFileName(originName);
				String path = "/upload/recruit/";
				String type = originfile[i].getContentType();
				FilesDto dto = new FilesDto(originName, newname, ref, i, type);
				
				// 리스트에 담기 
				list.add(dto);
				
				System.out.println("list["+i+"] : " + list.get(i));
			
				// 경로 및 파일이름 지정  
				String uploadPath = req.getSession().getServletContext().getRealPath(path);
				File uploadFile = new File(uploadPath + "/" + newname);
				System.out.println("upload : "+ uploadFile.toString());
				// 서버에 파일 업로드하기 
				try {
					// 실제 파일을 지정 폴더에 업로드 함 
					FileUtils.writeByteArrayToFile(uploadFile, originfile[i].getBytes());
				} catch (IOException e) {
					e.getMessage();
					return "redirect:/recruit/recInsert.do";
				}
					
				} else break;
			
			}//.for
			// 파일 디비에 넣기
			result = serv.insertRecFile(list);
			// recruit 테이블 imagename newname으로 바꾸기
			serv.updateImgName(ref);
			
		}
		CMemberDto cmem = (CMemberDto) session.getAttribute("logincompany");
		req.setAttribute("seq", cmem.getSeq());

		return result ? "forward:/recruit/recNow.do":"redirect:/recruit/recInsert.do";
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
