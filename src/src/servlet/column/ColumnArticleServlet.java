package servlet.column;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.column.ColumnDAO;
import model.column.Column;

/**
 * Servlet implementation class ColumnArticleServlet
 */
@WebServlet("/ColumnArticleServlet")
public class ColumnArticleServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


			String column_genre_id = request.getParameter("colum_genre_id");


			//daoをインスタンス化する
			ColumnDAO cDAO = new ColumnDAO();

			//インスタンス化したdaoにコラムのジャンルを取得するように命令を出す（ちゃんと受け取る）一つでいい　cDAO　タイトルもbodyも取ってくる
			ArrayList<Column> title = cDAO.select("2");
			ArrayList<Column> body = cDAO.select("2");

			//取得した一覧データ↑をリクエストスコープに格納する
			request.setAttribute("title", title);
			request.setAttribute("body", body);
			System.out.println("ColumnArticleServlet");

			//jspへ処理を依頼する（フォワード）
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/column/column_article.jsp");
			dispatcher.forward(request, response);
		}

	}
