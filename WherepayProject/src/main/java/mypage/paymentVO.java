package mypage;

public class paymentVO {
	
	String paydate;
	int money;
	int z_num;
	int pay_num;
	int u_num;
	int mas_num;
	int sam_num;
	String memo;
	
	String sam_name;
	String z_name;
	String name;
	int total;
	
	public paymentVO() {};
	
	public paymentVO(paymentVO vo) {
		setPaydate(getPaydate());
		setMoney(getMoney());
		setSam_name(getSam_name());
		setZ_name(getZ_name());
	};
	
	
	public String getSam_name() {
		return sam_name;
	}
	public void setSam_name(String sam_name) {
		this.sam_name = sam_name;
	}
	public String getZ_name() {
		return z_name;
	}
	public void setZ_name(String z_name) {
		this.z_name = z_name;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}

	
	
	public String getPaydate() {
		return paydate;
	}
	public void setPaydate(String paydate) {
		this.paydate = paydate;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
	public int getZ_num() {
		return z_num;
	}
	public void setZ_num(int z_num) {
		this.z_num = z_num;
	}
	public int getPay_num() {
		return pay_num;
	}
	public void setPay_num(int pay_num) {
		this.pay_num = pay_num;
	}
	public int getU_num() {
		return u_num;
	}
	public void setU_num(int u_num) {
		this.u_num = u_num;
	}
	public int getMas_num() {
		return mas_num;
	}
	public void setMas_num(int mas_num) {
		this.mas_num = mas_num;
	}
	public int getSam_num() {
		return sam_num;
	}
	public void setSam_num(int sam_num) {
		this.sam_num = sam_num;
	}

	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}
	
	
	

	
	

}
