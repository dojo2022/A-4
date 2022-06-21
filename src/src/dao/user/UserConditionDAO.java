package dao.user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

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
	          		+ "value (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ? ,?, ? ,? ,?)";
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
}
