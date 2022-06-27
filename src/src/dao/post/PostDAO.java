package dao.post;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.post.Post;

public class PostDAO {
	public ArrayList<Post> getPostList(){
		Connection conn = null;
		ArrayList<Post> pList = new ArrayList<Post>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


			// SQL文を準備する
			String sql;
			PreparedStatement pStmt;

			sql="SELECT * FROM post JOIN user on post.user_id = user.user_id order by created_at DESC LIMIT 50";
			pStmt= conn.prepareStatement(sql);


			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Post p = new Post();
				p.setPost_id(rs.getInt("post.post_id"));
				p.setUser_id(rs.getInt("post.user_id"));
				p.setNickname(rs.getString("user.nickname"));
				p.setTitle(rs.getString("post.title"));
				p.setBody(rs.getString("post.body"));
				p.setHeart(rs.getInt("post.heart"));
				p.setUseful(rs.getInt("post.useful"));
				p.setWeek(rs.getInt("post.week"));
				p.setGender(rs.getString("user.gender"));
				p.setCreated_at(rs.getDate("created_at"));

				pList.add(p);

			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pList = null;
				}
			}
		}

		// 結果を返す
		return pList;
	}

	public Boolean insertPost(int user_id, String title, String body, int week) {
		Connection conn = null;
		boolean result = false;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "insert into post (user_id, title, body, week ) values (?, ?, ?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);

			pStmt.setInt(1,user_id);
			pStmt.setString(2,title);
			pStmt.setString(3,body);
			pStmt.setInt(4, week);

			int upNum =pStmt.executeUpdate();

			if(upNum == 1) {
				result = true;
			}

		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}

		// 結果を返す
		return result;

	}

	public ArrayList<Post> getSearchPost(String searchtext){
		Connection conn = null;
		ArrayList<Post> pList = new ArrayList<Post>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


			// SQL文を準備する
			String sql;
			PreparedStatement pStmt;

			sql="SELECT * FROM post join user on post.user_id=user.user_id WHERE post.title like ? or post.body like ?";
			pStmt= conn.prepareStatement(sql);
			pStmt.setString(1, "%" + searchtext + "%");
			pStmt.setString(2, "%" + searchtext + "%");

			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				Post p = new Post();
				p.setPost_id(rs.getInt("post.post_id"));
				p.setUser_id(rs.getInt("post.user_id"));
				p.setNickname(rs.getString("user.nickname"));
				p.setTitle(rs.getString("post.title"));
				p.setBody(rs.getString("post.body"));
				p.setHeart(rs.getInt("post.heart"));
				p.setUseful(rs.getInt("post.useful"));
				p.setWeek(rs.getInt("post.week"));
				p.setGender(rs.getString("user.gender"));
				p.setCreated_at(rs.getDate("created_at"));

				pList.add(p);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
			pList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			pList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					pList = null;
				}
			}
		}

		// 結果を返す
		return pList;
	}
}
