package db.zafu;
import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
	public static Connection get_Connection()
	{
		Connection conn=null;
		try{
			Class.forName( "com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/liuyanban", 
					  "root",
					"951212" ); 
		}
		catch( Exception ex ){
			System.out.println("lianjieshibai\n");
		}		
		return conn;		
	}
}
