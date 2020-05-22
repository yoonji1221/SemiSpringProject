package mypage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import user.UserVO;

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
	public ModelAndView myPageHousehold(@RequestParam("mas_num") int mas_num) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list = mypageservice.getUserList(mas_num);
		List<UserVO> detaillist = mypageservice.getFamilynum(mas_num);
		mav.addObject("list", list);
		mav.addObject("detaillist", detaillist);
		mav.setViewName("myPage_household");
		return mav;
	}
	
	//가계부 입력
	@RequestMapping("/household/insertPayment")
	public String insertPayment(@RequestParam("mas_num") int mas_num) {
		//mypageservice.masterConfirm(u_num);
		return "redirect:/household?mas_num=" + mas_num;
	}

	

}