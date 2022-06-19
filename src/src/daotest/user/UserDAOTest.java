package daotest.user;
import dao.user.UserDAO;
import model.user.User;
public class UserDAOTest {


		public static void main(String[] args) {
			System.out.println("---------- loginのテスト ----------");
			loginTest();	// ユーザーが見つかる場合のテスト
		}

		// ユーザーが見つかる場合のテスト
		public static void loginTest() {
			UserDAO uDao = new UserDAO();
			User user=uDao.login("alachige@gmail.com","a4fb43a179c2953ea79ae192863dc6f0629281e9dedc8d7b836a461b8afaa629");
			if(user!=null) {
				System.out.println("ログイン失敗");

			}
		}

}
