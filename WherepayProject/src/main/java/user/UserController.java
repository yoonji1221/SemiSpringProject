package user;


import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	
	@Autowired
	UserService userservice;
	
	//join으로 뷰를 쏘는 역할
	@RequestMapping(value = "/join2", method =RequestMethod.GET)
	public ModelAndView userJoin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinMasChk");
		return mav;
	}
	
	//세대주 확인
	@RequestMapping(value = "/join2/check", method =RequestMethod.GET)
	@ResponseBody	//ajax data부분에 값 넘겨주는 annotation 
	public int userJoin2(@RequestParam("jumin") String jumin,@RequestParam("name") String name) {
		System.out.println("찍히나 ? ? ?");
		System.out.println(jumin+name);
		
		MasVO vo = new MasVO();
		vo.setName(name);
		vo.setJumin(jumin);
		System.out.println(vo.getName()+"받아온 이름");
		
		int result = userservice.masCheck(vo);
		System.out.println(result+"결과값 나오는지, data에 넘길 그 값");
		return result;
	}
	
	
	
	//join으로 뷰를 쏘는 역할
	@RequestMapping(value = "/join", method =RequestMethod.GET)
	public ModelAndView userJoin3(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("join");
		return mav;
	}
	
	//아이디 유효성 검사 
	@RequestMapping(value = "/join/user", method =RequestMethod.GET)
	@ResponseBody	//ajax data부분에 값 넘겨주는 annotation 
	public int idCheck(@RequestParam("id") String id) {
		int result = userservice.idCheck(id);
		System.out.println(result+"id 겹치니 안겹치니");
		return result;
	}
	
	
	//세대주 회원가입
	@RequestMapping(value ="/join", method = RequestMethod.POST)
	public String join (UserVO vo1, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		String path = null;
		
		UserVO vo = new UserVO(vo1);
	//	vo1.setName(request.getParameter("name"));
	//	vo1.setJumin(request.getParameter("jumin"));

		System.out.println(request.getParameter("name"));
		System.out.println(request.getParameter("jumin"));
		
		System.out.println(request.getParameter("pw"));	//input name=""값을 가져옴 
		System.out.println(request.getParameter("familynum"));
		System.out.println(request.getParameter("howtoget"));
		
		
		int result = userservice.join(vo);
		
		System.out.println(result+"      =result");
		if (result ==1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				out.println("<script>alert('회원가입에 성공하였습니다.'); location.href='/wherepay/join'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();  
	        path = "redirect:/wherepay/join";
	       
			
		}
		 return path;
	}



}