package pickme.com.a.c_mypage.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

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
import model.CMemberDto;
import model.FilesDto;
import model.PaymentDto;
import model.PremierMemDto;
import model.PremierServiceDto;
import pickme.com.a.c_mypage.service.CMypageService;
import pickme.com.a.util.FUpUtil;

@Controller
@RequestMapping(value = "/c_mypage")
public class CMypageController {

	@Autowired
	CMypageService service;
	
	// 주소 불러오기========================================================================
	@RequestMapping(value = "showAddress.do", method = {RequestMethod.GET, RequestMethod.POST})
	public CMemberDto loadAddress(CMemberDto dto, Model model) {
		CMemberDto address = service.showAddress(dto);
		model.addAttribute("address", address);
		System.out.println(address.toString());
		return address;
	}
	
	// 연락처 불러오기========================================================================
	@RequestMapping(value = "showTel.do", method = {RequestMethod.GET, RequestMethod.POST})
	public CMemberDto showTel(CMemberDto dto, Model model) {
		CMemberDto tel = service.showTel(dto);
		model.addAttribute("tel", tel);
		System.out.println(tel.toString());
		return tel;
	}
	
	
	// 기업 마이페이지 이동========================================================================
	@RequestMapping(value = "goCMypage.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goCMyPage(Model model, HttpSession session, String sentSeq ) {
		
		// 데이터 불러오는 시퀀스 
		int seq = 0;
		
		// 기업로그인 상태일때 
		if( session.getAttribute("logincompany") != null ) {
			
			// 기업로그인시 기업 마이페이지로 이동하기  
			// 기업 고유 시퀀스 
			seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
		}else{
			// 채용공고페이지 기업정보  클릭했을 때 이동하기 

			seq = Integer.parseInt(sentSeq);
		}
		
		
		CMemberDto cMember = service.select(seq);
		model.addAttribute("cMember", cMember);
		
		int comSeq = cMember.getSeq();
		
		//첨부한 파일 넘기기
		List<FilesDto> fileslist = service.getImages(comSeq);
		
		model.addAttribute("fileslist", fileslist);
		
		String address = cMember.getAddress().replace("\'", " ");
		int findBracket =  address.indexOf("]");
		cMember.setAddress(address.substring(findBracket+1));
		System.out.println("바뀐 주소 : "+cMember.getAddress());
		
		//System.out.println(" >>>>>>>>>>>>>> " + cMember.getAddress().length());
		
		//주소 따옴표 제거하기
//		if(cMember.getAddress() != null) {
//			if(cMember.getAddress().length() > 5) {
//			System.out.println("getAddress true");
//			String addressDto = cMember.getAddress();
//			String[] realAddress = addressDto.split("'");
//					
//			model.addAttribute("realAddress[0]", realAddress[0]);		// 우편번호
//			model.addAttribute("realAddress[1]", realAddress[1]);		// 기본주소
//			model.addAttribute("realAddress[2]", realAddress[2]);		// 상세주소
//			};
//		};
		return "c_mypage/myPage1";
	}
	
	
	// 채용탐색 > 채용 공고 > 기업디테일========================================================================
	@RequestMapping(value = "companyDetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String companyDetail(Model model, HttpSession session, int seq) {

		CMemberDto cMember = service.select(seq);
		model.addAttribute("cMember", cMember);
		
		//System.out.println(" >>>>>>>>>>>>>> " + cMember.getAddress().length());
		
		//주소 따옴표 제거하기
		if(cMember.getAddress() != null) {
			if(cMember.getAddress().length() > 5) {
			System.out.println("getAddress true");
			String addressDto = cMember.getAddress();
			String[] realAddress = addressDto.split("'");
					
			model.addAttribute("realAddress[0]", realAddress[0]);		// 우편번호
			model.addAttribute("realAddress[1]", realAddress[1]);		// 기본주소
			model.addAttribute("realAddress[2]", realAddress[2]);		// 상세주소
			};
		};
		return "c_mypage/myPage1";
	}
	
	// 기업 비밀번호 변경 페이지 이동========================================================================
	@RequestMapping(value = "goPasswordUpdate.do", method = {RequestMethod.GET})
	public String goPasswordUpdate() {
		
		return "c_mypage/passwordUpdate";
	}
	
