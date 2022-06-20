package dao.laborpain;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.laborpain.LaborPain;

public class LaborPainDAO {
	public LaborPain getLabor(int user_id) {
		Connection conn = null;
		LaborPain lp=null;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "SELECT * FROM LABOR_PAIN where user_id = ? order by start_time desc  limit 1;";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,user_id);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				lp = new LaborPain();
				lp.setLabor_pain_id(rs.getInt("labor_pain_id"));
				lp.setUser_id(rs.getInt("user_id"));
				lp.setStart_time(rs.getTimestamp("start_time"));
				lp.setStop_time(rs.getTimestamp("stop_time"));
				lp.setInterval(rs.getTime("Labor_interval"));
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
		return lp;
	}


	public boolean inLaborCheck(int user_id) {
		Connection conn = null;
		boolean flag=false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "SELECT * FROM LABOR_PAIN where user_id = ? order by start_time desc  limit 1;";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,user_id);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				if(rs.getTimestamp("stop_time") == null) {
					flag=true;
				}
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
		return flag;
	}
	public boolean createLaborPainRecord(LaborPain lp) {
		Connection conn = null;
		boolean flag=false;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "INSERT INTO LABOR_PAIN (user_id,start_time)";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,lp.getUser_id());

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				if(rs.getTimestamp("stop_time") == null) {
					flag=true;
				}
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
		return flag;
	}
}
