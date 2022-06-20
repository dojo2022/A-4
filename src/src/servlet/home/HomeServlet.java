package servlet.home;

import java.io.IOException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.weekly.WeeklyReportDAO;
import model.user.User;
import model.weekly.WeeklyReport;

/**
 * Servlet implementation class HomeServlet
 */
@WebServlet("/HomeServlet")
public class HomeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		Date due_date=user.getDue_date();
		Date now_date = new Date();
		int remain_day =(int) ((due_date.getTime()-now_date.getTime())/(1000*60*60*24));
		int week=39 - remain_day/7;
		request.setAttribute("remain_day", remain_day);
		request.setAttribute("now_weeks", week);
		WeeklyReportDAO wrDao = new WeeklyReportDAO();
		WeeklyReport wr_mom = wrDao.getWeeklyReport(week, "ママ");
		request.setAttribute("mother_report", wr_mom);
		WeeklyReport wr_baby = wrDao.getWeeklyReport(week, "赤ちゃん");
		request.setAttribute("baby_report", wr_baby);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/home/home.jsp");
		dispatcher.forward(request, response);
	}

}
