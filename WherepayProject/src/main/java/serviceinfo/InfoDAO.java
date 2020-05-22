package serviceinfo;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import home.HomeVO;

@Component
public class InfoDAO {

	@Autowired
	SqlSession session;

	// 전체 게시물 개수
	public int getpaging() {
		return session.selectOne("db.getpaging");
	}

	// 페이징 처리 게시물 조회
	public List<InfoVO> infoPaging(PagingVO vo) {
		return session.selectList("db.infoPaging", vo);
	}
	
	//서비스 디테일
	public List<InfoVO> infoDetail(int info_num) {
		List<InfoVO> list = session.selectList("db.infoDetail", info_num);
		return list;
	}
}
