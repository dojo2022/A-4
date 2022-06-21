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

import dao.partner.PartnerDAO;
import dao.user.UserConditionDAO;
import model.partner.Partner;
import model.user.User;
import model.user.UserCondition;

/**
 * Servlet implementation class InputRecordServlet
 */
@WebServlet("/InputRecordServlet")
public class InputRecordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");

		int family_id = user.getFamily_id();
		//patnerテーブルから、セッションスコープに入っているfamily_idと一致するレコードを全部ArrayList<Partner>に格納
		//リクエストスコープにいれて
		PartnerDAO pDao = new PartnerDAO();
		Partner pc = new Partner();
		ArrayList<Partner> PartnerList  = pDao.select(pc);

		request.setAttribute("",);


		//input_record.jspにフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/input_record.jsp");
		dispatcher.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

				// 先にインスタンス化
				UserCondition uc = new UserCondition();

				// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				uc.setPartner_id(Integer.parseInt(request.getParameter("partner_id")));
				uc.setWeight(Float.parseFloat(request.getParameter("weight")));
				uc.setBody_temparture(Float.parseFloat(request.getParameter("body_temparture")));
				uc.setText(request.getParameter("text"));
				uc.setAppetite(Integer.parseInt(request.getParameter("appetite")));
				uc.setSleepiness(Integer.parseInt(request.getParameter("sleepiness")));
				uc.setHumor(Integer.parseInt(request.getParameter("humor")));
				uc.setNausea(Integer.parseInt(request.getParameter("nausea")));
				uc.setStress(Integer.parseInt(request.getParameter("stress")));
				uc.setDizziness(Integer.parseInt(request.getParameter("dizziness")));
				uc.setFatigue(Integer.parseInt(request.getParameter("fatigue")));
				uc.setStiff_shoulder(Integer.parseInt(request.getParameter("stiff_shoulder")));
				uc.setHeadache(Integer.parseInt(request.getParameter("headache")));
				uc.setBackache(Integer.parseInt(request.getParameter("backache")));
				uc.setStomach_ache(Integer.parseInt(request.getParameter("stomache_ache")));
				uc.setFeeling(Integer.parseInt(request.getParameter("feeling")));
				uc.setTidying(Integer.parseInt(request.getParameter("tidying")));
				uc.setSelf_assertion(Integer.parseInt(request.getParameter("self_assertion")));
				uc.setPoop(Integer.parseInt(request.getParameter("poop")));
				uc.setTooth_brushing(Integer.parseInt(request.getParameter("tooth_brushing")));

				// 記録処理を行う
				UserConditionDAO ucDao = new UserConditionDAO();
				boolean ans = ucDao.insert(uc);
				if(ans) { //記録成功

				}else{	// 記録失敗

				}

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("<%= request.getContextPath() %>/jsp/record/input_record.jsp");
				dispatcher.forward(request, response);
			}
	}

