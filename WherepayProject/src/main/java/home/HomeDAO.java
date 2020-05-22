package home;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HomeDAO {

	@Autowired
	SqlSession session;
	
	public List<HomeVO> zerodata() {
		return session.selectList("db.zerodata");
	}
	public List<HomeVO> samsungdata() {
		return session.selectList("db.samsungdata");
	}
	public List<HomeVO> getGu() {
		return session.selectList("db.getGu");
	}
	public List<HomeVO> category() {
		return session.selectList("db.category");
	}
	public List<HomeVO> getAlllist(HomeVO vo) {
		return session.selectList("db.getAlllist",vo);
	}
	public List<HomeVO> regionResult(HomeVO vo) {
		return session.selectList("db.regionResult",vo);
	}
	public List<HomeVO> categoryResult(HomeVO vo) {
		return session.selectList("db.categoryResult",vo);
	}
	public List<HomeVO> zeroAlllist(HomeVO vo) {
		return session.selectList("db.zeroAlllist",vo);
	}
	public List<HomeVO> zeroregionResult(HomeVO vo) {
		return session.selectList("db.zeroregionResult",vo);
	}
	public List<HomeVO> zerocategoryResult(HomeVO vo) {
		return session.selectList("db.zerocategoryResult",vo);
	}
	
}
