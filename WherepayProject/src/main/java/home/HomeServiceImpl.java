package home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeDAO dao;

	@Override
	public List<HomeVO> zerodata() {
		return dao.zerodata();
	}

	@Override
	public List<HomeVO> samsungdata() {
		return dao.samsungdata();
	}

	@Override
	public List<HomeVO> getGu() {
		return dao.getGu();
	}

	@Override
	public List<HomeVO> category() {
		return dao.category();
	}
	@Override
	public List<HomeVO> getAlllist(HomeVO vo) {
		return dao.getAlllist(vo);
	}

	@Override
	public List<HomeVO> regionResult(HomeVO vo) {
		return dao.regionResult(vo);
	}

	@Override
	public List<HomeVO> categoryResult(HomeVO vo) {
		return dao.categoryResult(vo);
	}

	@Override
	public List<HomeVO> zeroAlllist(HomeVO vo) {
		return dao.zeroAlllist(vo);
	}

	@Override
	public List<HomeVO> zeroregionResult(HomeVO vo) {
		return dao.zeroregionResult(vo);
	}

	@Override
	public List<HomeVO> zerocategoryResult(HomeVO vo) {
		return dao.zerocategoryResult(vo);
	}

	@Override
	public List<HomeVO> detailresult(int sam_num) {
		return dao.detailresult(sam_num);
	}
	@Override
	public List<HomeVO> zeroresult(int z_num) {
		return dao.zeroresult(z_num);
	}
	
	
}
