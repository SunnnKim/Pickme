package pickme.com.a.admin.controller;

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

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.FilesDto;
import model.NoticeDto;
import pickme.com.a.admin.service.NoticeService;
import pickme.com.a.util.FUpUtil;

@Controller
@RequestMapping("/admin/notice")
public class NoticeController {

	@Autowired
	NoticeService service;
	
	// 공지사항 목록보기 
	@RequestMapping(value ="noticeList.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String noticeList(Model model) {
		List<NoticeDto> list = service.getAllNotice();
		model.addAttribute("list", list);
		return "admin/notice/noticeList";
	}
	
	// 공지사항 등록
	@RequestMapping(value ="noticeWrite.do", method= {RequestMethod.POST,RequestMethod.GET})
	public String noticeWrite(Model model) {
		
		return "admin/notice/noticeWrite";
	}
	
	// 공지사항 텍스트 에디터에 이미지 넣어서 파일로 변환하는 부분
	@ResponseBody
	@RequestMapping(value="noticeContentImg.do", method=RequestMethod.POST)
	public Map<String, String> noticeContentImg( MultipartFile file, HttpServletRequest request ) {
		// 저장 경로 불러오기 
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/temp");
		
		// 파일이름 설정
		String originalName = file.getOriginalFilename();
		// 바꿀이름
		String newFilename = FUpUtil.getNewFileName(originalName);
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
		Map<String, String> map = new HashMap<>();
		map.put("filename", newFilename);
		map.put("filepath", "/upload/temp/");
		return map;
	}
	
	// 텍스트 에디터창에 이미지 불러오기 (다운로드)
	@RequestMapping(value="imgDownload.do", method= {RequestMethod.GET,RequestMethod.POST})
	public void imgDownload( String filename, String filepath,
			HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			// 인코딩 설정 
			request.setCharacterEncoding("utf-8");
			response.setCharacterEncoding("utf-8");
			response.setContentType("text/html; charset=utf-8");
			
			// 파일이름 및 경로 확인 
			System.out.println("file download connected");
			System.out.println("download serv filepath :"+filepath);
			System.out.println("download serv filename :"+filename);
	      
			// 불러올 파일 루트 확인
			String uploadRoot = request.getSession().getServletContext().getRealPath(filepath);
			System.out.println("uploadRoot:"+uploadRoot);
			
			// 전송할 파일 객체 준비  
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
	
	// 텍스트에디터 사진 업로드하기
	@ResponseBody
	@RequestMapping(value="editorImageUpload.do",method=RequestMethod.POST )
	public String editorImageUpload(  MultipartFile[] file, String filename, HttpServletRequest request ) {
		// 저장 경로 불러오기 
		String tempPath = request.getSession().getServletContext().getRealPath("/upload/temp");
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/notice");
		
		
		System.out.println("여기는 다운로드하는부분 ");
		System.out.println("filename : " +filename);
		
		
		// 파일 실제로 업로드 하부분
		for( int i = 0; i < file.length; i++ ) {
			// 파일이름 설정
			String newFilename = filename.split(",")[i];
			File uploadFile = new File(uploadPath + "/" + newFilename);
			try {
				// 실제 파일을 지정 폴더에 업로드 함 
				FileUtils.writeByteArrayToFile(uploadFile, file[i].getBytes());
			} catch (IOException e) {
				e.getMessage();
				return "fail";
			}
			File tempFile = new File(tempPath + "/" + newFilename);
			if(tempFile.exists()) {
				if( !tempFile.isDirectory() ) {
					tempFile.delete();
				}
			}
		}
		
		return "success";
	}
	
	// 공지사항 글 등록하기 
	@RequestMapping(value="insertNotice.do", method=RequestMethod.POST)
	public String insertNotice( MultipartFile [] noticeFile, NoticeDto noticeDto,  HttpServletRequest request) {
		// 공지사항 등록 후 ref(그룹번호) 불러오기  
		if(noticeFile.length > 0) noticeDto.setFiles(1);
		int ref = service.insertNotice(noticeDto);
		
		// 첨부파일용 파일 테이블에 저장할 리스트 만들기 
		boolean result = true;
		System.out.println("num of files : " + noticeFile.length);
		if(noticeFile.length > 0) {	// 첨부파일이 있을 경우 
			List<FilesDto> list = new ArrayList<>();
			for( int i = 0; i < noticeFile.length; i++ ) {
				// 파일 새이름 등록 
				String originName = noticeFile[i].getOriginalFilename();
				String newname = FUpUtil.getNewFileName(originName);
				String path = "/upload/notice";
				String type = noticeFile[i].getContentType();
				FilesDto dto = new FilesDto( 0, null, originName, newname, path, 0, ref, i, type );
				
				// 리스트에 담기 
				list.add(dto);
				System.out.println("list["+i+"] : " + list.get(i));
				// 경로 및 파일이름 지정  
				String uploadPath = request.getSession().getServletContext().getRealPath(path);
				File uploadFile = new File(uploadPath + "/" + newname);
				
				// 서버에 파일 업로드하기 
				try {
					// 실제 파일을 지정 폴더에 업로드 함 
					FileUtils.writeByteArrayToFile(uploadFile, noticeFile[i].getBytes());
				} catch (IOException e) {
					e.getMessage();
					return "redirect:/admin/notice/noticeWrite.do";
				}
			}	
			// 파일 디비에 넣기
			result = service.insertFiles(list);
		}
		return result ? "redirect:/admin/notice/noticeList.do":"redirect:/admin/notice/noticeWrite.do";
	}
	
}
