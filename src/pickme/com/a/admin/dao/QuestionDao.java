package pickme.com.a.admin.dao;

import java.util.List;

import model.QuestionDto;

public interface QuestionDao {
	
	// 문의사항 접수하기 (추가)
	public boolean insertQuestion(QuestionDto dto);
	// 관리자 - 모든 문의내역 불러오기
	public List<QuestionDto> getAllQuestion();
	// 관리자 - 미답변 문의내역 불러오기 
	public List<QuestionDto> getNotAnsweredQuestion();
	// 관리자 - 문의내역 종류 통계
	public List<QuestionDto> getTypeOfQuestion();
	// 관리자 - 미답변 내역 불러오기
	public QuestionDto getQuestionDetail(int seq);
	// 관리자 - 답변등록하기
	public boolean updateQuestionReply(QuestionDto reply);
	// 관리자 - 문의내역 삭제하기
	public boolean deleteQuestion(List<Integer> seqList);
	// 관리자 - 응답으로 처리하기
	public boolean passQuestion(List<Integer> seqList);
	
	
}
