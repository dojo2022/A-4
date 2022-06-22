package servlet.childcare;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.childcare.ChildcareQuestDAO;
import model.childcare.ChildcareQuest;
import model.user.User;

/**
 * Servlet implementation class ChildcareQuestServlet
 */
@WebServlet("/ChildcareQuestServlet")
public class ChildcareQuestServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");

		System.out.println("in servlert");
		String process = request.getParameter("process");
		if(process == null) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/childcare/childcare_quest.jsp");
			dispatcher.forward(request, response);
			return;
		}
		if(process.equals("getQuestList")) {
			System.out.println("getCQl");
			ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			ArrayList<ChildcareQuest> cqList = cqDao.getChildcareQuest(2);
			ObjectMapper mapper = new ObjectMapper();
			try {
	            //JavaオブジェクトからJSONに変換
	            String testJson = mapper.writeValueAsString(cqList);
	            //JSONの出力
	            System.out.println(testJson);
	            response.getWriter().write(testJson);
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	        }

		}



	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
