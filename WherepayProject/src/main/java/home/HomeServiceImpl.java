package home;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeDAO dao;

	@Override
	public List<HomeVO> dbtest() {
		return dao.dbtest();
	}
	
	
}
