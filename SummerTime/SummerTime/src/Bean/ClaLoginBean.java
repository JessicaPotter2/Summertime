package Bean;

public class ClaLoginBean {

	public String ClassName;
	private String Email;
	private String PassWord;
	private String HeadPicture;
	public ClaLoginBean(){
	}
	public ClaLoginBean(String ClassName,String Email,String PassWord,String HeadPicture){
		this.ClassName=ClassName;
		this.setEmail(Email);
		this.setPassWord(PassWord);	
		this.setHeadPicture(HeadPicture);
	}
	
	public String getPassWord() {
		return PassWord;
	}
	public void setPassWord(String PassWord) {
		this.PassWord = PassWord;
	}
	public String getEmail() {
		return Email;
	}
	public void setEmail(String Email) {
		this.Email = Email;
	}
	public String getHeadPicture() {
		return HeadPicture;
	}
	public void setHeadPicture(String HeadPicture) {
		this.HeadPicture = HeadPicture;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String ClassName) {
		this.ClassName = ClassName;
	}
}

