package mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import user.UserVO;
import home.HomeVO;

@Controller
public class MypageController {
	@Autowired
	MypageService mypageservice;
	
	//나의 가구관리 
	@RequestMapping("/mypage")
	public ModelAndView masterMypage(@RequestParam("mas_num") int mas_num) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list = mypageservice.getUserList(mas_num);
		mav.addObject("list", list);
		mav.setViewName("myPage_manage");
		return mav;
	}

	//가구원 신청 수락
	@RequestMapping("/confirm")
	public String masterConfirm(@RequestParam("mas_num") int mas_num, @RequestParam(value="u_num") int u_num) {
		mypageservice.masterConfirm(u_num);
		return "redirect:/mypage?mas_num=" + mas_num;
	}
	
	//가계부
	@RequestMapping("/household")
	public ModelAndView myPageHousehold(@RequestParam("mas_num") int mas_num, @RequestParam("u_num") int u_num) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list = mypageservice.getUserList(mas_num);
		List<UserVO> detaillist = mypageservice.getFamilynum(mas_num);
		mav.addObject("list", list);
		mav.addObject("detaillist", detaillist);
		
		//사용내역 조회 - 카드
		List<paymentVO> cardlist = mypageservice.showpayment_card(mas_num); 
		mav.addObject("cardlist", cardlist);
		
		//사용내역 조회 - 제로
		List<paymentVO>  zerolist = mypageservice.showpayment_zero(mas_num); 
		mav.addObject("zerolist", zerolist);
		
		//사용 내역 총합계
		int useMoney = mypageservice.useMoney(mas_num);
		mav.addObject("useMoney", useMoney);
		
		mav.setViewName("myPage_household");
		return mav;
	}
	
	//가계부 입력 - 카드 사용시
	@GetMapping("/household/insertPayment")
	public String insertPayment(@RequestParam("mas_num") int mas_num, @RequestParam(value = "u_num", required=false) int u_num, paymentVO vo, HttpServletRequest request) {
		String path = null;
		int result = 0;
		vo.setPaydate(request.getParameter("paydate"));
		vo.setMas_num(Integer.parseInt(request.getParameter("mas_num")));
		vo.setMoney(Integer.parseInt(request.getParameter("money")));		
		vo.setU_num(Integer.parseInt(request.getParameter("u_num")));
		vo.setMemo(request.getParameter("memo"));
		
	
		if(Integer.parseInt(request.getParameter("check_num")) == 1) {
			//카드
			vo.setSam_num(Integer.parseInt(request.getParameter("sam_num")));
			result = mypageservice.insertPayment(vo);
		}else {		
			//제로페이
			vo.setZ_num(Integer.parseInt(request.getParameter("z_num")));
			result = mypageservice.insertPaymentZ(vo);
		}
			 
		if(result == 1) {
			path = "redirect:/household?mas_num=" + mas_num +"&u_num=" + u_num;
		}
		return path;
	}
	
	//결제 완료한 매장 검색 - 카드
	@GetMapping("/searchMarket")
	public ModelAndView searchMarket() {
		 ModelAndView mav = new ModelAndView();
		 List<HomeVO> gulist = mypageservice.getGu();
		 List<HomeVO> category = mypageservice.category();
		 	System.out.println(gulist.size()+":::::::::::"+category.size());
		 mav.addObject("gulist", gulist);
		 mav.addObject("category", category);
		 mav.setViewName("searchMarket");
		 return mav;
	}
	
	//결제 완료한 매장 검색 - 제로페이
	@GetMapping("/searchMarket2")
	public ModelAndView searchMarket2() {
		 ModelAndView mav = new ModelAndView();
		 List<HomeVO> gulist = mypageservice.getGu();
		 List<HomeVO> category = mypageservice.category();
			
		 mav.addObject("gulist", gulist);
		 mav.addObject("category", category);
		 mav.setViewName("searchMarket2");
		 return mav;
	}
	
	//디테일 매장 검색 - 카드
	@GetMapping("/search/detailcard")
	public ModelAndView searchMarketDetail(@RequestParam(value = "sam_num") int sam_num) {
		 ModelAndView mav = new ModelAndView();
		 List<HomeVO> list = mypageservice.detaillist(sam_num);
		 mav.addObject("detailresult", list);
		 mav.setViewName("searchdetail3");
		 return mav;
	}
	
	//디테일 매장 검색 - 제로
	@GetMapping("/search/detailzero")
	public ModelAndView searchMarketDetail2(@RequestParam("z_num") int z_num) {
		 ModelAndView mav = new ModelAndView();
		 List<HomeVO> list = mypageservice.detaillist2(z_num);
		 mav.addObject("detailresult2", list);
		 mav.setViewName("searchdetail3");
		 return mav;
	}
	
	//test
	@RequestMapping("/test")
	public ModelAndView test() {
		 ModelAndView mav = new ModelAndView();
		 mav.setViewName("calender");
		 return mav;
	}
			

}