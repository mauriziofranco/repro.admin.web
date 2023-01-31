package proxima.informatica.academy.seventh.surveyquestion.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.dto.SurveyquestionsDto;
import proxima.informatica.academy.hibernate.AbstractDBManager;
import proxima.informatica.academy.hibernate.SurveyquestionsManager;
import proxima.informatica.academy.seventh.role.service.RoleService;
import proxima.informatica.academy.seventh.surveyquestion.service.SurveyquestionsService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Servlet implementation class DeleteSurveyquestionsServlet
 */
@WebServlet("/DeleteSurveyquestionsServlet")
public class DeleteSurveyquestionsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private final static Logger logger = LoggerFactory.getLogger(DeleteSurveyquestionsServlet.class);

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteSurveyquestionsServlet() {
		super();
	}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		logger.debug("ID SurveyquestionsDto received" + request.getParameter("sqId"));
		int id = Integer.parseInt(request.getParameter("sqId"));		
		if (SurveyquestionsService.getInstance().deleteSurveyquestionById(id)) {
			response.getWriter().append("OK");
		} else {
			response.getWriter().append("KO");
		}
	}

}