	// 기업 수정페이지 이동========================================================================
	@RequestMapping(value = "goUpdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goUpdate(CMemberDto dto, Model model, HttpSession session) {
			
		CMemberDto company = (CMemberDto)session.getAttribute("logincompany");
		
		int seq = company.getSeq();
		
		CMemberDto dtoo = service.select(seq);
		model.addAttribute("dto", dtoo);
		System.out.println("수정페이지 열릴 때 해시태그 = " + dtoo.getHashTag());
		System.out.println("수정페이지 열릴 때 주소 = " + dtoo.getAddress());
		
		//첨부한 파일 넘기기
		List<FilesDto> fileslist = service.getImages(seq);
		System.out.println("이미지 리스트 = " + fileslist.toString());
		
		model.addAttribute("fileslist", fileslist);
		
		// 등록된 주소가 있을 경우 spilt하여 전송
		if(dtoo.getAddress() != null) {
			if(dtoo.getAddress().length() > 5) {
			String addressDto = dtoo.getAddress();
			String[] addressArr = addressDto.split("'");
			
			model.addAttribute("addressArr", addressArr);
			String arr1 = addressArr[0];
			String arr2 = addressArr[1];
			String arr3 = addressArr[2];
			
			// 우편번호에서 괄호 [ ] 제거하기
			String realArr1 = arr1.replace("[", "");
			String realArr2 = realArr1.replace("]", "");
			
			System.out.println("우편번호 = " + realArr2);
			System.out.println("기본주소 = " + arr2);
			System.out.println("상세주소 = " + arr3);
			
			model.addAttribute("realArr2", realArr2);	// 우편번호
			model.addAttribute("arr2", arr2);			// 기본주소
			model.addAttribute("arr3", arr3);			// 상세주소
			};
		};
		return "c_mypage/update";
	}
	
	// 기업회원 탈퇴페이지 이동========================================================================
	@RequestMapping(value = "goWithdrawal.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goWithdrawal(CMemberDto dto) {
		
		service.goWithdrawal(dto);
		
		return "c_mypage/withdrawal";
	}
	
	// 결제내역 이동=================================================================================
	@RequestMapping(value = "goPayment.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String goPayment(PaymentDto dto, Model model, HttpSession session) throws ParseException {
		
		// 기업 세션 seq 저장
        int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
        dto.setBuyerId(c_seq);
        
        System.out.println("결제페이지 이동 dto = " + dto.toString());
        
		// 결제 내역 담은 dto list 가져오기
		List<PaymentDto> list = service.showPaymentDto(dto);
		System.out.println("결제페이지 이동 list = " + list);
		System.out.println("결제페이지 이동 list size = " + list.size());
		
		// 현재 진행중인 서비스가 있는지 확인
		PaymentDto recentDto = service.recentService(dto);
		System.out.println("기업이 현재 이용중인 서비스 내역 = " + recentDto);
		
		if( recentDto!=null ) {
			// 현재시간
			Date nowDate = new Date();	// java.util.date
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
			Date now = nowDate;
			Date end = sdf.parse(recentDto.getEndDate());
			
			// 결제내역 항목들
			if(list.size() != 0 && now.before(end)) {	// 결제 이력이 있고, 현재 서비스 이용중인 경우
				
				String serviceName = recentDto.getServiceName();
				String payDate = recentDto.getPayDate();
				String endDate = recentDto.getEndDate();
				model.addAttribute("serviceName", serviceName);
				model.addAttribute("payDate", payDate);
				model.addAttribute("endDate", endDate);

			}
		}
		
		model.addAttribute("list", list);
		model.addAttribute("recentDto", recentDto);
		
		return "c_mypage/payment";
	}
	
