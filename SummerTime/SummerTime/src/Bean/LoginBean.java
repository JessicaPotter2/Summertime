package Bean;

public class LoginBean {
	public String ClassName;
	private String username;
	private String password;
	private String email;
	private String StuId;
	public LoginBean(){
	}
	public LoginBean(String ClassName,String username,String password,String email,String StuId){
		this.ClassName=ClassName;
		this.setUsername(username);
		this.setPassword(password);
		this.setEmail(email);
		this.setStuId(StuId);
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getStuId() {
		return StuId;
	}
	public void setStuId(String stuId) {
		this.StuId = stuId;
	}
	public String getClassName() {
		return ClassName;
	}
	public void setClassName(String ClassName) {
		this.ClassName = ClassName;
	}
}
