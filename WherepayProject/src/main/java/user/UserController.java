package user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	@Autowired
	UserService userservice;

	@RequestMapping("/wherepayhome")
	public ModelAndView login(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("wherepayhome");
		return mav;
	}
	
	@RequestMapping("/dbtest")
	public ModelAndView dbtest(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		List<UserVO> list = userservice.dbtest();
		mav.addObject("list", list);
		mav.setViewName("home");
		return mav;
	}

}