	// 기업 이미지 삭제========================================================================
    @RequestMapping(value="imageDelete.do", method= {RequestMethod.POST})
    public String imageDelete(CMemberDto dto, Model model, MultipartFile[] originfile, HttpServletRequest request, HttpSession session) {
    	// (ref) 그룹번호 불러오기
    	int ref = (int)((CMemberDto)session.getAttribute("logincompany")).getSeq();
    	System.out.println("그룹번호 ref = " + ref);
    	
    	service.deleteImage(ref);
    	
    	// 첨부파일용 파일 테이블에 저장할 리스트 만들기
		boolean result = true;
		System.out.println("number of files = " + originfile.length);
		List<FilesDto> list = new ArrayList<>();
		
		//새로운 첨부파일이 있는지 확인
				if(originfile.length > 0) {	
					//List<FilesDto> list = new ArrayList<>();
					for( int i = 0; i < originfile.length; i++ ) {
						// 파일 새이름 등록 
						String originName = originfile[i].getOriginalFilename();
						if( !originName.equals("") ) {
						System.out.println("오리지날 이름: "+originName);
						String newname = FUpUtil.getNewFileName(originName);
						String path = "/upload/recruit/";
						String type = originfile[i].getContentType();
						FilesDto filesDto = new FilesDto(originName, newname, ref, i, type);
						
						// 리스트에 담기 
						list.add(filesDto);
						
						System.out.println("list["+i+"] : " + list.get(i));
						
						// 경로 및 파일이름 지정
						String uploadPath = request.getSession().getServletContext().getRealPath(path);
						File uploadFile = new File(uploadPath + "/" + newname);
						System.out.println("upload = " + uploadFile.toString());
						
						// 서버에 파일 업로드하기
						try {
							// 실제 파일을 지정 폴더에 업로드 함 
							FileUtils.writeByteArrayToFile(uploadFile, originfile[i].getBytes());
						} catch (IOException e) {
							e.getMessage();
							return "redirect:/c_mypage/goUpdate.do";
						}
					} else break;
				}
			}
				
		    result = service.uploadImage(list);
		    service.imageNameUpdate(ref);
		    CMemberDto c = (CMemberDto)session.getAttribute("logincompany");
		    request.setAttribute("seq", c.getSeq());
		    
		    return result ? "forward:/c_mypage/goCMypage.do":"";
    	}
	
	
	// 기업 이미지 업로드========================================================================
	@RequestMapping(value="uploadImage.do", method = {RequestMethod.POST})
	public String uploadImage(CMemberDto dto, Model model, HttpSession session, MultipartFile[] originfile, HttpServletRequest request) {
		// (ref) 그룹번호 불러오기
				int ref = (int)((CMemberDto)session.getAttribute("logincompany")).getSeq();
				System.out.println("그룹번호 ref = " + ref);
				
				// 첨부파일용 파일 테이블에 저장할 리스트 만들기
				boolean result = true;
				System.out.println("number of files = " + originfile.length);
				
				if(originfile.length > 0) {	// 첨부파일이 있을 경우
					List<FilesDto> list = new ArrayList<>();
					for( int i = 0; i < originfile.length; i++ ) {
						// 파일 새 이름 등록
						String originName = originfile[i].getOriginalFilename();
						if ( !originName.equals("") ) {
							System.out.println("오리지날 이름 = " + originName);
							String newname = FUpUtil.getNewFileName(originName);
							String path = "/upload/c_mypage";
							String type = originfile[i].getContentType();
							FilesDto filesDto = new FilesDto(originName, newname, ref, i , type);
							
							// 리스트에 담기
							list.add(filesDto);
							
							System.out.println("list["+i+"] = " + list.get(i));
							
							// 경로 및 파일이름 지정
							String uploadPath = request.getSession().getServletContext().getRealPath(path);
							File uploadFile = new File(uploadPath + "/" + newname);
							System.out.println("upload = " + uploadFile.toString());
							
							// 서버에 파일 업로드하기
							try {
								// 실제 파일을 지정 폴더에 업로드 함 
								FileUtils.writeByteArrayToFile(uploadFile, originfile[i].getBytes());
							} catch (IOException e) {
								e.getMessage();
								return "redirect:/c_mypage/goUpdate.do";
							}
						} else break;
					}
					
					// 파일 DB에 넣기
					result = service.uploadImage(list);
					
					// newname 으로 바꾸기
					service.imageNameUpdate(ref);
				}
				CMemberDto c = (CMemberDto)session.getAttribute("logincompany");
				request.setAttribute("seq", c.getSeq());
				
				return result ? "forward:/c_mypage/goCMypage.do":"";
	}
	
	
	// 기업 정보 수정 ========================================================================
	@ResponseBody
	@RequestMapping(value = "update.do", method = {RequestMethod.POST})
	public String update(CMemberDto dto, Model model, HttpSession session, String hashTag, MultipartFile file, HttpServletRequest request) throws Exception {
		
		System.out.println("file>>>>>>>>>>>>>>>>>>>>>>>>> : " + file);
		System.out.println("dto to String : " + dto.toString());
		
		// 기업 세션 seq 저장
        int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();

		
		
		
		// 저장 경로 불러오기 
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/c_mypage");
		
		System.out.println("AMemberDto dto : " + dto.toString());
		
		if(file != null ) {	// 파일이 있는 경우
			// 파일이름 설정
			String fileExtension = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));
			System.out.println("파일확장자 - "+fileExtension);			
			
