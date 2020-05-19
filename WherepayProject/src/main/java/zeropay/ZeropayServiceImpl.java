package zeropay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ZeropayServiceImpl implements ZeropayService {
	@Autowired
	ZeropayDAO dao;

	@Override
	public List<ZeropayVO> dbtest() {
		return dao.dbtest();
	}
	
	
}
