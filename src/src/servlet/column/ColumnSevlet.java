package servlet.column;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.column.ColumnGenreDAO;
import model.column.ColumnGenre;

/**
 * Servlet implementation class ColumnSevlet
 */
@WebServlet("/ColumnSevlet")
public class ColumnSevlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		//daoをインスタンス化する
		ColumnGenreDAO cDAO = new ColumnGenreDAO();

		//インスタンス化したdaoにコラムのジャンルを取得するように命令を出す（ちゃんと受け取る）
		ArrayList<ColumnGenre> list = cDAO.select();

		//取得した一覧データ↑をリクエストスコープに格納する "list"という名前でlistという変数を格納
		request.setAttribute("list", list);
		System.out.println("ColumnServlet");

		//jspへ処理を依頼する（フォワード）
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/column/column_top.jsp");
		dispatcher.forward(request, response);
	}

}
