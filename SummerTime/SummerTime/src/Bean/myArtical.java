package Bean;

import java.sql.Date;

public class myArtical {
	private int Id;
	private Date logdate;
	private String intro;
	private String media;
	private String loglike;
	private String comment;
	private String logContent;
	private String username;
	public int getId() {
		return Id;
	}
	public void setId(int Id) {
		this.Id = Id;
	}
	public String getintro() {
		return intro;
	}
	public void setintro(String intro) {
		this.intro = intro;
	}
	public Date getlogdate() {
		return logdate;
	}
	public void setlogdate(Date logdate) {
		this.logdate = logdate;
	}
	public String getcomment() {
		return comment;
	}
	public void setcomment(String comment) {
		this.comment = comment;
	}
	public String getlogContent() {
		return logContent;
	}
	public void setlogComtent(String logContent) {
		this.logContent = logContent;
	}
	public String getloglike() {
		return loglike;
	}
	public void setloglike(String loglike) {
		this.loglike = loglike;
	}
	public String getusername() {
		return username;
	}
	public void setusername(String username) {
		this.username = username;
	}
	public String getmedia() {
		return media;
	}
	public void setmedia(String media) {
		this.media = media;
	}
}
