package pickme.com.a.admin.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.QuestionDto;

@Repository
public class QuestionDaoImpl implements QuestionDao {

	@Autowired
	SqlSession sqlSession;
	String namespace = "Question.";
	
	
	@Override
	public boolean insertQuestion(QuestionDto dto) {
		return sqlSession.insert(namespace + "insertQuestion", dto) > 0 ? true:false;
	}


	@Override
	public List<QuestionDto> getAllQuestion() {
		return sqlSession.selectList(namespace + "getAllQuestion");
	}


	@Override
	public List<QuestionDto> getNotAnsweredQuestion() {
		return sqlSession.selectList(namespace + "getNotAnsweredQuestion");
	}


	@Override
	public List<QuestionDto> getTypeOfQuestion() {
		return sqlSession.selectList(namespace + "getTypeOfQuestion");
	}


	@Override
	public QuestionDto getQuestionDetail(int seq) {
		return sqlSession.selectOne(namespace + "getQuestionDetail", seq);
	}


	@Override
	public boolean updateQuestionReply(QuestionDto reply) {
		return sqlSession.update(namespace + "updateQuestionReply", reply) > 0 ? true:false;
	}


	@Override
	public boolean deleteQuestion(List<Integer> seqList) {
		
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.delete(namespace + "deleteQuestion", seq); 
			if(a == 0) return false;
		}
		return true;
	}
	
	@Override
	public boolean passQuestion(List<Integer> seqList) {
		
		for (int i = 0; i < seqList.size(); i++) {
			int seq = seqList.get(i);
			int a = sqlSession.delete(namespace + "passQuestion", seq); 
			if(a == 0) return false;
		}
		return true;
	}
	
}
