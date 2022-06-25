package servlet.childcare;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
import model.childcare.ChildcareQuestLabel;
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
		String process = request.getParameter("process");
		if(process == null) {
			ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
			ArrayList<ChildcareQuestLabel> LabelList = cqDao.getChildcareQuestlabel();
			request.setAttribute("labelList", LabelList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/childcare/childcare_quest.jsp");
			dispatcher.forward(request, response);
			return;
		}
		if(process.equals("getQuestList")) {
			String sort = request.getParameter("sort");
			String comp_flag = request.getParameter("completed_flag") ;
			String label = request.getParameter("label");



			ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
			HttpSession session = request.getSession();
			User user = (User)session.getAttribute("loginUser");
			ArrayList<ChildcareQuest> cqList = cqDao.getChildcareQuest(user.getFamily_id(),sort,comp_flag,label);
			ObjectMapper mapper = new ObjectMapper();
			try {
	            //JavaオブジェクトからJSONに変換
	            String testJson = mapper.writeValueAsString(cqList);
	            //JSONの出力
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



		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");
		ChildcareQuestDAO cqDao = new ChildcareQuestDAO();
		ChildcareQuest cq = new ChildcareQuest();
		String message;
		String process = request.getParameter("process");
		if(process.equals("accomplish cq")) {
			int cqid=Integer.parseInt(request.getParameter("quest_id"));
			if(cqDao.accomplishChildcareQuest(cqid)) {
				message="succsess";
			}else {
				message="false";
			}
		}else if(process.equals("delete cq")){
			int cqid=Integer.parseInt(request.getParameter("quest_id"));
			if(cqDao.deleteChildcareQuest(cqid)) {
				message="succsess";
			}else {
				message="false";
			}
		}else {


			cq.setFamily_id(Integer.parseInt(request.getParameter("family_id")));
			cq.setTitle(request.getParameter("title"));
			cq.setBody(request.getParameter("body"));
			cq.setTime_limit(Date.valueOf(request.getParameter("time_limit")));
			String label = request.getParameter("label");

			if(!(label.equals(""))) {
				cq.setLabel_id(Integer.parseInt(label));
			}


			if(cqDao.createChildcareQuestlabel(cq)) {
				message= "succsess";
			}else {
				message ="false";
			}

			PrintWriter out = response.getWriter();
			out.print(message);

	        return;

		}
	}

}
