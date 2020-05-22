package home;

import java.util.List;

public interface HomeService {

	public List<HomeVO> zerodata();
	
	public List<HomeVO> samsungdata();
	
	public List<HomeVO> getGu();

	public List<HomeVO> category();

	public List<HomeVO> getAlllist(HomeVO vo);

	public List<HomeVO> regionResult(HomeVO vo);

	public List<HomeVO> categoryResult(HomeVO vo);

	public List<HomeVO> zeroAlllist(HomeVO vo);

	public List<HomeVO> zeroregionResult(HomeVO vo);

	public List<HomeVO> zerocategoryResult(HomeVO vo);

}
