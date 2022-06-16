package dao.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.user.User;

public class UserDAO {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
	public User select(int user_id) {
		Connection conn = null;
		User user = new User();
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "select * from User WHERE user_id = ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setString(1, Integer.valueOf(user_id).toString());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
				rs.next();
				user.setName(rs.getString("name"));

		}
		catch (SQLException e) {
			e.printStackTrace();
			user = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			user = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					user = null;
				}
			}
		}

		// 結果を返す
		return user;
	}


}
