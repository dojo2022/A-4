package dao.user;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.TreeSet;

import org.joda.time.LocalDate;

import model.user.UserCondition;

public class UserConditionDAO {
	public Boolean insert(UserCondition uc ){
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

	          sql = "insert into user_condition (partner_id, weight, body_temparture, text, appetite, sleepiness, humor, nausea, stress, dizziness, fatigue, stiff_shoulder, headache, backache, stomach_ache, feeling, tidying, self_assertion, poop, tooth_brushing) "
	          		+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ? ,? ,?)";
	          pStmt= conn.prepareStatement(sql);
	          // SQL文を完成させる
	          pStmt.setInt(1, uc.getPartner_id());
	          pStmt.setDouble(2, uc.getWeight());
	          pStmt.setDouble(3, uc.getBody_temparture());
	          pStmt.setString(4, uc.getText());
	          pStmt.setInt(5, uc.getAppetite());
	          pStmt.setInt(6, uc.getSleepiness());
	          pStmt.setInt(7, uc.getHumor());
	          pStmt.setInt(8, uc.getNausea());
	          pStmt.setInt(9, uc.getStress());
	          pStmt.setInt(10, uc.getDizziness());
	          pStmt.setInt(11, uc.getFatigue());
	          pStmt.setInt(12, uc.getStiff_shoulder());
	          pStmt.setInt(13, uc.getHeadache());
	          pStmt.setInt(14, uc.getBackache());
	          pStmt.setInt(15, uc.getStomach_ache());
	          pStmt.setInt(16, uc.getFeeling());
	          pStmt.setInt(17, uc.getTidying());
	          pStmt.setInt(18, uc.getSelf_assertion());
	          pStmt.setInt(19, uc.getPoop());
	          pStmt.setInt(20, uc.getTooth_brushing());
			int upNum = pStmt.executeUpdate();


				// SQL文を実行する
				if (upNum == 1) {
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

public ArrayList<UserCondition> select(int family_id){
	Connection conn = null;
	ArrayList<UserCondition> ucList = new ArrayList<UserCondition>();
	try {
		// JDBCドライバを読み込む
		Class.forName("org.h2.Driver");

		// データベースに接続する
		conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


		// SQL文を準備する
		String sql;
		PreparedStatement pStmt;

		sql = "select * from partner join user_condition on partner.partner_id = user_condition.partner_id"
				+ " WHERE partner.family_id = ? and created_at = ?";
		pStmt= conn.prepareStatement(sql);

		pStmt.setInt(1,family_id);
		LocalDate today = LocalDate.now();
		pStmt.setString(2,today+"%");

		ResultSet rs = pStmt.executeQuery();

		while(rs.next()) {
			UserCondition card = new UserCondition();
			card.setPartner_id(rs.getInt("partner_id"));
			card.setWeight(rs.getFloat("weight"));
			card.setBody_temparture(rs.getFloat("body_temparture"));
			card.setText(rs.getString("text"));
			card.setAppetite(rs.getInt("appetite"));
			card.setSleepiness(rs.getInt("sleepiness"));
			card.setHumor(rs.getInt("humor"));
			card.setNausea(rs.getInt("nausea"));
			card.setStress(rs.getInt("stress"));
			card.setDizziness(rs.getInt("dizziness"));
			card.setFatigue(rs.getInt("fatigue"));
			card.setStiff_shoulder(rs.getInt("stiff_shoulder"));
			card.setHeadache(rs.getInt("headache"));
			card.setBackache(rs.getInt("backache"));
			card.setStomach_ache(rs.getInt("stomach_ache"));
			card.setFeeling(rs.getInt("feeleng"));
			card.setTidying(rs.getInt("tidying"));
			card.setSelf_assertion(rs.getInt("self_assertion"));
			card.setPoop(rs.getInt("poop"));
			card.setTooth_brushing(rs.getInt("tooth_brushing"));
			card.setCreated_at(rs.getDate("created_at"));
			ucList.add(card);
		}
	}
	catch (SQLException e) {
		e.printStackTrace();
		ucList = null;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		ucList = null;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				ucList = null;
			}
		}
	}

	// 結果を返す
	return ucList;
	}


	public TreeSet<Integer> selectRecordedDay(int family_id,int year,int month) {
		Connection conn = null;
		TreeSet<Integer> dayList = new TreeSet<Integer>();
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

				// SQL文を準備する

				String sql;
				PreparedStatement pStmt;

				sql = "select DISTINCT user_condition.created_at from partner join user_condition on partner.partner_id = user_condition.partner_id"
						+ " WHERE partner.family_id = ? and user_condition.created_at like ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,family_id);

				String year_month ;
				if(String.valueOf(month).length()==1) {
					year_month=year+"-0"+month;

				}else {
					year_month=year+"-"+month;
				}
				pStmt.setString(2,year_month+"%");



				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();
				// 結果表をコレクションにコピーする
				while(rs.next()) {
					Date d=rs.getDate("created_at");
							int day = d.getDate();
							dayList.add(day);
				}

				}
				catch (SQLException e) {
					e.printStackTrace();
					dayList = null;
				}
				catch (ClassNotFoundException e) {
					e.printStackTrace();
					dayList = null;
				}
				finally {
					// データベースを切断
					if (conn != null) {
						try {
							conn.close();
						}
						catch (SQLException e) {
							e.printStackTrace();
							dayList = null;
						}
					}
				}

				// 結果を返す
				return dayList;
			}
	public int countRecord(int partner_id) {
		Connection conn = null;
		int todayRecord = 0;

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			String sql;
			PreparedStatement pStmt;
				sql = "SELECT count(*) FROM user_condition WHERE partner_id = ? and created_at like ?;";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,partner_id);
				LocalDate today = LocalDate.now();
				pStmt.setString(2, today+"%");

			// SQL文を実行し、結果表を取得する
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする
			if(rs.next()) {
				todayRecord = rs.getInt("count(*)");
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
		return todayRecord;
	}
}
