package lawtion.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnDAO {
	static String url = "jdbc:oracle:thin:@localhost:1521:xe";
	static String user = "scott";
	static String pass = "tiger";
	static Connection conn;
	
	public static Connection getConnection(){
		try{
			Class.forName("oracle.jdbc.OracleDriver");
			conn = DriverManager.getConnection(url, user, pass);
		}catch(Exception e){
			e.printStackTrace();
		}
		return conn;
	}

}
