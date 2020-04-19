package pickme.com.a.util;

import java.util.Date;

public class FUpUtil {
	
	// 수정할 예정
	
	
	
	// myfile.txt => f.indexOf('.') -> 6
	// 파일명, 확장자명
	// f.substring( 6 ) -> .txt
	// f.substring( 0, 6 ) -> myfile
	
	// myfile.txt -> 23423423.txt
	public static String getNewFileName(String f) {
		String filename = "";
		String fpost = "";
		
		if(f.indexOf('.') >= 0) {	// 확장자명이 존재함
			fpost = f.substring( f.indexOf('.') );	// .txt
			filename = new Date().getTime() + "__" + f; // 4322445235__originalName.txt	(언더바두개)	
		}
		else {	// 확장자명이 없음
			filename = new Date().getTime() + "__" + f + ".back";
		}
		return filename;
	}
	
	

}










