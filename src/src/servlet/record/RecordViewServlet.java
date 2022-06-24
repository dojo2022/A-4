package servlet.record;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user.UserConditionDAO;
import model.user.User;
import model.user.UserCondition;

/**
 * Servlet implementation class RecordViewServlet
 */
@WebServlet("/RecordViewServlet")
public class RecordViewServlet extends HttpServlet {
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

		int month = Integer.parseInt(request.getParameter("month"));
		int recordDay = Integer.parseInt(request.getParameter("recordDay"));
		System.out.println(month);
		System.out.println(recordDay);

		UserConditionDAO ucDAO = new UserConditionDAO();
		ArrayList<UserCondition> ucList = ucDAO.selectOneDayRecord(family_id, month, recordDay);
		request.setAttribute("ucList", ucList);
		System.out.println(ucList.size());
		System.out.println(ucList.get(0).getPartner_id());

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/record_view.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
