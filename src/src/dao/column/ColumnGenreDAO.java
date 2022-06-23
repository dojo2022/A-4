package dao.column;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.column.ColumnGenre;

public class ColumnGenreDAO {

	public ArrayList<ColumnGenre> select() {
		Connection conn = null;
		ArrayList<ColumnGenre> columnList = new ArrayList<ColumnGenre>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM column_genre";
			PreparedStatement pStmt = conn.prepareStatement(sql);



			// SQL文を実行し、結果表を取得する　りざるとせっとにあてはまる項目を表のまま入る　エコバック　resultsetなんでも入るボックス　表が入っている
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする　表だったものをarray１、２、３として詰め替えている　他のファイルでも読み込めるようになる
			while (rs.next()) {
				ColumnGenre column = new ColumnGenre();
				column.setColumn_genre_id(rs.getInt("column_genre_id"));
				column.setName(rs.getString("name"));
				column.setImage(rs.getString("image"));

				columnList.add(column);
			}
			System.out.println(columnList.size()+"←とってきた数");
		}
		catch (SQLException e) {   //エラーが出たらキャッチ
			e.printStackTrace();
			columnList = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			columnList = null;
		}
		finally {  //conn白紙の地図に戻す
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					columnList = null;
				}
			}
		}

		// 結果を返す
		return columnList;
	}

}
