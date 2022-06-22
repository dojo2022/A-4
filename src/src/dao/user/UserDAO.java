package dao.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.user.User;

public class UserDAO {
	// 引数paramで検索項目を指定し、検索結果のリストを返す
	public User getUser(int user_id) {
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
			if(rs.next()) {
				user = new User();
				user.setUser_id(rs.getInt("user_id"));
				user.setEmail(rs.getString("email"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("nickname"));
				user.setPost_code(rs.getString("post_code"));
				user.setAddress(rs.getString("address"));
				user.setBirthday(rs.getDate("birthday"));
				user.setGender(rs.getString("gender"));
				user.setTel(rs.getString("tel"));
				user.setFamily_id(rs.getInt("family_id"));
				user.setDue_date(rs.getDate("due_date"));
				user.setCreated_at(rs.getTimestamp("created_at"));
				user.setUpdated_at(rs.getTimestamp("updated_at"));
				user.setLogin_time(rs.getTimestamp("login_time"));
				user.setLogout_time(rs.getTimestamp("logout_time"));
				}

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
	public User getUser(String email,String password) {
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

				sql = "select * from User WHERE email = ? and password = ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setString(1, email);
				pStmt.setString(2, password);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
				if(rs.next()) {
				user.setUser_id(rs.getInt("user_id"));
				user.setName(rs.getString("name"));
				user.setNickname(rs.getString("Nickname"));
				user.setPost_code(rs.getString("post_code"));
				user.setAddress(rs.getString("address"));
				user.setBirthday(rs.getDate("birthday"));
				user.setGender(rs.getString("gender"));
				user.setTel(rs.getString("tel"));
				user.setFamily_id(rs.getInt("family_id"));
				user.setDue_date(rs.getDate("due_date"));
				user.setCreated_at(rs.getTimestamp("created_at"));
				user.setUpdated_at(rs.getTimestamp("updated_at"));
				user.setLogin_time(rs.getTimestamp("login_time"));
				user.setLogout_time(rs.getTimestamp("logout_time"));
				}
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

	public User login(String email, String password) {
		Connection conn = null;
		User user = null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "update user set login_time = now() where exists("
						+ "select * from user where email = ? and password = ?)";
				pStmt= conn.prepareStatement(sql);
				pStmt.setString(1,email);
				pStmt.setString(2,password);
			// SQL文を実行し、結果表を取得する
			int rc = pStmt.executeUpdate();
			if(rc!=0) {
				sql="select * from user where email = ? and password = ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setString(1,email);
				pStmt.setString(2,password);

				ResultSet rs = pStmt.executeQuery();
				if(rs.next()) {
					user = new User();
					user.setUser_id(rs.getInt("user_id"));
					user.setEmail(rs.getString("email"));
					user.setName(rs.getString("name"));
					user.setNickname(rs.getString("nickname"));
					user.setPost_code(rs.getString("post_code"));
					user.setAddress(rs.getString("address"));
					user.setBirthday(rs.getDate("birthday"));
					user.setGender(rs.getString("gender"));
					user.setTel(rs.getString("tel"));
					user.setFamily_id(rs.getInt("family_id"));
					user.setDue_date(rs.getDate("due_date"));
					user.setCreated_at(rs.getTimestamp("created_at"));
					user.setUpdated_at(rs.getTimestamp("updated_at"));
					user.setLogin_time(rs.getTimestamp("login_time"));
					user.setLogout_time(rs.getTimestamp("logout_time"));
					}
			}


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

		return user;

	}



//メールアドレスがすでにあるかチェック
	public Boolean existCheck(String email){
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

	          sql = "select count(*) from User WHERE email = ?";
	          pStmt= conn.prepareStatement(sql);
	          // SQL文を完成させる
	          pStmt.setString(1,email);

	          // SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();

				// 結果表をコレクションにコピーする
				rs.next();
	          if (rs.getInt("count(*)") == 1) {
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
			catch (NullPointerException e) {
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

	//アカウント作成
	public boolean createAccount(String email, String password, int family_id){
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

	          sql = "insert into User (email, password, family_id) values (?, ?, ?)";
				pStmt= conn.prepareStatement(sql);
				pStmt.setString(1, email);
				pStmt.setString(2, password);
				pStmt.setInt(3, family_id);

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

			return result;
		}

	//プロフィール編集
	public boolean updateUser(String name,String nickname,String post_code,String address,String tel,Date birthday,String gender,Date due_date,int user_id) {
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

				sql = "update User (name, nickname, post_code, address, tel, birthday, gender, due_date) SET (?,?,?,?,?,?,?,?) WHERE user_id = ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setString(1, name);
				pStmt.setString(2, nickname);
				pStmt.setString(3, post_code);
				pStmt.setString(4, address);
				pStmt.setString(5, tel);
				pStmt.setDate(6, birthday);
				pStmt.setString(7, gender);
				pStmt.setDate(8, due_date);
				pStmt.setString(9, Integer.valueOf(user_id).toString());

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