package servlet.mypage;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user.UserDAO;
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
		System.out.println("入ったよ");
		HttpSession session = request.getSession();
		User upr = (User)session.getAttribute("loginUser");

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

				String birthday = request.getParameter("birthday");
				Date da_birthday = java.sql.Date.valueOf(birthday);
				upr.setBirthday(da_birthday);

				String gender = request.getParameter("gender");
				upr.setGender (request.getParameter("gender"));

				String due_date = request.getParameter("due_date");
				Date da_due_date = java.sql.Date.valueOf(due_date);
				upr.setDue_date (da_due_date);





				String result_message;

				//userテーブルに編集命令
				UserDAO uDao = new UserDAO();

	            if(uDao.updateUser(upr)){//編集できた
	                //セッションにuserのデータを入れる。
	            	//HttpSession session = request.getSession();
	                //session.setAttribute("User",upr);
	                result_message = "success";
	            } else {//編集できてない
	                result_message = "false";
	            }
	            System.out.println(result_message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/edit_profile.jsp");
		dispatcher.forward(request, response);
	}
}