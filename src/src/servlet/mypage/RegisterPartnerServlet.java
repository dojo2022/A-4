package servlet.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user.UserDAO;

/**
 * Servlet implementation class RegisterPartnerServlet
 */
@WebServlet("/RegisterPartnerServlet")
public class RegisterPartnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/regist_partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");
        String result_message;
        PrintWriter out = response.getWriter();

		String email = request.getParameter("email");
		UserDAO uDao = new UserDAO();

		//アカウントがあるか検索
		if(uDao.isExist(email)) {
			out.print("入力されたメールアドレスに招待メールを送信しました。");
			return;
		}

	}

}

