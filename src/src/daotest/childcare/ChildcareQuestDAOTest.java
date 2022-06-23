package daotest.childcare;

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
		getChilcareQuestTestLabelTest();

	}


	public static void getChilcareQuestTest() {
		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		ArrayList<ChildcareQuest> cq = cqDao.getChildcareQuest(2);
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

}