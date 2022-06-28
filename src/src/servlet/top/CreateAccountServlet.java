package servlet.top;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user.FamilyDAO;
import dao.user.UserDAO;
import model.user.User;

/**
 * Servlet implementation class CreateAccountServlet
 */
@WebServlet("/CreateAccountServlet")
public class CreateAccountServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//アカウント作成画面にフォワード
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/top/create_account.jsp");
				dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// リクエストパラメータを取得する
				request.setCharacterEncoding("UTF-8");
				String email = request.getParameter("email");
				String password = request.getParameter("password");
		        String result_message;

		        //すでに登録されているメールアドレス化をチェック
		        UserDAO uDao = new UserDAO();
		        Boolean result = uDao.existCheck(email);
		        if(result == true){
		            result_message = "exist";
		        } else {

		            //family_idの自動生成//family_idの取得
		            FamilyDAO famDao = new FamilyDAO();
		            int family_id =famDao.createFamily();


		            User user = new User();
		            user.setEmail(email);
		            user.setPassword(password);
		            user.setFamily_id(family_id);

		            //次にuserテーブルに新規追加
		            if(uDao.createAccount(email, password, family_id)){//登録できた
		            	User u = uDao.login(email, password);
		            	user.setUser_id(u.getUser_id());

		            	//セッションにuserのデータを入れる。
		            	HttpSession session = request.getSession();
		                session.setAttribute("loginUser",user);
		                result_message = "success";
		            } else {//登録できない。
		                result_message = "false";
		            }

		        }
		        PrintWriter out = response.getWriter();
		        out.print(result_message);
	}

}
