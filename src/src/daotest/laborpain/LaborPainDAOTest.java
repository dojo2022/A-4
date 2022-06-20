package daotest.laborpain;

import dao.laborpain.LaborPainDAO;
import model.laborpain.LaborPain;

public class LaborPainDAOTest {


	public static void main(String[] args) {
		System.out.println("---------- weeklyのテスト ----------");
		getLaborPainTest();	// ユーザーが見つかる場合のテスト
	}

	// ユーザーが見つかる場合のテスト
	public static void getLaborPainTest() {
		LaborPainDAO lpDao = new LaborPainDAO();
		LaborPain lp = lpDao.getLabor(10);
		System.out.println(lp.getLabor_pain_id());
		System.out.println(lp.getUser_id());
		System.out.println(lp.getStart_time());
		System.out.println(lp.getStop_time());
		System.out.println(lp.getInterval());

	}
}
