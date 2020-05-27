package mypage;

import java.util.List;

import home.HomeVO;
import user.UserVO;

public interface MypageService {
	
	//세대주가 세대주 신청 인원 확인하기
	public List<UserVO> getUserList(int mas_num);
	
	//세대주가 구성원으로 허락
	public void masterConfirm(int u_num);
	
	//총 지원금 확인
	public List<UserVO> getFamilynum(int mas_num);
	
	public int insertPayment(paymentVO vo);
	
	public int insertPaymentZ(paymentVO vo);
	
	//디테일 매장 검색 - 카드
	public List<HomeVO> detaillist(int sam_num);
	
	//디테일 매장 검색 - 제로
	public List<HomeVO> detaillist2(int zero_num);
	
	//지출 내역 확인하기 - 카드
	public List<paymentVO> showpayment_card(int mas_num);
	
	//지출 내역 확인하기 - 제로
	public List<paymentVO> showpayment_zero(int mas_num);
	
	//사용 내역 총합
	public String useMoney(int mas_num);
	
	public List<HomeVO> getGu();

	public List<HomeVO> category();
	
	//지출 내역 삭제
	public void deletePayment(paymentVO vo);
	
	//로그인한 유저정보 가져오기
	public List<UserVO> getUser(int u_num);

	//그룹 내의 구성원 정보 모두 가져오기
	public List<UserVO> getGroup(int mas_num);
	
	//구성원 별 사용 총액
	public List<paymentVO> getPayment(int mas_num);
}
