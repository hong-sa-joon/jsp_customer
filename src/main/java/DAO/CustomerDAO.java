package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DTO.Customer;

public class CustomerDAO {

	final static String JDBC_DRIVER = "oracle.jdbc.driver.OracleDriver";
	final static String JDBC_URL = "jdbc:oracle:thin:@localhost:1521:xe";

	// 데이터 베이스 연결 메소드
	public Connection open() {
		Connection conn = null;

		try {
			Class.forName(JDBC_DRIVER);
			conn = DriverManager.getConnection(JDBC_URL, "test", "test1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}

	// 고객 리스트 가져오는 메소드
	public ArrayList<Customer> getList() throws Exception {
		Connection conn = open();
		ArrayList<Customer> customerList = new ArrayList<>();

		String sql = "SELECT CUSTOMER_ID,NAME,PHONE,GRADE FROM CUSTOMER order by customer_id";
		PreparedStatement pstmt = conn.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();

		try (conn; pstmt; rs) {
			while (rs.next()) {
				Customer c = new Customer();
				c.setCustomer_id(rs.getInt("customer_id"));
				c.setName(rs.getString("name"));
				c.setPhone(rs.getString("phone"));
				c.setGrade(rs.getString("grade"));
				customerList.add(c);
			}
		}
		return customerList;

	}

	// 고객 정보 가져오는 메소드
	public Customer getView(int customer_id) throws Exception {
		Connection conn = open();
		Customer c = new Customer();

		String sql = "SELECT CUSTOMER_ID, NAME, ADDRESS, PHONE, GENDER, AGE, POINT, GRADE, IMG FROM CUSTOMER WHERE CUSTOMER_ID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, customer_id); // 물음표에 들어갈 값을 반드시 먼저 지정
		ResultSet rs = pstmt.executeQuery();

		try (conn; pstmt; rs) {
			while (rs.next()) {
				c.setCustomer_id(rs.getInt("customer_id"));
				c.setName(rs.getString("name"));
				c.setAddress(rs.getString("address"));
				c.setPhone(rs.getString("phone"));
				c.setGender(rs.getString("gender"));
				c.setAge(rs.getInt("age"));
				c.setPoint(rs.getInt("point"));
				c.setGrade(rs.getString("grade"));
				c.setImg(rs.getString("img"));
			}
		}

		return c;
	}
	// 고객 등록 메소드

	public void insertCustomer(Customer c) throws Exception {
		Connection conn = open();
		String sql = "insert into customer values(customer_seq.nextval,?,?,?,?,?,?,?,?)";
		PreparedStatement pstmt = conn.prepareStatement(sql);

		try (conn; pstmt) {
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getAddress());
			pstmt.setString(3, c.getPhone());
			pstmt.setString(4, c.getGender());
			pstmt.setInt(5, c.getAge());
			pstmt.setInt(6, c.getPoint());
			pstmt.setString(7, c.getGrade());
			pstmt.setString(8, c.getImg());
			pstmt.executeUpdate();
		}
	}

	// 고객 정보 수정 메소드
	public void updateCustomer(Customer c) throws Exception {
		Connection conn = open();
		String sql = "UPDATE CUSTOMER SET name = ?, address = ?, phone = ?, img = ? WHERE customer_id = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		try (conn; pstmt) {
			pstmt.setString(1, c.getName());
			pstmt.setString(2, c.getAddress());
			pstmt.setString(3, c.getPhone());
			pstmt.setString(4, c.getImg());
			pstmt.setInt(5, c.getCustomer_id());

			if (pstmt.executeUpdate() != 1) {
				throw new Exception("수정된 글이 없습니다.");
			}
		}
	}

	// 고객삭제 메소드
	public void deleteCustomer(int customer_id) throws Exception {

		Connection conn = open();
		String sql = "DELETE FROM CUSTOMER WHERE CUSTOMER_ID = ?";

		PreparedStatement pstmt = conn.prepareStatement(sql);

		try (conn; pstmt) {
			pstmt.setInt(1, customer_id);

			// 삭제된 글이 없을경우
			if (pstmt.executeUpdate() != 1) {
				throw new Exception("삭제된 글이 없습니다.");
			}
		}
	}
}
