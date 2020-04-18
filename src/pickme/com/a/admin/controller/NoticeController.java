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
import org.springframework.web.bind.annotation.RequestParam;
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
		if( !noticeFile[0].getOriginalFilename().equals("") && noticeFile[0] != null ) noticeDto.setFiles(noticeFile.length);
		else noticeDto.setFiles(0);
		System.out.println("file 개수 : " + noticeDto.getFiles());
		int ref = service.insertNotice(noticeDto);
		
		// 첨부파일용 파일 테이블에 저장할 리스트 만들기 
		boolean result = true;
		if( !noticeFile[0].getOriginalFilename().equals("") && noticeFile[0] != null ) {	// 첨부파일이 있을 경우 
			System.out.println("Notice files upload...");
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
	
	// 공지사항 수정 페이지
	@RequestMapping(value="updateNoticeView.do",method=RequestMethod.GET)
	public String updateNoticeView(int seq, Model model) {
		System.out.println("seq : "  + seq);
		NoticeDto detail = service.getNoticeDetail(seq);
		List<FilesDto> files = service.getNoticeFiles(seq);
		
		model.addAttribute("detail", detail);
		model.addAttribute("files", files);
		System.out.println("size : " + files.size());
		return "admin/notice/noticeUpdate";
	}
	
	// 공지사항 업로드 전 기존 파일 삭제하기
	@ResponseBody
	@RequestMapping(value="noticeFileDelete.do",method=RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String noticeFileDelete( @RequestParam(value="filenames[]")  List<String> filenames,
										HttpServletRequest request,
										 @RequestParam(value="seq")  int seq ) {
		System.out.println("seq : " + seq);
		String filepath = request.getServletContext().getRealPath("/upload/notice/");
		for( String filename : filenames ) {
			File deleteFile = new File(filepath, filename);
			if(deleteFile.exists()) {
				System.out.println("지우기 풀기 ");
				if(!deleteFile.delete()) {
					System.out.println(deleteFile.getName());
					return "fail";
				}
			}
		}
		// 파일 디비도 삭제함
		service.deleteNoticeFiles(seq);
		
		return "success";
	}
	
	// 공지사항 수정하기
	@RequestMapping(value="updateNotice.do", method=RequestMethod.POST)
	public String updateNotice( MultipartFile [] noticeFile, NoticeDto noticeDto,  HttpServletRequest request) {
		
		// 만약 파일 있으면 파일수 바꾸기 
		if( !noticeFile[0].getOriginalFilename().equals("") && noticeFile[0] != null ) noticeDto.setFiles(noticeFile.length);
		System.out.println("noticeDto:" + noticeDto);

		// 공지사항 수정  
		boolean result = service.updateNotice(noticeDto);
		
		// 첨부파일용 파일 테이블에 저장할 리스트 만들기 
		if( !noticeFile[0].getOriginalFilename().equals("") && noticeFile[0] != null ) {	// 첨부파일이 있을 경우 
			System.out.println("Notice files upload...");
			List<FilesDto> list = new ArrayList<>();
			for( int i = 0; i < noticeFile.length; i++ ) {
				// 파일 새이름 등록 
				String originName = noticeFile[i].getOriginalFilename();
				String newname = FUpUtil.getNewFileName(originName);
				String path = "/upload/notice";
				String type = noticeFile[i].getContentType();
				FilesDto dto = new FilesDto( 0, null, originName, newname, path, 0, noticeDto.getSeq(), i, type );
				
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
			// 파일목록을 디비에 넣기
			result = service.insertFiles(list);
		}
		return result ? "redirect:/admin/notice/noticeList.do":"redirect:/admin/notice/noticeWrite.do";
	}
	
	// 공지사항 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteNoticeList.do", method=RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String deleteNoticeList(@RequestParam(value="seqList[]")  List<Integer> seqList) {
		
		boolean success = service.deleteNotice(seqList);
		
		
		return success + "";
	}
	
	
	
	
	
	
	
}
