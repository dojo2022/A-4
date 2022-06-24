package servlet.record;

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


		UserConditionDAO ucDao= new UserConditionDAO();
		for(Partner pa: PartnerList) {

			if(ucDao.countRecord(pa.getPartner_id()) ==0) {
				pa.setToday_data(false);
			}else {
				pa.setToday_data(true);
				System.out.println(pa.getName()+"今日の記録は登録されています。確認は「記録閲覧」からできます。");
			}
		}
		request.setAttribute("PartnerList", PartnerList);

		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/input_record.jsp");
		dispatcher.forward(request, response);


	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// 送信されたデータの取得
		String partner_id = request.getParameter("partner_id");
		String text = request.getParameter("text");
		String weight = request.getParameter("weight");
		String body_temparture = request.getParameter("body_temparture");
		String appetite = request.getParameter("appetite");
		String sleepiness = request.getParameter("sleepiness");
		String humor = request.getParameter("humor");
		String nausea = request.getParameter("nausea");
		String stress = request.getParameter("stress");
		String dizziness = request.getParameter("dizziness");
		String fatigue = request.getParameter("fatigue");
		String stiff_shoulder = request.getParameter("stiff_shoulder");
		String headache = request.getParameter("headache");
		String backache = request.getParameter("backache");
		String stomach_ache = request.getParameter("stomach_ache");
		String feeling = request.getParameter("feeling");
		String tidying = request.getParameter("tidying");
		String self_assertion = request.getParameter("self_assertion");
		String poop = request.getParameter("poop");
		String tooth_brushing = request.getParameter("tooth_brushing");


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
				uc.setStomach_ache(Integer.parseInt(request.getParameter("stomach_ache")));
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
				PrintWriter out = response.getWriter();
		        out.print(result_message);
				return;

			}

	}

