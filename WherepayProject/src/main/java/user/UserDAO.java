package user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {

	@Autowired
	SqlSession session;
	
	
	//세대주 확인 - 주민번호랑 이름 입력해서 확인 
	public int masCheck(MasVO vo) {
		return session.selectOne("db.masCheck",vo);
	}

	//id 유효성 검사
	public int idCheck(String id) {
		return session.selectOne("db.idCheck", id);
	}
	
	//세대주 회원가입
	public int join(UserVO vo) {
		return session.insert("db.join", vo);
	}
	


}
