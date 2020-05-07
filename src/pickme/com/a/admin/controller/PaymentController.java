package pickme.com.a.admin.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.codehaus.jackson.map.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import model.PaymentDto;
import model.PaymentParam;
import model.PremierMemDto;
import model.PremierServiceDto;
import pickme.com.a.admin.service.PaymentService;
import pickme.com.a.customer.service.CustomerService;
import pickme.com.a.util.FUpUtil;

@RequestMapping(value="/admin/payment")
@Controller
public class PaymentController {

	@Autowired
	PaymentService service;
	
	@Autowired
	CustomerService customerService;
	
	// 유료서비스 페이지이동
	@RequestMapping(value="paidServiceView.do")
	public String paidServiceView(Model model) {
		// 유료멤버 데이터 
		List<PremierMemDto> memberList = service.getPremierMember();
		// 유료서비스 데이터 
		List<PremierServiceDto> serviceList = service.getPremierService();
		// 가입회원 통계
		List<PaymentParam> memberCount = service.getStatistics();
		// 신규 이용고객 통계
		int newPremierMember = service.getNewPremierMember();
		// 신규 환불고객 통계
		int refundMember = service.getRefundNumber();
		
		model.addAttribute("memberList", memberList);
		model.addAttribute("serviceList", serviceList);
		model.addAttribute("memberCount", memberCount);
		model.addAttribute("newPremierMember", newPremierMember);
		model.addAttribute("refundMember", refundMember);
		
		return "admin/payment/paidService";
	}
	
	// 서비스등록 페이지 이동
	@RequestMapping(value="writePaidService.do")
	public String writePaidService() {
		
		return "admin/payment/writePaidService";
		
	}
	// 서비스 수정 페이지 이동
	@RequestMapping(value="updatePaidService.do")
	public String updatePaidService(Model model, int seq) {
		PremierServiceDto dto = customerService.getServiceDetail(seq);
		model.addAttribute("dto", dto);
		
		return "admin/payment/updatePaidService";
	}

	// 서비스 수정하기 
	@RequestMapping(value="updateService.do")
	public String updateService(Model model, PremierServiceDto dto) {
		System.out.println(dto);
		boolean success = service.updateService(dto);
		System.out.println(success);
		if(success) return "redirect:/admin/payment/paidServiceView.do";
		
		return "redirect:/admin/payment/paidServiceView.do?seq=" + dto.getServiceSeq();
		
	}

	
	// 결제 관리 페이지 이동
	@RequestMapping(value="managePayment.do")
	public String managePayment(Model model) {
		// 결제내역 가지고 가기 
		List<PaymentDto> paymentList = service.getAllPayments();
		// 환불내역 가지고 가기
		List<PaymentDto> refundList = service.getAllRefund();
		
		// model 로 보내기
		model.addAttribute("paymentList", paymentList);
		model.addAttribute("refundList", refundList);
		return "admin/payment/managePayment";
	}
	
	
	
	// 공지사항 텍스트 에디터에 이미지 넣어서 파일로 변환하는 부분
	@ResponseBody
	@RequestMapping(value="serviceContentImg.do", method=RequestMethod.POST)
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
		String uploadPath = request.getSession().getServletContext().getRealPath("/upload/paidService");
		System.out.println("file!!!!! : " + file.length);
		
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
	
	// 유료 서비스 등록하기
	@RequestMapping(value="insertPaidService.do", method=RequestMethod.POST)
	public String insertPaidService( PremierServiceDto serviceDto ) {
		System.out.println("serviceDto : " + serviceDto);
		// insert to Database
		boolean success = service.insertService(serviceDto);
		if(success) return "redirect:/admin/payment/paidServiceView.do";
		return "redirect:/admin/payment/writePaidService.do?fail=true";
	}
	
	// 유료 서비스 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteService.do", method=RequestMethod.POST)
	public String insertPaidService( @RequestParam(value="seqList[]")  List<Integer> seqList ) {
		boolean success = service.deleteService(seqList);
		return success + "";
	}
	
	// 환불하기 - 환불할 서비스있는지 조회
	@ResponseBody
	@RequestMapping(value="checkRefundable.do", method=RequestMethod.POST)
	public boolean getRefundableService(int seq) {
		PaymentDto check = service.getRefundableService(seq);
		if(check == null ) return false;
		return true;
	}
	
	// 환불한 내역 삭제하기
	@ResponseBody
	@RequestMapping(value="deleteRefund.do", method=RequestMethod.POST)
	public String deleteRefund( @RequestParam(value="seqList[]")  List<Integer> seqList ) {
		boolean success = service.deleteRefund(seqList);
		return success + "";
	}
	
