package pickme.com.a.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.QuestionDto;
import pickme.com.a.admin.dao.QuestionDao;

@Service
public class QuestionServiceImpl  implements QuestionService {

	@Autowired
	QuestionDao dao;

	
	@Override
	public boolean insertQuestion(QuestionDto dto) {
		return dao.insertQuestion(dto);
	}


	@Override
	public List<QuestionDto> getAllQuestion() {
		return dao.getAllQuestion();
	}


	@Override
	public List<QuestionDto> getNotAnsweredQuestion() {
		return dao.getNotAnsweredQuestion();
	}


	@Override
	public List<QuestionDto> getTypeOfQuestion() {
		return dao.getTypeOfQuestion();
	}


	@Override
	public QuestionDto getQuestionDetail(int seq) {
		return dao.getQuestionDetail(seq);
	}


	@Override
	public boolean updateQuestionReply(QuestionDto reply) {
		return dao.updateQuestionReply(reply);
	}


	@Override
	public boolean deleteQuestion(List<Integer> seqList) {
		return dao.deleteQuestion(seqList);
	}


	@Override
	public boolean passQuestion(List<Integer> seqList) {
		return dao.passQuestion(seqList);
	}
	
}
