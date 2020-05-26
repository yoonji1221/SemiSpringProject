package user;


import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	
	@Autowired
	UserService userservice;
	
	
	
	/* ---로그인--- */


	// 로그인화면 띄우기
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView volunloginView(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
	
	
	   // 로그인 보내기
	   @RequestMapping(value = "/login", method = RequestMethod.POST)
	   public ModelAndView login(@ModelAttribute("UserVO") UserVO vo, 
			   HttpServletRequest request,HttpSession session, HttpServletResponse response)
	         throws Exception {
	      
	      int result = userservice.login(vo);
	     
	      

	      ModelAndView mav = new ModelAndView();
	      
	      System.out.println(result+"로그인 성공:1, 실패:0");
	      
	      if (result == 1) {
	         session.setAttribute("dbid", vo.getId());
	         
	         List<UserVO> getmasnum = userservice.getMasnum(vo);
		      int masnum = getmasnum.get(0).getMas_num();
		      int unum = getmasnum.get(0).getU_num();
	          session.setAttribute("u_num", unum);
	          session.setAttribute("mas_num", masnum);
	         
	         System.out.println(session.getAttribute("u_num") + "<--로그인하고 unum");
	         System.out.println(session.getAttribute("mas_num") + "<--로그인하고 masnum");
	         System.out.println(session.getAttribute("dbid") + "<--로그인하고 세션아이디");
	         mav.setViewName("redirect:/home");
	      }else {
	         response.setContentType("text/html; charset=UTF-8");
	            PrintWriter out = response.getWriter();
	            out.println("<script>alert('회원 정보가 없습니다'); location.href='/wherepay/login'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();         
	      }
	      return mav;
	   }
	   
	 //로그아웃 
	   @RequestMapping(value = "/logout", method = RequestMethod.GET)
	   public String logout(HttpSession session) {
		   
	      System.out.println(session.getAttribute("dbid") + "로그아웃전");
		   
	      session.invalidate();  
	      
	      return "redirect:/home";
	   }

	
	/* ---세대주 회원가입--- */
	
	//join으로 뷰를 쏘는 역할
	@RequestMapping(value = "/joinmaster1", method =RequestMethod.GET)
	public ModelAndView userJoin(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinMasChk");
		return mav;
	}
	
	//세대주 확인
	@RequestMapping(value = "/joinmaster1/check", method =RequestMethod.GET)
	@ResponseBody	//ajax data부분에 값 넘겨주는 annotation 
	public int userJoin2(@RequestParam("jumin") String jumin,@RequestParam("name") String name, 
			HttpSession session, HttpServletResponse response) throws IOException {
		
		int result = 0;
		
		MasVO vo = new MasVO();
		vo.setName(name);
		vo.setJumin(jumin);
		System.out.println(vo.getName()+"받아온 이름");
		
		int alreayJoinChk = userservice.alreadyJoin(vo.getJumin());
		System.out.println(alreayJoinChk+"제발!!!!!!!!!!!");
		
		if (alreayJoinChk==0) {	//0: 가입 가능	//어떤 정수: 이미 가입 한거
			
			result = userservice.masCheck(vo);	//ajax의 data와 같음
			System.out.println(result+"결과값 나오는지, data에 넘길 그 값");
		
			if(result == 1) {			
				session.setAttribute("sname", name);
				session.setAttribute("sjumin", jumin);
				String sname = (String)session.getAttribute("sname");
				String sjumin= (String)session.getAttribute("sjumin");		
			}else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이름과 주민등록번호를 다시 확인해주세요'); location.href='/wherepay/joinmaster1'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();  
			}
		

		} else {
			System.out.println("Ssssssssssssssssssssss");
			response.setContentType("text/html; charset=UTF-8");PrintWriter out = response.getWriter();
			out.println("<script>alert('이미 가입한 세대주입니다'); location.href='/wherepay/joinmaster1'; </script>"); //history.go(-1);        
            out.flush();
            out.close();  
		}
		return result;
	}
	
	
	
	//join으로 뷰를 쏘는 역할
	@RequestMapping(value = "/joinmaster2", method =RequestMethod.GET)
	public ModelAndView userJoin3(){
		ModelAndView mav = new ModelAndView();
		mav.setViewName("joinMaster");
		return mav;
	}
	
	//아이디 유효성 검사 
	@RequestMapping(value = "/joinmaster2/user", method =RequestMethod.GET)
	@ResponseBody	//ajax data부분에 값 넘겨주는 annotation 
	public int idCheck(@RequestParam("id") String id) {
		int result = userservice.idCheck(id);
		System.out.println(result+"id 겹치니 안겹치니");
		return result;
	}
	
	
	//세대주 회원가입
	@RequestMapping(value ="/joinmaster2", method = RequestMethod.POST)
	public String join (UserVO vo, HttpServletResponse response, HttpServletRequest request) throws Exception {
		
		String path = null;
		vo.setName(request.getParameter("name"));	//session으로 써도 되고 
		vo.setJumin(request.getParameter("jumin"));	//parameter로 써도 됨

		System.out.println(request.getParameter("name"));//input name=""값을 가져옴 
		System.out.println(request.getParameter("id"));
		System.out.println(request.getParameter("pw"));
	

		int result = userservice.join(vo);		
		if (result ==1) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
				out.println("<script>alert('회원가입에 성공하였습니다.'); location.href='/wherepay/home'; </script>"); //history.go(-1);        
	            out.flush();
	            out.close();  
	        path = "redirect:/wherepay/joinmaster1";	
		}
		 return path;
	}

	
	/* ---구성원 회원가입--- */
	
	//join으로 뷰를 쏘는 역할
		@RequestMapping(value = "/joinmember1", method =RequestMethod.GET)
		public ModelAndView memberJoin(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("joinMasSel");
			return mav;
		}
	
		//세대주 검색
		@RequestMapping(value = "/joinmember1/select", method =RequestMethod.GET)
		@ResponseBody	//ajax data부분에 값 넘겨주는 annotation 
		public int selectMaster(@RequestParam("id") String id, HttpSession session) {
			System.out.println(id);
			
			UserVO vo = new UserVO();
			vo.setId(id);
			
			int result = userservice.masSelect(id);
			if(result == 1) {			
				session.setAttribute("sid", id);
				String sid = (String)session.getAttribute("sid");		
			}	
			return result;
		}
	
		
		//join으로 뷰를 쏘는 역할
		@RequestMapping(value = "/joinmember2", method =RequestMethod.GET)
		public ModelAndView joinMember(){
			ModelAndView mav = new ModelAndView();
			mav.setViewName("joinMember");
			return mav;
		}
		
	
		//구성원 회원가입
		@RequestMapping(value ="/joinmember2", method = RequestMethod.POST)
		public String joinMember (UserVO vo, HttpServletResponse response, 
				HttpServletRequest request, HttpSession session) throws Exception {
			
			String path = null;
		
			//session에 저장된 id를 받아와서 사용
			String id = (String)session.getAttribute("sid");
			System.out.println(id);	
			
			List<UserVO> list = userservice.autoSelect(id);
			vo.setAddr(list.get(0).getAddr());
			vo.setFamilynum(list.get(0).getFamilynum());
			vo.setHowtoget(list.get(0).getHowtoget());
			vo.setMas_num(list.get(0).getMas_num());
			
			//구성원 수 - 이미 정해진것
			int familyNum=Integer.parseInt(list.get(0).getFamilynum());
			System.out.println(list.get(0).getFamilynum()+"aaaaaaaa");
			System.out.println(familyNum+"bbbbbbbbbbb");
			
			//이미 getMas_num - mas_num으로 가입한애들 수: 
			int masCount = userservice.fnumCheck(id);
			System.out.println(masCount+"이미 getMas_num - mas_num으로 가입한애들 수");
			
			if (familyNum > masCount ) {				
				int result = userservice.joinMember(vo);		
				if (result ==1) {
					response.setContentType("text/html; charset=UTF-8");
					PrintWriter out = response.getWriter();
					out.println("<script>alert('회원가입에 성공하였습니다.'); location.href='/wherepay/home'; </script>"); //history.go(-1);        
					out.flush();
					out.close();  
				//	path = "redirect:/wherepay/joinmember1";	
				}
			}
			else {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = response.getWriter();
				out.println("<script>alert('이미 회원가입을 모두 끝낸가족입니다.'); location.href='/wherepay/joinmember2'; </script>"); //history.go(-1);        
				out.flush();
				out.close();  
				path = "redirect:/wherepay/home";
				
			}
			 return path;
		}


}