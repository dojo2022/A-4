package dao.partner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.partner.Partner;

public class PartnerDAO {
	public ArrayList<Partner> selectFamilyPartner(int family_id){
		Connection conn = null;
		ArrayList<Partner> PartnerList = new ArrayList<Partner>();
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "select * from Partner as p  join partner_attribute as pa on p.attribute = pa.partner_attribute_id"
						+ " WHERE family_id = ? ORDER BY family_id";
				pStmt= conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, family_id);


				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();
				// 結果表をコレクションにコピーする
				while (rs.next()) {
					Partner card = new Partner();
					card.setPartner_id(rs.getInt("partner_id"));
					card.setFamily_id(rs.getInt("family_id"));
					card.setName(rs.getString("name"));
					card.setAttribute(rs.getString("partner_attribute_name"));
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
					card.setFeeling(rs.getInt("feeling"));
					card.setTidying(rs.getInt("tidying"));
					card.setSelf_assertion(rs.getInt("self_assertion"));
					card.setPoop(rs.getInt("poop"));
					card.setTooth_brushing(rs.getInt("tooth_brushing"));
					card.setCreated_at(rs.getDate("created_at"));
					card.setUpdated_at(rs.getDate("updated_at"));
					PartnerList.add(card);
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		PartnerList = null;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		PartnerList = null;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				PartnerList = null;
			}
		}
	}

	// 結果を返す
	return PartnerList;
}
}
