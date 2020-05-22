package home;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	@Autowired
	HomeService homeservice;

	@GetMapping("/home")
	public ModelAndView login(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		List<HomeVO> zerolist = homeservice.zerodata();
		List<HomeVO> samlist = homeservice.samsungdata();
		mav.addObject("zerolist", zerolist);
		mav.addObject("samlist", samlist);
		mav.setViewName("wherepayhome");
		return mav;
	}

	//검색 페이지
	@GetMapping("/search")
	public ModelAndView search(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
		List<HomeVO> gulist = homeservice.getGu();
		List<HomeVO> category = homeservice.category();
		
		mav.addObject("gulist", gulist);
		mav.addObject("category", category);
		mav.setViewName("search");
		return mav;
	}
	
	
	@GetMapping("/searchresult")
	@ResponseBody
	public List<HomeVO> searchresult(@RequestParam String sam_gu,@RequestParam String sam_btheme,@RequestParam int value) {
		ModelAndView mav = new ModelAndView();
		List<HomeVO> resultlist = null;
		HomeVO vo = new HomeVO();

		if(value==1) { //삼성카드 조회
			System.out.println("넘어온 데이터" + sam_gu +":::"+ sam_btheme);
		if(!sam_gu.equals("전체") && !sam_btheme.equals("전체")) { //지역, 업종 두개 다 선택 후 검색
			vo.setSam_gu(sam_gu);
			vo.setSam_btheme(sam_btheme);
			resultlist = homeservice.getAlllist(vo);
			return resultlist;
		}
		else if(sam_gu.equals("전체") && sam_btheme.equals("전체")) { //삼성카드 전체조회
			resultlist = homeservice.samsungdata();
			return resultlist;
		}
		else if(!sam_gu.equals("전체") && sam_btheme.equals("전체"))  { //삼성카드 지역만 조회
			vo.setSam_gu(sam_gu);
			resultlist = homeservice.regionResult(vo);
			return resultlist;
		}	
		else if(sam_gu.equals("전체") && !sam_btheme.equals("전체")) { //삼성카드 업종만 조회
			vo.setSam_btheme(sam_btheme);
			resultlist = homeservice.categoryResult(vo);
			return resultlist;
		}else return resultlist;
		
		}
		
		else if(value==2 || value ==3) { //제로페이 조회
			System.out.println("제로제로 넘어온 데이터" + sam_gu +":::"+ sam_btheme);
		if(!sam_gu.equals("전체") && !sam_btheme.equals("전체")) { //지역, 업종 두개 다 선택 후 검색
			vo.setZ_addr(sam_gu);
			vo.setZ_btheme(sam_btheme);
			resultlist = homeservice.zeroAlllist(vo);
			return resultlist;
		}
		else if(sam_gu.equals("전체") && sam_btheme.equals("전체")) { //제로페이 전체조회
			resultlist = homeservice.zerodata();
			return resultlist;
		}
		else if(!sam_gu.equals("전체") && sam_btheme.equals("전체"))  { //제로페이 지역만 조회
			vo.setZ_addr(sam_gu);
			resultlist = homeservice.zeroregionResult(vo);
			return resultlist;
		}	
		else if(sam_gu.equals("전체") && !sam_btheme.equals("전체")) { //제로페이 업종만 조회
			vo.setZ_btheme(sam_btheme);
			resultlist = homeservice.zerocategoryResult(vo);
			return resultlist;
		}else return resultlist;
		
		}
		return resultlist;
	}
		
	// dbtest
	@GetMapping("/dbtest")
	public ModelAndView dbtest(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView();
<<<<<<< HEAD
		System.out.println("dbtest");
		List<HomeVO> list = homeservice.dbtest();
		System.out.println(list.size());
		mav.addObject("list", list);
=======

		List<HomeVO> zerolist = homeservice.zerodata();
		List<HomeVO> samlist = homeservice.samsungdata();
		mav.addObject("list", samlist);
		mav.addObject("zerolist", zerolist);
>>>>>>> branch 'master' of https://github.com/yoonji1221/SemiSpringProject.git
		mav.setViewName("home");
		return mav;
	}

}