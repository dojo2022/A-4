package dao.weekly;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import model.user.User;
import model.weekly.WeeklyReport;

public class WeeklyReportDAO {
	public ArrayList<WeeklyReport> getWeeklyReportList(User user) {
		Connection conn = null;
		ArrayList<WeeklyReport> wrList = new ArrayList<WeeklyReport>();
		Date due_date=user.getDue_date();
		Date now_date = new Date();
		long lweek = 40 - (due_date.getTime()-now_date.getTime())/(1000*60*60*24*7);
		int week=(int)lweek;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "select * from weekly_report WHERE week = ? and (person='ママ' or person = '赤ちゃん')";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1, week);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			while(rs.next()) {
				WeeklyReport wr = new WeeklyReport();
				wr.setWeekly_report_id(rs.getInt("weekly_report_id"));
				wr.setWeek(rs.getInt("week"));
				wr.setPerson(rs.getString("person"));
				wr.setTitle(rs.getString("title"));
				wr.setBody(rs.getString("body"));
				wrList.add(wr);
				}

		}
		catch (SQLException e) {
			e.printStackTrace();
			wrList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			wrList = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					wrList = null;
				}
			}
		}

		// 結果を返す
		return wrList;
	}

	public WeeklyReport getWeeklyReport(int week,String person) {
		Connection conn = null;
		WeeklyReport wr =null;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;

				sql = "select * from weekly_report WHERE week = ? and person=?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1, week);
				pStmt.setString(2, person);

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				wr = new WeeklyReport();
				wr.setWeekly_report_id(rs.getInt("weekly_report_id"));
				wr.setWeek(rs.getInt("week"));
				wr.setPerson(rs.getString("person"));
				wr.setTitle(rs.getString("title"));
				wr.setBody(rs.getString("body"));
				}

		}
		catch (SQLException e) {
			e.printStackTrace();
			wr = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			wr = null;
		}
		finally {
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					wr = null;
				}
			}
		}

		// 結果を返す
		return wr;
	}
}
