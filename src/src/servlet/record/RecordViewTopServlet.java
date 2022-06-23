package servlet.record;

import java.io.IOException;
import java.util.TreeSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.user.UserConditionDAO;
import model.user.User;

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

			request.setCharacterEncoding("UTF-8");
	        response.setContentType("application/json");
			response.setHeader("Cache-Control", "nocache");
			response.setCharacterEncoding("utf-8");


			String process = request.getParameter("process");
			System.out.print(process);
			 if(process==null){

				 RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/record/record_view_top.jsp");
					dispatcher.forward(request, response);
					return;
			 	}else if(process.equals("getmonthday")){

			 		HttpSession session = request.getSession();
					User user = (User)session.getAttribute("loginUser");
					int family_id = user.getFamily_id();
					int year = Integer.parseInt(request.getParameter("year"));
					int month = Integer.parseInt(request.getParameter("month"));

					//UserConditionDAOを呼び出す。
					UserConditionDAO ucDAO = new UserConditionDAO();
					TreeSet<Integer> dayList = ucDAO.selectRecordedDay(family_id, year, month);
						for (int day:dayList) {
							System.out.println(day);
						}

					ObjectMapper mapper = new ObjectMapper();
					try {
			            //JavaオブジェクトからJSONに変換
			            String testJson = mapper.writeValueAsString(dayList);
			            //JSONの出力
			            System.out.println(testJson);
			            response.getWriter().write(testJson);
			        	} catch (JsonProcessingException e) {
			            e.printStackTrace();
			        }
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
