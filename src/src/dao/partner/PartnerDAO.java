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

	public Partner getPartner(int partner_id){
		Connection conn = null;
		Partner p = new Partner();
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "select * from Partner WHERE partner_id = ?";
				pStmt= conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, partner_id);


				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();
				// 結果表をコレクションにコピーする
				if(rs.next()) {
					p.setPartner_id(rs.getInt("partner_id"));
					p.setFamily_id(rs.getInt("family_id"));
					p.setName(rs.getString("name"));
					p.setAttribute(rs.getString("attribute"));
					p.setAppetite(rs.getInt("appetite"));
					p.setSleepiness(rs.getInt("sleepiness"));
					p.setHumor(rs.getInt("humor"));
					p.setNausea(rs.getInt("nausea"));
					p.setStress(rs.getInt("stress"));
					p.setDizziness(rs.getInt("dizziness"));
					p.setFatigue(rs.getInt("fatigue"));
					p.setStiff_shoulder(rs.getInt("stiff_shoulder"));
					p.setHeadache(rs.getInt("headache"));
					p.setBackache(rs.getInt("backache"));
					p.setStomach_ache(rs.getInt("stomach_ache"));
					p.setFeeling(rs.getInt("feeling"));
					p.setTidying(rs.getInt("tidying"));
					p.setSelf_assertion(rs.getInt("self_assertion"));
					p.setPoop(rs.getInt("poop"));
					p.setTooth_brushing(rs.getInt("tooth_brushing"));
					p.setCreated_at(rs.getDate("created_at"));
					p.setUpdated_at(rs.getDate("updated_at"));
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		p = null;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		p = null;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				p = null;
			}
		}
	}

	// 結果を返す
	return p;
}

	public boolean updatePartner(Partner p){
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

				sql = "update Partner set "
						+ "name = ?,"
						+ "attribute = ?,"
						+ "appetite=?,"
						+ "sleepiness=?,"
						+ "humor=?,"
						+ "nausea=?,"
						+ "stress=?,"
						+ "dizziness=?,"
						+ "fatigue=?,"
						+ "stiff_shoulder=?,"
						+ "headache=?,"
						+ "backache=?,"
						+ "stomach_ache=?,"
						+ "feeling=?,"
						+ "tidying=?,"
						+ "self_assertion=?,"
						+ "poop =?,"
						+ "tooth_brushing=?"
						+ "WHERE partner_id = ?";
				pStmt= conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, p.getName());
				pStmt.setInt(2, p.getAttribute_id());
				pStmt.setInt(3, p.getAppetite());
				pStmt.setInt(4, p.getSleepiness());
				pStmt.setInt(5, p.getHumor());
				pStmt.setInt(6, p.getNausea());
				pStmt.setInt(7, p.getStress());
				pStmt.setInt(8, p.getDizziness());
				pStmt.setInt(9, p.getFatigue());
				pStmt.setInt(10, p.getStiff_shoulder());
				pStmt.setInt(11, p.getHeadache());
				pStmt.setInt(12, p.getBackache());
				pStmt.setInt(13, p.getStomach_ache());
				pStmt.setInt(14, p.getFeeling());
				pStmt.setInt(15, p.getTidying());
				pStmt.setInt(16, p.getSelf_assertion());
				pStmt.setInt(17, p.getPoop());
				pStmt.setInt(18, p.getTooth_brushing());
				pStmt.setInt(19, p.getPartner_id());




				// SQL文を実行し、結果表を取得する
				int rs =pStmt.executeUpdate();
				// 結果表をコレクションにコピーする
				if(rs == 1) {
					flag = true;
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		flag = false;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		flag = false;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
	}

	// 結果を返す
	return flag;
}

	public boolean createPartner(Partner p){
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

				sql = "insert into  Partner (name,attribute,appetite,sleepiness,humor,nausea,"
						+ "stress,dizziness,fatigue,stiff_shoulder,headache,backache,stomach_ache, "
						+ "feeling,tidying,self_assertion,poop,tooth_brushing,family_id)"
						+ "values(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
				pStmt= conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setString(1, p.getName());
				pStmt.setInt(2, p.getAttribute_id());
				pStmt.setInt(3, p.getAppetite());
				pStmt.setInt(4, p.getSleepiness());
				pStmt.setInt(5, p.getHumor());
				pStmt.setInt(6, p.getNausea());
				pStmt.setInt(7, p.getStress());
				pStmt.setInt(8, p.getDizziness());
				pStmt.setInt(9, p.getFatigue());
				pStmt.setInt(10, p.getStiff_shoulder());
				pStmt.setInt(11, p.getHeadache());
				pStmt.setInt(12, p.getBackache());
				pStmt.setInt(13, p.getStomach_ache());
				pStmt.setInt(14, p.getFeeling());
				pStmt.setInt(15, p.getTidying());
				pStmt.setInt(16, p.getSelf_assertion());
				pStmt.setInt(17, p.getPoop());
				pStmt.setInt(18, p.getTooth_brushing());
				pStmt.setInt(19, p.getFamily_id());

				// SQL文を実行し、結果表を取得する
				int rs =pStmt.executeUpdate();
				// 結果表をコレクションにコピーする
				if(rs == 1) {
					flag = true;
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		flag = false;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		flag = false;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				flag = false;
			}
		}
	}

	// 結果を返す
	return flag;
}
}
