package user;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO dao;

	@Override
	public List<UserVO> join(UserVO vo) {
		
		return null;
	}

}
