package serviceinfo;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class InfoController {
	@Autowired
	InfoService infoservice;

	@GetMapping("/serviceinfo")
	public ModelAndView login(PagingVO vo, @RequestParam(value = "nowPage", required = false) String nowPage,
			@RequestParam(value = "cntPerPage", required = false) String cntPerPage, HttpServletRequest req)
			throws Exception, SQLException {
		ModelAndView mav = new ModelAndView();
		int total = infoservice.getpaging();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) {
			cntPerPage = "10";
		}
		vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));

		List<InfoVO> infolist = infoservice.infoPaging(vo);
		mav.addObject("paging", vo);
		mav.addObject("infolist", infolist);
		System.out.println("serviceinfo 호출");
		mav.setViewName("serviceinfo");
		return mav;
	}
	
	@GetMapping("serviceinfo/detail")
    public ModelAndView VolunteerDetail2(@RequestParam(value="info_num", required = false) int info_num, HttpServletRequest req) {
       ModelAndView mav = new ModelAndView();
                
       List<InfoVO> infodetail = infoservice.infoDetail(info_num);
       mav.addObject("detaillist", infodetail);
       mav.setViewName("serviceinfodetail");
       return mav;
    }
	

}