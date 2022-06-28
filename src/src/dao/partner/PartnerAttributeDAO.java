package dao.partner;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.partner.PartnerAttribute;

public class PartnerAttributeDAO {
	public ArrayList<PartnerAttribute> getPartnerAttribute(){
		Connection conn = null;
		ArrayList<PartnerAttribute> paList = new ArrayList<PartnerAttribute>();
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "select * from  partner_attribute ";
				pStmt= conn.prepareStatement(sql);

				// SQL文を完成させる


				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();
				// 結果表をコレクションにコピーする
				while (rs.next()) {
					PartnerAttribute pa= new PartnerAttribute();
					pa.setPartner_attribute_id(rs.getInt("partner_attribute_id"));
					pa.setPartner_attribute_name(rs.getString("partner_attribute_name"));
					paList.add(pa);
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		paList = null;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		paList = null;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				paList = null;
			}
		}
	}

	// 結果を返す
	return paList;
}
}
