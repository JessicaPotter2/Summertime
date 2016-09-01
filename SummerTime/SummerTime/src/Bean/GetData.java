package Bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class GetData {
	public List getphotos(){
		List photosList= new ArrayList();		
		try {
			Connection conn=DbUtil.getConnection();
			String sql="select * from PictureInfo where State='1' order by Time";
			addphotobean photos=null;
			PreparedStatement stmt=conn.prepareStatement(sql);
			ResultSet rs= stmt.executeQuery();
			while(rs.next()){
				photos=new addphotobean();
				photos.setClassId(rs.getInt("ClassId"));
				photos.setPictureId(rs.getInt("PictureId"));
				photos.setPicName(rs.getString("PicName"));
				photos.setUsername(rs.getString("username"));
				photos.setDescription(rs.getString("description"));
				photos.setTime(rs.getString("Time"));
				photos.setState(rs.getString("State"));
				photos.setPath(rs.getString("Path"));
				photos.setThumbnail(rs.getString("Thumbnail"));
				photos.setPname(rs.getString("Pname"));
				photosList.add(photos);
			} 
			stmt.close();
			conn.close();
			rs.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return photosList;
}
}
