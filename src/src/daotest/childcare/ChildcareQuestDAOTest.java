package daotest.childcare;

import java.sql.Date;
import java.util.ArrayList;

import dao.childcare.ChildcareQuestDAO;
import model.childcare.ChildcareQuest;
import model.childcare.ChildcareQuestLabel;

public class ChildcareQuestDAOTest {

	public static void main(String[] args) {
		System.out.println("---------- getLastLaborのテスト ----------");
		//getLaborPainTest();	// ユーザーが見つかる場合のテスト


		System.out.println("---------- getLabelのテスト ----------");
		//getChilcareQuestTest();
		//getChilcareQuestTestLabelTest();
		//createChildcareQuestTest();
		accomplishChildcareQuestTest();

	}


	public static void getChilcareQuestTest() {
		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		ArrayList<ChildcareQuest> cq = cqDao.getChildcareQuest(2,"time_limit","%","家事");
		for(ChildcareQuest c: cq) {
			System.out.println(c.getTitle());
		}


	}

	public static void getChilcareQuestTestLabelTest() {
		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		ArrayList<ChildcareQuestLabel> cq = cqDao.getChildcareQuestlabel();
		for(ChildcareQuestLabel c: cq) {
			System.out.println(c.getContent_label());
		}
	}
	public static void createChildcareQuestTest() {

		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		ChildcareQuest cq = new ChildcareQuest();
		cq.setFamily_id(1);
		cq.setTitle("薬買ってきてー");
		cq.setBody("ぼでぃ");
		Date time_limit = Date.valueOf("2022-07-07");
		cq.setTime_limit(time_limit);
		cq.setLabel_id(3);
		if(cqDao.createChildcareQuestlabel(cq)){
			System.out.print("クエスト登録成功");
		}else {
			System.out.print("クエスト登録失敗");
		}
	}
	public static void accomplishChildcareQuestTest() {
		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		boolean flag = cqDao.accomplishChildcareQuest(11);
		if(flag){
			System.out.println("達成しました");
		}else {
			System.out.println("達成しませんでした");
		}
	}



}
