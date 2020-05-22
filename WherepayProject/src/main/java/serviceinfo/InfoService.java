package serviceinfo;

import java.util.List;

import home.HomeVO;

public interface InfoService {

	// 게시물 총 개수
	public int getpaging();

	// 페이징 처리 서비스 조회
	public List<InfoVO> infoPaging(PagingVO vo);
	//서비스 상세조회
	public List<InfoVO> infoDetail(int info_num);

}
