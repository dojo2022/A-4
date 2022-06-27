package servlet.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Time;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.laborpain.LaborPainDAO;
import model.laborpain.LaborPain;
import model.user.User;

/**
 * Servlet implementation class LaborPainServlet
 */
@WebServlet("/LaborPainServlet")
public class LaborPainServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");



//		//文字コードの設定（めんどいのでコピペでOK）
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		LaborPainDAO lpDao = new LaborPainDAO();
		if(request.getParameter("process").equals("today_labor_count")) {
		int today_labor_count = lpDao.todayLaborCount(user.getUser_id());
		//JSPに返却する値を作成する。値はoutの中に格納する
		PrintWriter out = response.getWriter();
		//outの中に持ってきたデータを連結したものを入れる
		//勝手にJSPに渡り、dataという名前で使用することができる
		out.print(today_labor_count);

		}else if(request.getParameter("process").equals("inLabor")) {
				boolean inLabor = lpDao.inLaborCheck(user.getUser_id());
				//JSPに返却する値を作成する。値はoutの中に格納する
				PrintWriter out = response.getWriter();
				//outの中に持ってきたデータを連結したものを入れる
				//勝手にJSPに渡り、dataという名前で使用することができる
				out.print(inLabor);
		}else if(request.getParameter("process").equals("createLabor")) {
			LaborPain lp = new LaborPain();
			lpDao.getLastLabor(user.getUser_id());
			Timestamp last_labor = lp.getStop_time();
			Timestamp now = new Timestamp(System.currentTimeMillis());
			lp.setStart_time(now);
			if(last_labor != null) {
				long interval = now.getTime()-last_labor.getTime();
				Time interval_t = new Time(interval);
				lp.setLabor_interval(interval_t);
			}
			boolean flag =lpDao.createLaborPainRecord(lp);
			//JSPに返却する値を作成する。値はoutの中に格納する
			PrintWriter out = response.getWriter();
			//outの中に持ってきたデータを連結したものを入れる
			//勝手にJSPに渡り、dataという名前で使用することができる
			out.print(flag);
		}else if(request.getParameter("process").equals("stopLabor")) {

			boolean flag =lpDao.updateStopLaborPainRecord(user.getUser_id());
			//JSPに返却する値を作成する。値はoutの中に格納する
			PrintWriter out = response.getWriter();
			//outの中に持ってきたデータを連結したものを入れる
			//勝手にJSPに渡り、dataという名前で使用することができる
			out.print(flag);
	}
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
