package servlet.record;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class RecordViewTopServlet
 */
@WebServlet("/RecordViewTopServlet")
public class RecordViewTopServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String process = request.getParameter("process");
			System.out.print(process);
			 if(process==null){

				 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/record_view_top.jsp");
					dispatcher.forward(request, response);
			}else if(process.equals("getmonthday")){
				String year = request.getParameter("year");
				String month = request.getParameter("month");
				System.out.println(year);
				System.out.println(month);
				//UserConditionDAOでfamily_idと受け渡した月を引数に
				//その月の何日に記録が入っているかを確認する。

				PrintWriter out = response.getWriter();
				//outの中に持ってきたデータを連結したものを入れる
				//勝手にJSPに渡り、dataという名前で使用することができる
				String a= "{1,2,3}";
				out.print(a);

			}
		/*HttpSession session = request.getSession();
		if (session.getAttribute("loginUser") == null) {
			response.sendRedirect("MaternityApp/servlet/top/LoginServlet");
			return;
		}*/

		/*User user = (User)session.getAttribute("loginUser");
		int family_id = user.getFamily_id();*/
		//セッションスコープに入っているfamily_idと一致するレコードを全部ArrayList<Partners>格納して、
		//リクエストスコープにいれてrecord_view_top.jspにフォワード。created_atの現在の月の1ヶ月分のレコードを持ってくる
		/*UserCondition uc = new UserCondition();
		UserConditionDAO ucDAO = new UserConditionDAO();
		ArrayList<UserCondition> ucList = ucDAO.;
		request.setAttribute("ucList", ucList);*/



			}



	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



	}

}
