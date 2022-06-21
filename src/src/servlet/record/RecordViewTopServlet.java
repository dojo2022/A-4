package servlet.record;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.user.User;

/**
 * Servlet implementation class RecordViewTopServlet
 */
@WebServlet("/RecordViewTopServlet")
public class RecordViewTopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("../top/LoginServlet");
			return;
		}

		User user = (User)session.getAttribute("loginUser");
		int family_id = user.getFamily_id();
		//セッションスコープに入っているfamily_idと一致するレコードを全部ArrayList<Partners>格納して、
		//リクエストスコープにいれてrecord_view_top.jspにフォワード。created_atの現在の月の1ヶ月分のレコードを持ってくる
		/*UserCondition uc = new UserCondition();
		UserConditionDAO ucDAO = new UserConditionDAO();
		ArrayList<UserCondition> ucList = ucDAO.;
		request.setAttribute("ucList", ucList);*/


		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/record_view_top.jsp");
		dispatcher.forward(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
