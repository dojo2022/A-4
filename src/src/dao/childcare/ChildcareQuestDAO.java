package dao.childcare;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.childcare.ChildcareQuest;
import model.childcare.ChildcareQuestLabel;

public class ChildcareQuestDAO {
	public ArrayList<ChildcareQuest> getChildcareQuest(int family_id){
		Connection conn = null;
		ArrayList<ChildcareQuest> caList = new ArrayList<ChildcareQuest>();
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "SELECT * FROM CHILDCARE_QUEST as cq join childcare_quest_label as cqa "
						+ "on cq.label = cqa.CHILDCARE_QUEST_LABEL_ID where family_id = ? order by created_date";
				pStmt= conn.prepareStatement(sql);

				// SQL文を完成させる
				pStmt.setInt(1, family_id);


				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();
				// 結果表をコレクションにコピーする

				while (rs.next()) {
					ChildcareQuest ca = new ChildcareQuest();
					ca.setChildcare_quest_id(rs.getInt("childcare_quest_id"));
					ca.setFamily_id(rs.getInt("family_id"));
					ca.setTitle(rs.getString("title"));
					ca.setBody(rs.getString("body"));
					ca.setTime_limit(rs.getDate("time_limit"));
					ca.setLabel(rs.getString("content_label"));
					ca.setCompleted_flag(rs.getInt("completed_flag"));
					ca.setCreated_at(rs.getDate("created_date"));
					ca.setUpdated_date(rs.getDate("updatede_date"));
					caList.add(ca);
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		caList = null;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		caList = null;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				caList = null;
			}
		}
	}

	// 結果を返す
	return caList;
}

	public ArrayList<ChildcareQuestLabel> getChildcareQuestlabel(){
		Connection conn = null;
		ArrayList<ChildcareQuestLabel> labelList = new ArrayList<ChildcareQuestLabel>();
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "SELECT * FROM CHILDCARE_QUEST_LABEL";
				pStmt= conn.prepareStatement(sql);
				// SQL文を実行し、結果表を取得する
				ResultSet rs = pStmt.executeQuery();
				// 結果表をコレクションにコピーする

				while (rs.next()) {
					ChildcareQuestLabel cqlabel = new ChildcareQuestLabel();
					cqlabel.setChildcare_quest_label_id(rs.getInt("childcare_quest_label_id"));
					cqlabel.setContent_label(rs.getString("content_label"));
					labelList.add(cqlabel);
				}
	}
	catch (SQLException e) {
		e.printStackTrace();
		labelList = null;
	}
	catch (ClassNotFoundException e) {
		e.printStackTrace();
		labelList = null;
	}
	finally {
		// データベースを切断
		if (conn != null) {
			try {
				conn.close();
			}
			catch (SQLException e) {
				e.printStackTrace();
				labelList = null;
			}
		}
	}

	// 結果を返す
	return labelList;
}
}
