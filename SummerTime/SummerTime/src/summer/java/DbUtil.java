package summer.java;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbUtil {
	private static DataSource dataSource;
	public static DataSource getDataSource(){
		Context initContext;
		try {
			initContext = new InitialContext();
			Context envContext=(Context)initContext.lookup("java:/comp/env");
			dataSource=(DataSource) envContext.lookup("jdbc/summertime");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return dataSource;
	}
	public static Connection getConnection(){
		String userName="sa";
		String password="123";
		String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		String url="jdbc:sqlserver://localhost:1433; DatabaseName=SummerTime";
		Connection conn=null;
		try{
			Class.forName(driver);
			conn=DriverManager.getConnection(url,userName,password);			
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;		
	}
}
