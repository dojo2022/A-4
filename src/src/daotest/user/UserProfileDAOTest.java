package daotest.user;

import java.sql.Date;

import dao.user.UserDAO;
import model.user.User;

public class UserProfileDAOTest {

	public static void main(String[] args) {
		System.out.println("---------- getUserProfileDAOのテスト ----------");
		getUserProfileDAOTest();

	}


	public static void getUserProfileDAOTest() {
		User uspro = new User();
		UserDAO uproDao = new UserDAO();
		uspro.setName("赤坂");
		uspro.setNickname("あか");
		uspro.setPost_code("543-3456");
		uspro.setAddress("東京都杉並区");
		uspro.setTel("345-3456-5678");

		Date da_birthday = java.sql.Date.valueOf("2020-02-13");
		uspro.setBirthday(da_birthday);

		uspro.setGender("その他");

		Date da_due_date = java.sql.Date.valueOf("2020-02-17");
		uspro.setBirthday(da_due_date);

		uspro.setUser_id(6);

		boolean up = uproDao.updateUser(uspro);
	}
}