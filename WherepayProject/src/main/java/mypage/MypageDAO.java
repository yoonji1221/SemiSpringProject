package mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import home.HomeVO;
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
	
	//가계부 입력
	public int insertPayment(paymentVO vo) {
		return session.insert("db.insertPayment", vo);
	}
	
	public int insertPaymentZ(paymentVO vo) {
		return session.insert("db.insertPaymentZ", vo);
	}
	
	//디테일 매장 검색 - 카드
	public List<HomeVO> detaillist(int sam_num){
		List<HomeVO> list = session.selectList("db.detailresult", sam_num);
		return list;
	}
	
	//디테일 매장 검색 - 제로
	public List<HomeVO> detaillist2(int zero_num){
		List<HomeVO> list = session.selectList("db.zeroresult", zero_num);
		return list;
	}
		
	//지출 내역 확인하기 - 카드
	public List<paymentVO> showpayment_card(int mas_num){
		List<paymentVO> list = session.selectList("db.showpayment", mas_num);
		return list;
	}
	
	//지출 내역 확인하기 - 제로
	public List<paymentVO> showpayment_zero(int mas_num){
		List<paymentVO> list = session.selectList("db.showpayment_zero", mas_num);
		return list;
	}
	
	//사용 내역 총합
	public String useMoney(int mas_num) {
		return session.selectOne("db.useMoneyTotal", mas_num);
	}
	
	//구, 카테고리 검색
	public List<HomeVO> getGu() {
		return session.selectList("db.getGu");
	}
	public List<HomeVO> category() {
		return session.selectList("db.category");
	}
	
	//지출 내역 삭제
	public void deletePayment(paymentVO vo) {
		session.delete("db.deletePayment", vo);
	}
	
	//로그인한 유저정보 가져오기
	public List<UserVO> getUser(int u_num){
		return session.selectList("db.getUser", u_num);
	}
	
	//그룹 내의 구성원 정보 모두 가져오기
	public List<UserVO> getGroup(int mas_num){
		return session.selectList("db.getGroup", mas_num);
	}
	
	//구성원 별 사용 총액
	public List<paymentVO> getPayment(int mas_num){
		return session.selectList("db.getPayment", mas_num);
	}

}
