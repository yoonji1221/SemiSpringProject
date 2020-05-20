package home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	HomeService homeservice;

	@RequestMapping("/home")
	public ModelAndView login(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("wherepayhome");
		return mav;
	}
	
	//윤지주석 ㅋㅋㅋㅋㅋ
	//test22
	@GetMapping("/dbtest")
	public ModelAndView dbtest(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		List<HomeVO> list = homeservice.dbtest();
		mav.addObject("list", list);
		mav.setViewName("home");
		return mav;
	}

}