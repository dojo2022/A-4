package servlet.bbs;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import dao.post.PostDAO;
import model.post.Post;

/**
 * Servlet implementation class BbsServlet
 */
@WebServlet("/BbsServlet")
public class BbsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PostDAO pDAO = new PostDAO();
		ArrayList<Post> pList = pDAO.getPostList();
		request.setAttribute("pList", pList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/bbs/bbs_top.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("application/json");
		response.setHeader("Cache-Control", "nocache");
		response.setCharacterEncoding("utf-8");
		String process = request.getParameter("process");
		String searchtext = request.getParameter("searchtext");

		if(process == null) {
			PostDAO pDAO = new PostDAO();
			ArrayList<Post> pList = pDAO.getPostList();
			request.setAttribute("pList", pList);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/bbs/bbs_top.jsp");
			dispatcher.forward(request, response);
			return;
		}
		else if(process.equals("search")) {
			PostDAO pDAO = new PostDAO();
			ArrayList<Post> pList = pDAO.getSearchPost(searchtext);

			ObjectMapper mapper = new ObjectMapper();
			try {
	            //Java????????????????????????JSON?????????
	            String testJson = mapper.writeValueAsString(pList);
	            System.out.println(pList);
	            //JSON?????????
	            response.getWriter().write(testJson);
	        } catch (JsonProcessingException e) {
	            e.printStackTrace();
	        }
		}
	}

}