	@ResponseBody
	@RequestMapping(value = "paymentCancel.do", method = RequestMethod.POST, produces = "application/String; charset=utf-8")
	public String paymentCancel( @RequestBody Map<String, Object> params) throws Exception {
		//1. method 파라미터에 데이터를 받을 것
		System.out.println(params.get("imp_uid"));
		System.out.println(params.get("cancel_request_amount"));
		System.out.println(params.get("reason"));
		
		String imp_uid = (String)params.get("imp_uid");
		String cancelAmount = (String)params.get("cancel_request_amount");
		String reason = (String)params.get("reason");
		
		BufferedReader br;
		BufferedReader br2;
		OutputStream os;
		
		StringBuilder sb = new StringBuilder();
		StringBuilder sb2 = new StringBuilder();
		// Token request API
		URL url = new URL("https://api.iamport.kr/users/getToken");
		URL refindUrl = new URL("https://api.iamport.kr/payments/cancel");
		
		// 요청할 파라미터의 정보를 입력한다.
		String body = "imp_key=2531774582223021&imp_secret=dRDLeTxwpUC8E4EvmWMFZZOb8FQwvEaJvNuKG1h6WUfAYT6lPS0PRP00uQw0vHJ1ueLbf2hbWwMVqTgg";
		
		try {
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
		    // Request Header 정의
			con.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
//		    con.setRequestProperty("Content-Type", "application/json; charset=UTF-8");
		    // 전송방식
		    con.setRequestMethod("POST");
		    // 서버에 연결되는 Timeout 시간 설정
		    con.setConnectTimeout(5000);
		    // InputStream 읽어 오는 Timeout 시간 설정
		    con.setReadTimeout(5000); 
		    // URLConnection에 대한 doOutput 필드값을 지정된 값으로 설정한다. 
		    // URL 연결은 입출력에 사용될 수 있다. 
		    // URL 연결을 출력용으로 사용하려는 경우 DoOutput 플래그를 true로 설정하고, 
		    // 그렇지 않은 경우는 false로 설정해야 한다. 기본값은 false이다.
		    con.setDoOutput(true); 

		    // 응답 데이터를 받아들임
		    con.setDoInput(true);

		    // 새로운 OutputStream에 요청할 OutputStream을 넣는다.
		    os = con.getOutputStream();

		    os.write( body.getBytes("UTF-8") );
		    
		    os.flush();
		    os.close();
		    
		    System.out.println("응답 코드: " + con.getResponseCode());
		    // 200 -> OK , 400 -> Bad Request, 401 -> Not Authorized
		    if (con.getResponseCode() == HttpURLConnection.HTTP_OK) {
		      br = new BufferedReader(new InputStreamReader(con.getInputStream(), "UTF-8"));
		      String line;
		      while ((line = br.readLine()) != null) {
		    	  sb.append(line).append("\n");
		      }
		      br.close();
		      
		      String accessToken =  sb.toString();
		      
		      // String의 json을 map으로 파싱하기 
		      ObjectMapper mapper = new ObjectMapper();
		      Map<String, Object> map = mapper.readValue(accessToken, Map.class);
		      Map<String, Object> tokenMap = (Map<String, Object>)map.get("response");
		      
		      System.out.println(accessToken);
		      System.out.println(map.get("response"));
		      System.out.println(tokenMap.get("access_token"));
		     
		      accessToken = (String)tokenMap.get("access_token");
		    
		      // 디비에서 환불할 내역 조회하기 
		      PaymentDto paidData = service.checkRefundData(imp_uid);
		      
		      // 데이터베이스에 환불할 내역이 없을 경우 
		      if( paidData == null ) {
		    	  return "nullData";
		      }
		      
		      else {
		    	  System.out.println("paidData : " + paidData);
		      }
		      System.out.println();
		      
		      // 환불하기 
		      String body2 = "reason=" + reason + "&imp_uid=" + imp_uid + "&amount" + cancelAmount;
		      // 환불요청 페이지 연결 
		      HttpURLConnection con2 = (HttpURLConnection)refindUrl.openConnection();
			    // Request Header 정의
				con2.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
				con2.setRequestProperty("Authorization", accessToken);	// 인증토큰 
			    // 전송방식
				con2.setRequestMethod("POST");
			    // 서버에 연결되는 Timeout 시간 설정
				con2.setConnectTimeout(5000);
			    // InputStream 읽어 오는 Timeout 시간 설정
				con2.setReadTimeout(5000); 
			    // URLConnection에 대한 doOutput 필드값을 지정된 값으로 설정한다. 
			    // URL 연결은 입출력에 사용될 수 있다. 
			    // URL 연결을 출력용으로 사용하려는 경우 DoOutput 플래그를 true로 설정하고, 
			    // 그렇지 않은 경우는 false로 설정해야 한다. 기본값은 false이다.
				con2.setDoOutput(true); 
			    
			    // 응답 데이터를 받아들임
				con2.setDoInput(true);
		      
			 // 새로운 OutputStream에 요청할 OutputStream을 넣는다.
			    os = con2.getOutputStream();

			    os.write( body2.getBytes("EUC-KR") );
			    
			    os.flush();
			    os.close();
			    
			    System.out.println("응답 코드: " + con2.getResponseCode());
			    // 200 -> OK , 400 -> Bad Request, 401 -> Not Authorized
			    if (con2.getResponseCode() == HttpURLConnection.HTTP_OK) {
			      br2 = new BufferedReader(new InputStreamReader(con2.getInputStream(), "UTF-8"));
			      String line2;
			      while ((line2 = br2.readLine()) != null) {
			    	  sb2.append(line2).append("\n");
			      }
			      br2.close();
			      
			      String response =  sb2.toString();
			      
			      
			      System.out.println("response:::");
			      System.out.println(response);
			 	 
			      // 데이터베이스 수정하기
			      PaymentDto dto = new PaymentDto();
			      dto.setImpUid(imp_uid);
			      dto.setRefundInfo(reason);
			      boolean success = service.updateRefund(dto);

			      return success + "";

			      
			    }else {
			    	System.out.println(con2.getResponseMessage());
			    	return con2.getResponseMessage();
			    }
		      
		    } else {
		    	System.out.println(con.getResponseMessage());
		    	return con.getResponseMessage();
		    }
		    
		    
		  } catch (Exception e) {
			  e.printStackTrace();
			  return "trycatchException";
		  }

	}
}
