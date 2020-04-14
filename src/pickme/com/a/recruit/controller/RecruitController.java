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
	public String recNow(Integer seq, Model model, HttpServletRequest req) {
		
		if( seq == null ) {
			 seq = (Integer)req.getAttribute("seq"); 
		}
		/* seq = (Integer)req.getAttribute("seq"); */
		List<RecruitDto> list = serv.myCurrentRecList(seq);
		
		model.addAttribute("comCurrentRecList", list);
		return "recruit/recNow";
	}
	@RequestMapping(value = "recPast.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String recPast() {
		return "recruit/recPast";
	}

	
	@ResponseBody
	@RequestMapping(value = "recInsertAf.do",method = RequestMethod.POST)
	public int recInsertAf(RecruitDto dto) {
		System.out.println(dto.toString());
		int count = serv.insertRecruit(dto);
	
		System.out.println("insert success : " + count);
		  		  
		return count;
	}/**/
	
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
	
	
}
