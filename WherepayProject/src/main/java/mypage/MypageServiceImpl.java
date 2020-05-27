package mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.HomeVO;
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

	@Override
	public int insertPayment(paymentVO vo) {
		return dao.insertPayment(vo);
	}
	
	@Override
	public int insertPaymentZ(paymentVO vo) {
		return dao.insertPaymentZ(vo);
	}

	//디테일 매장 검색 - 카드
	@Override
	public List<HomeVO> detaillist(int sam_num) {
		return dao.detaillist(sam_num);
	}
	
	//디테일 매장 검색 - 제로
	@Override
	public List<HomeVO> detaillist2(int zero_num) {
		return dao.detaillist2(zero_num);
	}

	//지출 내역 확인하기 - 카드
	@Override
	public List<paymentVO> showpayment_card(int mas_num) {
		return dao.showpayment_card(mas_num);
	}
	
	//지출 내역 확인하기 - 카드
	@Override
	public List<paymentVO> showpayment_zero(int mas_num) {
		return dao.showpayment_zero(mas_num);
	}
	
	//사용 내역 총합
	@Override
	public String useMoney(int mas_num) {
		
		if( dao.useMoney(mas_num) == null) {
			return "0";
		}else {
			return dao.useMoney(mas_num);
		}
		
	}
	
	
	@Override
	public List<HomeVO> getGu() {
		return dao.getGu();
	}

	@Override
	public List<HomeVO> category() {
		return dao.category();
	}

	//지출내역 삭제
	public void deletePayment(paymentVO vo) {
		dao.deletePayment(vo);
	}
	
	
	//로그인한 유저정보 가져오기
	@Override
	public List<UserVO> getUser(int u_num) {
		return dao.getUser(u_num);
	}

	@Override
	public List<UserVO> getGroup(int mas_num) {
		return dao.getGroup(mas_num);
	}

	@Override
	public List<paymentVO> getPayment(int mas_num) {
		return dao.getPayment(mas_num);
	}
	
	

	
	
	

	

}
