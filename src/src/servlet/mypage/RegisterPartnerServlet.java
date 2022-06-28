package servlet.mypage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.user.UserDAO;
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

 		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		int family_id = user.getFamily_id();
		request.setAttribute("family_id", family_id);
		System.out.print(family_id);

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
		UserDAO uDao = new UserDAO();

		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("loginUser");
		int family_id = user.getFamily_id();
		System.out.println(family_id);

		String email = request.getParameter("email");
        String result_message;

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
        Boolean result = uDao.existCheck(email);


        // ①メールがあるかチェック、trueででなければ招待メールを送る
		if(result != true) {
            result_message = "exist";
		// ②メールがある場合。trueであれば存在するため招待した人のfamily_idに上書きする
		}else {
	       if(uDao.registPartner(family_id, email)) {
	    	    result_message = "success";
	    	} else {//登録できない。
	    	    result_message = "false";
	    	}

	    }
	    	out.print(result_message);

	}
}