			// 바꿀이름
			String newFilename = c_seq + fileExtension;
			System.out.println("NEW FILE NAME - " + newFilename);
			
			// 파일 실제로 업로드 하는부분
			File uploadFile = new File(uploadPath + "/" + newFilename);
			
			dto.setLogoName(newFilename);
			
			
			try {
				// 실제 파일을 지정 폴더에 업로드 함 
				FileUtils.writeByteArrayToFile(uploadFile, file.getBytes());
				System.out.println("실제 파일을 지정 폴더에 업로드 완료");
				
			} catch (IOException e) {
				e.getMessage();
				return null;
			}
			
		}
		
		System.out.println("DB에 들어갈 해쉬태그 : " + hashTag);
		System.out.println("DB : " + dto.getHashTag());
		
		service.update(dto);
		
		System.out.println("수정된 기업정보 dto = " + dto.toString());
		System.out.println("수정된 해시태그 = " + dto.getHashTag());
		
		return "redirect:/c_mypage/goCMypage.do";
	}
	
	
	
	
	
	// 결제 디테일 이동========================================================================
	@RequestMapping(value="paymentDetail.do", method = {RequestMethod.GET})
	public String paymentDetail(int seq, Model model, HttpSession session) {
		System.out.println(seq);
		model.addAttribute("seq", seq);

		int memSeq = ((CMemberDto) session.getAttribute("logincompany")).getSeq();
		// 유료서비스 데이터 가져오기
		PremierServiceDto premierDTO = service.showPremere(seq);
		CMemberDto cMemberDto = service.getCmemberDto(memSeq);
		
		model.addAttribute("premierDTO", premierDTO);
		model.addAttribute("memberDto", cMemberDto);
		
		return "c_mypage/paymentDetail";
	}
	
    // 결제 성공 후 DB저장========================================================================
    @RequestMapping(value = "setPaymentInfo.do", method = {RequestMethod.GET, RequestMethod.POST})
    public String setPaymentInfo(PaymentDto dto, int serviceSeq, HttpSession session) {
      
    	System.out.println(dto);
    	System.out.println(serviceSeq);

     	 // 기업 세션 seq 저장
         int c_seq = ((CMemberDto)session.getAttribute("logincompany")).getSeq();
         dto.setBuyerId(c_seq);
         
         // 유료회원 dto 생성
         PremierMemDto member = new PremierMemDto(0, c_seq, serviceSeq, null, dto.getServiceName(), null, null, dto.getImpUid(), 0);
         System.out.println(member);
         
         // payment 테이블에 데이터 저장 
         int n = service.setPaymentInfo(dto);
         System.out.println("insert result count : " + n);

         // premiere_mem 테이블에 데이터 저장
         int m = service.insertPremierMem(member);
         System.out.println(m);
         
         
         // redirect로 보내야 데이터 가지고 화면으로 이동함 
         // 그냥 페이지로 이동했더니 결제 데이터 2번 올라감
         return "redirect:/c_mypage/goPayment.do";
    }

	
    // 환불하기 페이지 이동========================================================================
    @RequestMapping(value="refundPage.do")
    public String refundPage( Model model, int seq ) {
    	System.out.println(seq);
    	PaymentDto payService = service.getRefundableService(seq);
    	model.addAttribute("payService", payService);
    	
    	return "c_mypage/refundRequest";
    }
    
    
    
    // 기업로고 보여주기========================================================================
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






