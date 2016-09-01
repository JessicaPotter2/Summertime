package Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Bean.*;


public class UserOperation {
	public int isExists(String username,String ClassName )  {
		String sql="select * from StudentInfo where username=?and ClassName=? ";
		Connection conn=DbUtil.getConnection();
		PreparedStatement psm=null;
		ResultSet rs=null;
		LoginBean user=null;
		try{
			psm=(PreparedStatement)conn.prepareStatement(sql);
			psm.setString(2, username);
			psm.setString(1, ClassName);
			
			rs=(ResultSet)psm.executeQuery();
			if(rs.next())
			{ 
				
			    user=new LoginBean();
				user.setStuId(rs.getString("StuId"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (user != null) {
			return 1;
		}
		return 0;
	}
	
	public int addUser(String ClassName,String username,String StuId,String email,String password){
		
		String sql="insert into StudentInfo(ClassName,username,StuId,email,password)values(?,?,?,?,?)";
		Connection conn=DbUtil.getConnection();
		PreparedStatement psm=null;
		int num=0;
		try{
			psm=(PreparedStatement)conn.prepareStatement(sql);
			psm.setString(1, ClassName);
			psm.setString(2, username);
			psm.setString(3, StuId);
			psm.setString(4, email);
			psm.setString(5, password);
			num=psm.executeUpdate();
		}catch (SQLException e){
			e.printStackTrace();
		}
		return num;
	}
	public void updateUser(String sql){
		try{
		Connection conn=DbUtil.getConnection();
		Statement stmt=conn.createStatement();
		stmt.executeUpdate(sql);
		stmt.close();
		conn.close();
		}catch (SQLException ee){
			System.out.println(ee.getMessage());
		}
	}
	public ResultSet query(String sql) throws Exception {
		// TODO Auto-generated method stub
		ResultSet rs=null;
		try{
			Connection conn=DbUtil.getConnection();
			Statement stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			return rs;
		}
		catch (SQLException e){
			System.out.println(e.getMessage());
		}
		return null;
	}
}
