package servlet.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.user.UserDAO;
import mail.Mail;
import model.user.User;

/**
 * Servlet implementation class RegisterPartnerServlet
 */
@WebServlet("/RegisterPartnerServlet")
public class RegisterPartnerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;



	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/mypage/regist_partner.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		// user beansとUserをインスタンス化
		User user = new User();
		UserDAO uDao = new UserDAO();


		String email = request.getParameter("email");
		int family_id = user.getFamily_id();

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
        Boolean result = uDao.existCheck(email);


        // ①メールがあるかチェック、trueででなければ招待メールを送る
		if(result != true) {
			Mail mail = new Mail();
			mail.setSendTo(email);
			mail.setTitle("famiTy新規アカウント登録");
			mail.setMessage("下記のURLをクリックして新規アカウント登録を行ってください。\n http://localhost:8080/src/CreateAccountServlet");
			if(mail.sendMail()) {
				out.print("success");
	            return;
			}else {
	            out.print("fail");
	            return;
			}
			// ②メールがある場合。trueであれば存在するため招待した人のfamily_idに上書きする
		}else {
	        Boolean update = uDao.registPartner(family_id, email);
	        if(update == true) {
	        	Mail mail = new Mail();
	        	mail.setSendTo(email);
				mail.setTitle("famiTyパートナー連携");
				mail.setMessage("パートナーの連携が完了しました。下記のURLをクリックして詳細設定してください。\n http://localhost:8080/src/MypageServlet");
				if(mail.sendMail()) {
					out.print("success");
		            return;
				}else {
		            out.print("fail");
		            return;
				}

		}

	}
}
}



