package zeropay;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class ZeropayDAO {

	@Autowired
	SqlSession session;
	
	public List<ZeropayVO> dbtest() {
		return session.selectList("db.dbtest");
	}
	
}
