package servlet.top;

import java.io.IOException;

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
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("email");
		String password=request.getParameter("password");

		UserDAO uDao = new UserDAO();
		User user = uDao.login(email, password);
		if(user ==null) {
			System.out.println("ログイン失敗");
			request.setAttribute("msg", "メールアドレスかパスワードが間違っています");
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top/login.jsp");
			dispatcher.forward(request, response);
			return;
		}

		System.out.println("email:"+user.getEmail()+" name:"+user.getName());
		HttpSession session = request.getSession();
		session.setAttribute("loginUser", user);
		if(user.getLogout_time()==null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/edit_profile.jsp");
			dispatcher.forward(request, response);
		}else {

			response.sendRedirect("/MaternityApp/HomeServlet");
		}

	}

}
