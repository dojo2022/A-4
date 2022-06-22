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
		ArrayList<Partner> PartnerList  = pDao.selectFamilyPartner(family_id);

		request.setAttribute("PartnerList", PartnerList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/input_record.jsp");
		dispatcher.forward(request, response);

//		if(LocalDate today == LocalDate.now()) {
//			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/input_record.jsp");
//			dispatcher.forward(request, response);
//		}else {
//			response.sendRedirect("/WEB-INF/jsp/record/input_record.jsp");
//		}


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// 送信されたデータの取得
		String data1 = request.getParameter("data1");
		String data2 = request.getParameter("data2");
		String data3 = request.getParameter("data3");
		String data4 = request.getParameter("data4");
		String data5 = request.getParameter("data5");
		String data6 = request.getParameter("data6");
		String data7 = request.getParameter("data7");
		String data8 = request.getParameter("data8");
		String data9 = request.getParameter("data9");
		String data10 = request.getParameter("data10");
		String data11 = request.getParameter("data11");
		String data12 = request.getParameter("data12");
		String data13 = request.getParameter("data13");
		String data14 = request.getParameter("data14");
		String data15 = request.getParameter("data15");
		String data16 = request.getParameter("data16");
		String data17 = request.getParameter("data17");
		String data18 = request.getParameter("data18");
		String data19 = request.getParameter("data19");


				// 先にインスタンス化
				UserCondition uc = new UserCondition();
				String result_message;

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
					result_message = "success";
				}else{	// 記録失敗
					result_message = "false";
				}

				// 結果ページにフォワードする
				RequestDispatcher dispatcher = request.getRequestDispatcher("<%= request.getContextPath() %>/jsp/record/input_record.jsp");
				dispatcher.forward(request, response);
			}
	}

