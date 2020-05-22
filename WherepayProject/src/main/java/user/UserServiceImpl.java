package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

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

	//회원가입
	@Override
	public int join(UserVO vo) {
		return dao.join(vo);
	}

	
}
