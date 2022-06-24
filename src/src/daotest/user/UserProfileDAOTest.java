package daotest.user;

import dao.user.UserDAO;

public class UserProfileDAOTest {

	public static void main(String[] args) {
		System.out.println("---------- getUserProfileDAOのテスト ----------");
		getUserProfileDAOTest();

	}


	public static void getUserProfileDAOTest() {
		UserDAO uproDao = new UserDAO();
		boolean up = uproDao.updateUser();

			System.out.println();
	}
}