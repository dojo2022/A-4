package servlet.mypage;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.user.User;

/**
 * Servlet implementation class EditProfileServlet
 */
@WebServlet("/EditProfileServlet")

public class EditProfileServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/edit_profile.jsp");
		dispatcher.forward(request, response);
	}
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User upr = new User();
		// リクエストパラメータを取得、入力値をプロパティに設定
				request.setCharacterEncoding("UTF-8");
				String name = request.getParameter("name");
				upr.setName(request.getParameter("name"));

				String nickname = request.getParameter("nickname");
				upr.setNickname(request.getParameter("nickname"));

				String post_code = request.getParameter("post_code");
				upr.setPost_code (request.getParameter("post_code"));

				String address = request.getParameter("address");
				upr.setAddress (request.getParameter("address"));

				String tel = request.getParameter("tel");
				upr.setTel (request.getParameter("tel"));

				Date birthday = request.getParameter("birthday");
				upr.setBirthday (request.getParameter("birthday"));

				String gender = request.getParameter("gender");
				upr.setGender (request.getParameter("gender"));

				Date due_date = request.getParameter("due_date");
				upr.setDue_date (request.getParameter("due_date"));
	}

}
