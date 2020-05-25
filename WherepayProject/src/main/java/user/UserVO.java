package user;

public class UserVO {
   
   
   //회원가입
   int u_num;
   String id;
   String pw;
   String name;
   String phone;
   String addr;
   String howtoget;
   int confirm;
   int mas_num;
   String familynum;

   String jumin;
   



   public UserVO() {};

   //회원가입 insert할 때 담아갈 vo
   public UserVO(UserVO vo) {
      setName(getName());
      setJumin(getJumin());
      setId(getId());
      setPw(getPw());
      setPhone(getPhone());
      setAddr(getAddr());
      setFamilynum(getFamilynum());
      setHowtoget(getHowtoget());
      
      setMas_num(getMas_num());
      
      
      //세대주 기가입자 체크용
      setConfirm(getConfirm());
      
   }
   

   

   public String getJumin() {
      return jumin;
   }


   public void setJumin(String jumin) {
      this.jumin = jumin;
   }

   public int getU_num() {
      return u_num;
   }
   public void setU_num(int u_num) {
      this.u_num = u_num;
   }
   public String getId() {
      return id;
   }
   public void setId(String id) {
      this.id = id;
   }
   public String getPw() {
      return pw;
   }
   public void setPw(String pw) {
      this.pw = pw;
   }
   public String getName() {
      return name;
   }
   public void setName(String name) {
      this.name = name;
   }
   public String getPhone() {
      return phone;
   }
   public void setPhone(String phone) {
      this.phone = phone;
   }
   public String getAddr() {
      return addr;
   }
   public void setAddr(String addr) {
      this.addr = addr;
   }
   public String getHowtoget() {
      return howtoget;
   }
   public void setHowtoget(String howtoget) {
      this.howtoget = howtoget;
   }
   public int getConfirm() {
      return confirm;
   }
   public void setConfirm(int confirm) {
      this.confirm = confirm;
   }
   public int getMas_num() {
      return mas_num;
   }
   public void setMas_num(int mas_num) {
      this.mas_num = mas_num;
   }
   public String getFamilynum() {
      return familynum;
   }
   public void setFamilynum(String familynum) {
      this.familynum = familynum;
   }


   
   
   
}