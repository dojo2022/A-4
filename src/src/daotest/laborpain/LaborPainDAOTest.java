package daotest.laborpain;
import java.sql.Time;
import java.sql.Timestamp;

import dao.laborpain.LaborPainDAO;
import model.laborpain.LaborPain;

public class LaborPainDAOTest {


	public static void main(String[] args) {
		System.out.println("---------- getLastLaborのテスト ----------");
		//getLaborPainTest();	// ユーザーが見つかる場合のテスト

		createLaborRecord();
		System.out.println("---------- updateStopLaborPainRecordのテスト ----------");
		updateStopLaborRecord();
		System.out.println("----------todayLaborCountのテスト ----------");
		todayLaborCount();

	}

	// ユーザーが見つかる場合のテスト
	public static void getLastLaborPainTest() {
		LaborPainDAO lpDao = new LaborPainDAO();
		LaborPain lp = lpDao.getLastLabor(10);
		System.out.println(lp.getLabor_pain_id());
		System.out.println(lp.getUser_id());
		System.out.println(lp.getStart_time());
		System.out.println(lp.getStop_time());
		System.out.println(lp.getLabor_interval());

	}


	public static void createLaborRecord() {
		LaborPainDAO lpDao = new LaborPainDAO();
		LaborPain lp = lpDao.getLastLabor(5);
		System.out.println(lp.getLabor_pain_id());
		System.out.println(lp.getUser_id());
		System.out.println(lp.getStart_time());
		System.out.println(lp.getStop_time());
		System.out.println(lp.getLabor_interval());
		Timestamp last_labor = lp.getStop_time();
		Timestamp now = new Timestamp(System.currentTimeMillis());
		System.out.println("現在時刻；"+now);
		if(last_labor == null) {
			System.out.println("stop_time of last_labor is null");
			lp.setStart_time(now);
			lpDao.createLaborPainRecord(lp);
		}else {
			System.out.println("stop_time of last_labor is not null");
			long interval = now.getTime()-last_labor.getTime();
			Time interval_t = new Time(interval);
			lp.setStart_time(now);
			lp.setLabor_interval(interval_t);
			lpDao.createLaborPainRecord(lp);
		}


	}

	public static void updateStopLaborRecord() {
		LaborPainDAO lpDao = new LaborPainDAO();
		if(lpDao.updateStopLaborPainRecord(5)) {
			System.out.println("stop_time更新成功");
		}else {
			System.out.println("stop_time更新失敗");
		}

	}

	public static void todayLaborCount() {
		LaborPainDAO lpDao = new LaborPainDAO();
		int labor_count=lpDao.todayLaborCount(5);
		System.out.println("今日の陣痛回数："+labor_count);
	}
}
