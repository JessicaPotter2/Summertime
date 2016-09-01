package Login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import Bean.DbUtil;
import Bean.ClaLoginBean;

public class ClaOperation {
	public int isExists(String ClassName) {
		String sql = "select*from ClassInfo where ClassName=?";
		Connection conn = DbUtil.getConnection();
		PreparedStatement psm = null;
		ResultSet rs = null;
		ClaLoginBean user = null;
		try {
			psm = (PreparedStatement) conn.prepareStatement(sql);
			
			psm.setString(1, ClassName);
			rs = (ResultSet) psm.executeQuery();
			if (rs.next()) {
				user = new ClaLoginBean();
				
				user.setEmail(rs.getString("Email"));
				user.setPassWord(rs.getString("PassWord"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if (user != null) {
			return 1;
		}
		return 0;
	}

	public int addCla(String ClassName, String Email, String PassWord) {

		String sql = "insert into ClassInfo(ClassName,Email,PassWord)values(?,?,?)";
		Connection conn = DbUtil.getConnection();
		PreparedStatement psm = null;
		int num = 0;
		try {
			psm = (PreparedStatement) conn.prepareStatement(sql);
			psm.setString(1, ClassName);
			psm.setString(2, Email);
			psm.setString(3, PassWord);
			
			num = psm.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return num;
	}

	public void updateCla(String sql) {
		try {
			Connection conn = DbUtil.getConnection();
			Statement stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			stmt.close();
			conn.close();
		} catch (SQLException ee) {
			System.out.println(ee.getMessage());
		}
	}

	public ResultSet query(String sql) throws Exception {
		// TODO Auto-generated method stub
		ResultSet rs = null;
		try {
			Connection conn = DbUtil.getConnection();
			Statement stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			return rs;
		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
		return null;
	}
}
