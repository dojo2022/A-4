package servlet.top;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user.UserDAO;
import model.user.User;

/**
 * Servlet implementation class LogoutServlet
 */
@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		UserDAO uDao = new UserDAO();
		if(uDao.logout(user)) {
			System.out.println("ログアウト："+user.getName());
		}else {
			System.out.println("正常にログアウトできませんでした。"+user.getName());
		}
		session.invalidate();
		response.sendRedirect("/MaternityApp/LoginServlet");
		}

}
