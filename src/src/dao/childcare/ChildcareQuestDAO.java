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
	public ArrayList<ChildcareQuest> getChildcareQuest(int family_id ,String sort,String completed_flag,String label){
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

				if(sort.equals("")) {sort = "created_date";}
				if(completed_flag.equals("")) {completed_flag="%";}
				sql = "SELECT * FROM CHILDCARE_QUEST as cq join childcare_quest_label as cqa "
						+ "on cq.label = cqa.CHILDCARE_QUEST_LABEL_ID where family_id = ? "
						+ "and content_label like ? and completed_flag like '"+completed_flag+"' order by "+sort;

				//and completed_flag like ?
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1, family_id);
				if(label.equals("")) {label="%";}
				pStmt.setString(2, label);


				//pStmt.setString(3, completed_flag);


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
					ca.setLabel_id(rs.getInt("label"));
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

	public boolean createChildcareQuestlabel(ChildcareQuest cq){
		Connection conn = null;
		boolean flag =false;
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "insert into CHILDCARE_quest (family_id,title,body,time_limit,label) values (?,?,?,?,?)";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,cq.getFamily_id());
				pStmt.setString(2, cq.getTitle());
				pStmt.setString(3, cq.getBody());
				pStmt.setDate(4, cq.getTime_limit());
				pStmt.setInt(5, cq.getLabel_id());
				// SQL文を実行し、結果表を取得する
				int rs = pStmt.executeUpdate();
				// 結果表をコレクションにコピーする
				if(rs != 0) {
					flag=true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				flag=false;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				flag=false;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						flag=false;
					}
				}
			}

			// 結果を返す
			return flag;
		}

	public boolean accomplishChildcareQuest(int cqid){
		Connection conn = null;
		boolean flag =false;
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "update CHILDCARE_QUEST set completed_flag = 1 where childcare_quest_id = ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,cqid);

				// SQL文を実行し、結果表を取得する
				int rs = pStmt.executeUpdate();
				// 結果表をコレクションにコピーする
				if(rs != 0) {
					flag=true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				flag=false;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				flag=false;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						flag=false;
					}
				}
			}

			// 結果を返す
			return flag;
		}

	public boolean deleteChildcareQuest(int cqid){
		Connection conn = null;
		boolean flag =false;
			try {
				// JDBCドライバを読み込む
				Class.forName("org.h2.Driver");

				// データベースに接続する
				conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");


				// SQL文を準備する
				String sql;
				PreparedStatement pStmt;

				sql = "delete CHILDCARE_QUEST where childcare_quest_id = ?";
				pStmt= conn.prepareStatement(sql);
				pStmt.setInt(1,cqid);

				// SQL文を実行し、結果表を取得する
				int rs = pStmt.executeUpdate();
				// 結果表をコレクションにコピーする
				if(rs != 0) {
					flag=true;
				}
			}
			catch (SQLException e) {
				e.printStackTrace();
				flag=false;
			}
			catch (ClassNotFoundException e) {
				e.printStackTrace();
				flag=false;
			}
			finally {
				// データベースを切断
				if (conn != null) {
					try {
						conn.close();
					}
					catch (SQLException e) {
						e.printStackTrace();
						flag=false;
					}
				}
			}

			// 結果を返す
			return flag;
		}
}
