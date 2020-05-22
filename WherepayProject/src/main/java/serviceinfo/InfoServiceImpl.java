package serviceinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import home.HomeVO;

@Service
public class InfoServiceImpl implements InfoService {
	@Autowired
	InfoDAO dao;

	@Override
	public int getpaging() {
		return dao.getpaging();
	}
	
	@Override
	public List<InfoVO> infoPaging(PagingVO vo) {
		return dao.infoPaging(vo);
	}

	@Override
	public List<InfoVO> infoDetail(int info_num) {
		return dao.infoDetail(info_num);
	}
	
}
