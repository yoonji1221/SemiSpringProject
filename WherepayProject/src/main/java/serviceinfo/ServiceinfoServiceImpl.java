package serviceinfo;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ServiceinfoServiceImpl implements ServiceinfoService {
	@Autowired
	ServiceinfoDAO dao;

}
