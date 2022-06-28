package servlet.mypage;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.partner.PartnerAttributeDAO;
import dao.partner.PartnerDAO;
import model.partner.Partner;
import model.partner.PartnerAttribute;
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
		PartnerAttributeDAO paDao = new PartnerAttributeDAO();
		ArrayList<PartnerAttribute> paList= paDao.getPartnerAttribute();
		request.setAttribute("paList", paList);


		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/edit_partner.jsp");
		dispatcher.forward(request, response);
		return;
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");
		PartnerDAO pDao = new PartnerDAO();
		Partner partner = new Partner();
		String process = request.getParameter("process");
		String message = "aaaa";
		if(process.equals("update partner")){
			int partner_id = Integer.parseInt(request.getParameter("partner_id"));
			partner = pDao.getPartner(partner_id);
			partner.setPartner_id(Integer.parseInt(request.getParameter("partner_id")));
			partner.setName(request.getParameter("partner_name"));
			partner.setAttribute_id(Integer.parseInt(request.getParameter("partner_attribute")));
			partner.setAppetite(Integer.parseInt(request.getParameter("appetite")));
			partner.setSleepiness(Integer.parseInt(request.getParameter("sleepiness")));
			partner.setHumor(Integer.parseInt(request.getParameter("humor")));
			partner.setNausea(Integer.parseInt(request.getParameter("nausea")));
			partner.setStress(Integer.parseInt(request.getParameter("stress")));
			partner.setDizziness(Integer.parseInt(request.getParameter("dizziness")));
			partner.setFatigue(Integer.parseInt(request.getParameter("fatigue")));
			partner.setStiff_shoulder(Integer.parseInt(request.getParameter("stiff_shoulder")));
			partner.setHeadache(Integer.parseInt(request.getParameter("headache")));
			partner.setBackache(Integer.parseInt(request.getParameter("backache")));
			partner.setStomach_ache(Integer.parseInt(request.getParameter("stomach_ache")));
			partner.setFeeling(Integer.parseInt(request.getParameter("feeling")));
			partner.setTidying(Integer.parseInt(request.getParameter("tidying")));
			partner.setSelf_assertion(Integer.parseInt(request.getParameter("self_assertion")));
			partner.setPoop(Integer.parseInt(request.getParameter("poop")));
			partner.setTooth_brushing(Integer.parseInt(request.getParameter("tooth_brushing")));

			if(pDao.updatePartner(partner)) {
				message = "success";
			}else {
				message = "fales";
			}
		}else if(process.equals("create partner")) {
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			partner.setFamily_id(user.getFamily_id());
			partner.setName(request.getParameter("partner_name"));
			partner.setAttribute_id(Integer.parseInt(request.getParameter("partner_attribute")));
			partner.setAppetite(Integer.parseInt(request.getParameter("appetite")));
			partner.setSleepiness(Integer.parseInt(request.getParameter("sleepiness")));
			partner.setHumor(Integer.parseInt(request.getParameter("humor")));
			partner.setNausea(Integer.parseInt(request.getParameter("nausea")));
			partner.setStress(Integer.parseInt(request.getParameter("stress")));
			partner.setDizziness(Integer.parseInt(request.getParameter("dizziness")));
			partner.setFatigue(Integer.parseInt(request.getParameter("fatigue")));
			partner.setStiff_shoulder(Integer.parseInt(request.getParameter("stiff_shoulder")));
			partner.setHeadache(Integer.parseInt(request.getParameter("headache")));
			partner.setBackache(Integer.parseInt(request.getParameter("backache")));
			partner.setStomach_ache(Integer.parseInt(request.getParameter("stomach_ache")));
			partner.setFeeling(Integer.parseInt(request.getParameter("feeling")));
			partner.setTidying(Integer.parseInt(request.getParameter("tidying")));
			partner.setSelf_assertion(Integer.parseInt(request.getParameter("self_assertion")));
			partner.setPoop(Integer.parseInt(request.getParameter("poop")));
			partner.setTooth_brushing(Integer.parseInt(request.getParameter("tooth_brushing")));

			if(pDao.createPartner(partner)) {
				message = "success";
			}else {
				message = "fales";
			}
		}


		PrintWriter out = response.getWriter();
		out.print(message);

        return;
	}

}
