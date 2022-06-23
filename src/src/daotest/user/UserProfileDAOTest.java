package daotest.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UserProfileDAOTest {

	public static void main(String[] args) {
		System.out.println("---------- updateUserのテスト ----------");
		//getLaborPainTest();	// ユーザーが見つかる場合のテスト

	}


	public boolean updateUser(String name, String nickname, String post_code, String address, String tel, Date birthday, String gender, Date due_date) {
		Connection conn = null;
		boolean result = false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "update User (name, nickname, post_code, address, tel, birthday, gender, due_date) SET (ムバッペ,俊三,,?,?,?,?,?) WHERE user_id = ?";
				pStmt= conn.prepareStatement(sql);

				// SQL文を実行する
				if (pStmt.executeUpdate() == 1) {
					result = true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				result = false;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				result = false;
			}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					result = false;
				}
			}
		}

		// 結果を返す
		return result;
	}

}