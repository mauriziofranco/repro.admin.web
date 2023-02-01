package proxima.informatica.academy.seventh.surveyServlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import proxima.informatica.academy.seventh.service.SurveyService;

import java.io.IOException;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import centauri.academy.proxima.cerepro.entity.Surveys;

/**
 * 
 * @author Matteo Peruzza
 *
 */

@WebServlet("/DeleteSurveyServlet")
public class DeleteSurveyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private final static Logger logger = LoggerFactory.getLogger(DeleteSurveyServlet.class);

    public DeleteSurveyServlet() {
        super();
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.debug("DeleteSurveyServlet.START");
		int surveyId = Integer.parseInt(request.getParameter("surveyId"));
		logger.debug("DeleteSurveyServlet DEBUG - Survey ID to delete: "+surveyId);
		Surveys surveyToDelete = SurveyService.getInstance().selectById(surveyId);
		logger.debug("DeleteSurveyServlet DEBUG - Survey to delete: "+surveyToDelete);
		SurveyService.getInstance().deleteSurvey(surveyId);
		
		if(SurveyService.getInstance().selectById(surveyId) == null) {
			request.setAttribute("deleteSurvey", "OK");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		}else {
			request.setAttribute("deleteSurvey", "KO");
			request.getRequestDispatcher("surveys.jsp").forward(request, response);
		}
	}

}