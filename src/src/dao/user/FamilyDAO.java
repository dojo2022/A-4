package dao.user;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.user.Family;
;
public class FamilyDAO {
	//ファミリーidの自動生成
	public int createFamily() {
		Connection conn = null;
		Family family = new Family();
		int family_id=0;
		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する

			//String sql;
			//PreparedStatement pStmt =null;

			String sql = "insert into family (created_at) VALUES (now())";
			PreparedStatement pStmt =conn.prepareStatement(sql);
			int ans = pStmt.executeUpdate();

			ResultSet rs = null;
			//成功だったら
			if(ans==1) {
				String sql2 = "select max(family_id) from family";
				pStmt =conn.prepareStatement(sql2);
				rs = pStmt.executeQuery();
			}

			int family_Id = 0;
			while(rs.next()) {
				family_Id = rs.getInt("max(family_id)");
			}

			return family_Id;
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

		return family_id;
	}

}
