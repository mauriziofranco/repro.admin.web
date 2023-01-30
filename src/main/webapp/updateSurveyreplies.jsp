<%@page import="proxima.informatica.academy.seventh.surveyreplies.service.SurveyRepliesService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="proxima.informatica.academy.hibernate.SurveyrepliesManager"%>
<%@page import="proxima.informatica.academy.dto.SurveyrepliesDto"%>
<!DOCTYPE html>


<html>

<%-- <%@include file="authentication.jsp"%> --%>

<head>
<meta charset="ISO-8859-1">
<title>UpdateSurveyReplies</title>
		<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
	<%@include file="./header.jsp"%>


	<%int id = Integer.parseInt(request.getParameter("selectedSurveyrepliesId"));%>
	<%SurveyrepliesDto surveyReplies = SurveyRepliesService.getInstance().selectSurveyrepliesById(id);%>
	
	<form method="post" action=./UpdateSurveyRepliesServlet>
	
	<label>ID</label><br>
	<input type=text id="id" placeholder="Id" name="id_input" value="<%=surveyReplies.getId()%>" readonly="readonly"><br>
	<label>Survey ID</label><br>
	<input type=text id="survey_id" placeholder="Survey_id" name="survey_id_iput" value="<%=surveyReplies.getSurvey_id()%>" readonly="readonly"><br>
	<label>User ID</label><br>
	<input type=text id="user_id" placeholder="User_id" name="user_id_input" value="<%=surveyReplies.getUser_id()%>" readonly="readonly"><br>
	<label>StartTime</label><br>
	<input type=datetime-local id="starttime" placeholder="Starttime" name="starttime_input" value="<%=surveyReplies.getStarttime()%>" readonly="readonly"><br>
	<label>EndTime</label><br>
	<input type=datetime-local id="endtime" placeholder="Endtime" name="endtime_input" value="<%=surveyReplies.getEndtime()%>" readonly="readonly"><br>
	<label>Answers</label><br>
	<input type=text id="answers" placeholder="Answers" name="answers_input" value="<%=surveyReplies.getAnswers()%>"><br>
	<label>PdfFileName</label><br>
	<input type=text id="pdffilename" placeholder="Pdffilename" name="pdffilename_input" value="<%=surveyReplies.getPdffilename()%>"><br>
	<label>Points</label><br>
	<input type=text id="points" placeholder="Points" name="points_input" value="<%=surveyReplies.getPoints()%>"><br>
	
	<label>Enabled</label><br>

	<input class="btn btn-primary" type="submit" id="button" value="Update">
	</form>


<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
</body>
</html>