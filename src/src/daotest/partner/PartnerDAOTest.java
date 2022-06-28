package daotest.partner;

import dao.partner.PartnerDAO;
import model.partner.Partner;

public class PartnerDAOTest {
	public static void main(String[] args) {
		System.out.println("---------- getLastLaborのテスト ----------");
		getPartnerTest();	// ユーザーが見つかる場合のテスト
		System.out.println("---------- updateのテスト ----------");
		updatePartnerTest();
	}

	public static void getPartnerTest() {
		PartnerDAO pDao = new PartnerDAO();
		Partner p =new Partner();
		p= pDao.getPartner(1);
		System.out.println(p.getName());

	}

	public static void updatePartnerTest() {
		PartnerDAO pDao = new PartnerDAO();
		Partner p =new Partner();
		p= pDao.getPartner(1);
		p.setPoop(1);
		p.setAttribute_id(1);
		if(pDao.updatePartner(p)) {
			System.out.println("update 成功");
		}else {
			System.out.println("update 失敗");
		}
		System.out.println(p.getName());

	}
}
