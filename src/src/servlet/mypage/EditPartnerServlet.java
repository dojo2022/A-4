package servlet.mypage;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.partner.PartnerDAO;
import model.partner.Partner;
import model.user.User;

/**
 * Servlet implementation class EditPartnerServlet
 */
@WebServlet("/EditPartnerServlet")
public class EditPartnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		int family_id =user.getFamily_id();
		PartnerDAO pDao = new PartnerDAO();
		ArrayList<Partner> plist = pDao.selectFamilyPartner(family_id);
		request.setAttribute("partnerList", plist);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/edit_partner.jsp");
		dispatcher.forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
