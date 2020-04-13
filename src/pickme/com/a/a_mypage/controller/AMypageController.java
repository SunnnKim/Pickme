package pickme.com.a.a_mypage.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.AMemberDto;
import pickme.com.a.a_mypage.service.AMypageService;
import pickme.com.a.login.service.LoginService;
import pickme.com.a.util.FUpUtil;

@Controller
@RequestMapping(value = "/a_mypage")
public class AMypageController {
	
	@Autowired
	AMypageService service;
	
	@Autowired
	LoginService loginService;
	
	// 프로필
	@RequestMapping(value = "profile.do")
	public String profileView() {
		return "a_mypage/profile";
	}
	
	// 프로필 수정
	@ResponseBody
	@RequestMapping(value = "profileUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String profileUpdate( Model model, HttpSession session, MultipartFile file, HttpServletRequest request ) {
		// 저장 경로 불러오기 
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/amember");
		
		if(file != null ) {	// 파일이 있는 경우
			// 파일이름 설정
			String originname = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println(originname);
			// 바꿀이름
			String newFilename = "email@naver" + originname;
			System.out.println(newFilename);
			
			// 파일 실제로 업로드 하부분
			File uploadFile = new File(uploadPath + "/" + newFilename);
			
			try {
				// 실제 파일을 지정 폴더에 업로드 함 
				FileUtils.writeByteArrayToFile(uploadFile, file.getBytes());
				
			} catch (IOException e) {
				e.getMessage();
				return null;
			}
			
		}
		boolean success = true;
		
		//여기에 입력
		//= service.profileUpdate(dto);
		//
		
		
		// 파일 디비 작성
		// 세션은 일단.....미지의세계로
		
//		AMemberDto loginuser = loginService.updateSession(dto.getEmail());
//		session.setAttribute("loginuser", loginuser);
		return success + "";
		
	}
	
	// 파일 뿌리기
	@RequestMapping(value="imageDownload.do")
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
