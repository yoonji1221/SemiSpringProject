package user;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	
	@Autowired
	UserService userservice;
	
//	@RequestMapping(value ="/join", method = RequestMethod.POST)
//	public String join (volunteerVO vo1, String large1, String )
	


}