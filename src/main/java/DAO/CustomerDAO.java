package DAO;

import java.sql.Connection;
import java.sql.DriverManager;

public class CustomerDAO {

	final static String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String JDBC_URL= "jdbc:oracle:thin:@localhost:1521:xe";
	
	//데이터 베이스 연결 메소드
	public Connection open() {
		Connection conn = null;
		
		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL,"test","1234");
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	
	
}
