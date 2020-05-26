package user;

import java.util.List;

public interface UserService {
	
	//로그인
	public int login(UserVO vo);
		
	//mas_num, u_num 가져와서 세션에 저장
	public List<UserVO> getMasnum(UserVO vo);
	
	//세대주 가입 - 기 가입자:1
	public int alreadyJoin(String jumin);
	
	//세대주 확인
	public int masCheck(MasVO vo);
	
	//아이디 확인 
	public int idCheck(String id);
	
	//가족 구성원 수 이상으로 가입X
	public int fnumCheck(String id);
	
	//세대주 회원가입
	public int join(UserVO vo);

	//세대주 검색
	public int masSelect(String id);

	//세대주 id에따라 항목 선택
	public List<UserVO> autoSelect(String id);
	
	//구성원 회원가입
	public int joinMember(UserVO vo);

	
	

}
