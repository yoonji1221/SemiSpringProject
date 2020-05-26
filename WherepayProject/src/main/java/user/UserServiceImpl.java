package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

	//로그인
	@Override
	public int login(UserVO vo) {
		return dao.login(vo);
	}
	
	//mas_num, u_num 가져와서 세션에 저장
	public List<UserVO> getMasnum(UserVO vo){
		return dao.getMasnum(vo);
	}
	
	//세대주 가입 - 기 가입자:1
	@Override
	public int alreadyJoin(String jumin) {
		return dao.alreadyJoin(jumin);
	}
	
	//세대주 확인
	@Override
	public int masCheck(MasVO vo) {
		return dao.masCheck(vo);
	}
	
	//id중복 확인
	@Override
	public int idCheck(String id) {
		return dao.idCheck(id);
	}
	
	//가족 구성원 수 이상으로 가입X
	public int fnumCheck(String id) {
		return dao.fnumCheck(id);
	}

	//회원가입
	@Override
	public int join(UserVO vo) {
		return dao.join(vo);
	}

	//세대주 검색
	@Override
	public int masSelect(String id) {
		return dao.masSelect(id);
	}

	
	@Override
	public List<UserVO> autoSelect(String id) {
		return  dao.autoSelect(id);
	}
	
	//구성원 회원가입
	@Override
	public int joinMember(UserVO vo) {
		return dao.joinMember(vo);
	}





	
}
