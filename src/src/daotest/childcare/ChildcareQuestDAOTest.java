package daotest.childcare;

import java.util.ArrayList;

import dao.childcare.ChildcareQuestDAO;
import model.childcare.ChildcareQuest;

public class ChildcareQuestDAOTest {

	public static void main(String[] args) {
		System.out.println("---------- getLastLaborのテスト ----------");
		//getLaborPainTest();	// ユーザーが見つかる場合のテスト


		System.out.println("---------- updateStopLaborPainRecordのテスト ----------");
		getChilcareQuestTest();

	}


	public static void getChilcareQuestTest() {
		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		ArrayList<ChildcareQuest> cq = cqDao.getChildcareQuest(2);
		for(ChildcareQuest c: cq) {
			System.out.println(c.getTitle());
		}


	}

}