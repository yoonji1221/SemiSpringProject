package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.UserVO;

@Service
public class MypageServiceImpl implements MypageService {
	@Autowired
	MypageDAO dao;

	@Override
	public List<UserVO> getUserList(int mas_num) {
		return dao.getUserList(mas_num);
	}

	@Override
	public void masterConfirm(int u_num) {
		dao.masterConfirm(u_num);
	}

	@Override
	public List<UserVO> getFamilynum(int mas_num) {
		return dao.getFamilynum(mas_num);
	}
	
	
	
	
	
	

}
