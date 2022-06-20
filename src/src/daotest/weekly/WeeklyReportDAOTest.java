package daotest.weekly;

import java.util.Date;

import dao.user.UserDAO;
import dao.weekly.WeeklyReportDAO;
import model.user.User;
import model.weekly.WeeklyReport;

public class WeeklyReportDAOTest {


	public static void main(String[] args) {
		System.out.println("---------- weeklyのテスト ----------");
		getWeeklyReportTest();	// ユーザーが見つかる場合のテスト
	}

	// ユーザーが見つかる場合のテスト
	public static void getWeeklyReportTest() {
		UserDAO uDao = new UserDAO();
		User user=uDao.getUser(5);
		Date due_date=user.getDue_date();
		Date now_date = new Date();
		long lweek = 39 - (due_date.getTime()-now_date.getTime())/(1000*60*60*24*7);
		int week=(int)lweek;
		System.out.println(week);
		WeeklyReportDAO wrDao = new WeeklyReportDAO();

		WeeklyReport wr = wrDao.getWeeklyReport(week, "赤ちゃん");
		if(wr!=null) {
			System.out.println(wr.getPerson());
			System.out.println(wr.getTitle());
			System.out.println(wr.getBody());
		}


	}
}
