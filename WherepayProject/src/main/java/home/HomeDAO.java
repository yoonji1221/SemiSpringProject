package home;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class HomeDAO {

	@Autowired
	SqlSession session;
	
	public List<HomeVO> dbtest() {
		return session.selectList("db.dbtest");
	}
	
}
