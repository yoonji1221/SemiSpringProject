package user;

public class MasVO {
	
	
	int mas_num;
	String mas_name;
	String jumin;
	String name;
	
	public MasVO() {}
	
public MasVO(MasVO vo) {
		setJumin(vo.getJumin());
		setName(vo.getName());
	}
	
	
	public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}

	public int getMas_num() {
		return mas_num;
	}
	public void setMas_num(int mas_num) {
		this.mas_num = mas_num;
	}
	
	public String getMas_name() {
		return mas_name;
	}
	public void setMas_name(String mas_name) {
		this.mas_name = mas_name;
	}
	
	public String getJumin() {
		return jumin;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}

	

}
