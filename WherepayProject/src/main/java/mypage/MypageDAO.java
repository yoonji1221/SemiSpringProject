package mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import user.UserVO;

@Component
public class MypageDAO {

	@Autowired
	SqlSession session;
	
	public List<UserVO> getUserList(int mas_num){
		List<UserVO> list = session.selectList("db.checkUser", mas_num);
		return list;
	}
	
	public void masterConfirm(int u_num) {
		session.update("db.updateConfirm", u_num);
	}
	
	public List<UserVO> getFamilynum(int mas_num) {
		List<UserVO> list = session.selectList("db.totalMoney", mas_num);
		return list;
	}

}
