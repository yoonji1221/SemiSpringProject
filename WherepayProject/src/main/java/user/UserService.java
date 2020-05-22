package user;

import java.util.List;

public interface UserService {
	
	//세대주 확인
	public int masCheck(MasVO vo);
	
	//아이디 확인 
	public int idCheck(String id);
	
	//회원가입
	public int join(UserVO vo);
	

}
