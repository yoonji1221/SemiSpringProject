package user;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class UserDAO {

	@Autowired
	SqlSession session;
	
	//로그인
	public int login(UserVO vo) {
		return session.selectOne("db.login",vo);
	}
	
	//세대주 가입 - 기 가입자:1
	public int alreadyJoin(String id) {
		return session.selectOne("db.alreadyJoin", id);
	}
	
	//세대주 확인 - 주민번호랑 이름 입력해서 확인 
	public int masCheck(MasVO vo) {
		return session.selectOne("db.masCheck",vo);
	}

	//id 유효성 검사
	public int idCheck(String id) {
		return session.selectOne("db.idCheck", id);
	}
	
	//가족 구성원 수 이상으로 가입X
	public int fnumCheck(String id) {
		return session.selectOne("db.fnumCheck", id );
	}
	
	
	//세대주 회원가입
	public int join(UserVO vo) {
		return session.insert("db.join", vo);
	}
	
	//id 유효성 검사
	public int masSelect(String id) {
		return session.selectOne("db.masSelect", id);
	}
	
	//구성원 회원가입 하기 위해서 id=" "인사람 정보 뽑기
	public List<UserVO> autoSelect(String id) {
			return  session.selectList("db.autoSelect", id);
	}
	//구성원 회원가입
	public int joinMember(UserVO vo) {
			 return session.insert("db.joinMember", vo);
	}





}
