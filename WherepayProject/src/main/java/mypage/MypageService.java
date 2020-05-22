package mypage;

import java.util.List;

import user.UserVO;

public interface MypageService {
	
	//세대주가 세대주 신청 인원 확인하기
	public List<UserVO> getUserList(int mas_num);
	
	//세대주가 구성원으로 허락
	public void masterConfirm(int u_num);
	
	//총 지원금 확인
	public List<UserVO> getFamilynum(int mas_num);

}
