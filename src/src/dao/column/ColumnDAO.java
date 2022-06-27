package dao.column;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import model.column.Column;

public class ColumnDAO {

	public ArrayList<Column> selectArticleList(String column_genre_id ) {       //サーブレットから渡されたデータ　getParamater→String型にしないと
		Connection conn = null;
		ArrayList<Column> columnList = new ArrayList<Column>();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM column WHERE genre_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, Integer.parseInt(column_genre_id)); //SQL文の？に値を入れる     ←１…左から数えて一個目の？に入れる  Integer.parseInt(id)…int型に



			// SQL文を実行し、結果表を取得する　りざるとせっとにあてはまる項目を表のまま入る　エコバック　resultsetなんでも入るボックス　表が入っている
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする　表だったものをarray１、２、３として詰め替えている　他のファイルでも読み込めるようになる
			while (rs.next()) {
				Column column = new Column();
				column.setColumn_id(rs.getInt("column_id"));
				column.setTitle(rs.getString("title"));
				column.setBody(rs.getString("body"));
				column.setGenre_id(rs.getInt("genre_id"));


				columnList.add(column);//←？
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

	public Column selectArticle(String column_id){    //

		Connection conn = null;
		Column column = new Column();

		try {
			// JDBCドライバを読み込む
			Class.forName("org.h2.Driver");

			// データベースに接続する
			conn = DriverManager.getConnection("jdbc:h2:file:C:/dojo6Data/dojo6Data", "sa", "");

			// SQL文を準備する
			String sql = "SELECT * FROM column WHERE column_id = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			pStmt.setInt(1, Integer.parseInt(column_id)); //SQL文の？に値を入れる     ←１…左から数えて一個目の？に入れる  Integer.parseInt(id)…int型に



			// SQL文を実行し、結果表を取得する　りざるとせっとにあてはまる項目を表のまま入る　エコバック　resultsetなんでも入るボックス　表が入っている
			ResultSet rs = pStmt.executeQuery();

			// 結果表をコレクションにコピーする　表だったものをarray１、２、３として詰め替えている　他のファイルでも読み込めるようになる
			while (rs.next()) {
				column.setColumn_id(rs.getInt("column_id"));
				column.setTitle(rs.getString("title"));
				column.setBody(rs.getString("body"));
				column.setGenre_id(rs.getInt("genre_id"));

			}

		}
		catch (SQLException e) {   //エラーが出たらキャッチ
			e.printStackTrace();
			column = null;
		}
		catch (ClassNotFoundException e) {
			e.printStackTrace();
			column= null;
		}
		finally {  //conn白紙の地図に戻す
			// データベースを切断
			if (conn != null) {
				try {
					conn.close();
				}
				catch (SQLException e) {
					e.printStackTrace();
					column = null;
				}
			}
		}

		// 結果を返す
		return column;

	}

}
