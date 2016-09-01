package Bean;

public class addphotobean {
	private int ClassId;
	private int PictureId;
	private String PicName;
	private String Path;
	private String Thumbnail;
	private String Pname;
	private String Description;
	private String Time;
	private String State;
	private String username;
	public String getDescription(){
		return Description;
	}
	public void setDescription(String Description){
		this.Description=Description;
	}
	public int getClassId(){
		return ClassId;
	}
	public void setClassId(int ClassId){
		this.ClassId=ClassId;
	}
	public String getPicName(){
		return PicName;
	}
	public void setPicName(String PicName){
		this.PicName=PicName;
	}
	public int getPictureId(){
		return PictureId;
	}
	public void setPictureId(int PictureId){
		this.PictureId=PictureId;
	}
	public String getTime(){
		return Time;
	}
	public void setTime(String Time){
		this.Time=Time;
	}
	public String getThumbnail() {
		return Thumbnail;
	}
	public void setThumbnail(String thumbnail) {
		Thumbnail = thumbnail;
	}
	public String getPath() {
		return Path;
	}
	public void setPath(String path) {
		Path = path;
	}
	public String getPname() {
		return Pname;
	}
	public void setPname(String pname) {
		Pname = pname;
	}
	public String getState() {
		return State;
	}
	public void setState(String state) {
		State = state;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
}
