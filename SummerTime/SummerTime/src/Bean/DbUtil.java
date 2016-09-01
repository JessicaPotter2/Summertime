package Bean;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbUtil {
	static String url="jdbc:sqlserver://localhost:1433;DatabaseName=SummerTime";
	static String userName="sa";
	static String password="123";
	static Connection conn=null;
	public static Connection getConnection(){
		
		try{
			
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");	
			conn=DriverManager.getConnection(url,userName,password);
		}catch(ClassNotFoundException e){
			
		}		
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return conn;
	}
	

}