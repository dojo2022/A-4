package servlet.bbs;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.post.PostDAO;
import model.user.User;

/**
 * Servlet implementation class PostBbsServlet
 */
@WebServlet("/PostBbsServlet")
public class PostBbsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/bbs/post_bbs.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		//リクエストスコープ内のuser_idの獲得
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		int user_id = user.getUser_id();
		String result_message;

		//周期のweekの算出
		Date due_date=user.getDue_date();
		Date now_date = new Date();
		int remain_day =(int) ((due_date.getTime()-now_date.getTime())/(1000*60*60*24));
		int week=39 - remain_day/7;

		//入力したタイトルとボディの取得
		String title = request.getParameter("title");
		String body = request.getParameter("body");

		//DAO出陣
		PostDAO pDAO = new PostDAO();
		if( pDAO.insertPost(user_id, title, body, week)) {
			result_message = "success";
		}else {
			result_message ="false";
		}


		PrintWriter out = response.getWriter();
        out.print(result_message);
	}

}
