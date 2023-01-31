<%@page import="centauri.academy.proxima.cerepro.entity.EntityInterface"%>
<%@page import="proxima.informatica.academy.seventh.service.SurveyService"%>
<%@page import="centauri.academy.proxima.cerepro.repository.SurveysRepository"%>
<%@page import="centauri.academy.proxima.cerepro.entity.Surveys"%>
<%@page import="java.util.List"%>

<%@page import="java.nio.file.attribute.UserPrincipalLookupService"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<%-- <%@include file="authentication.jsp"%> --%>


<head>

<script type="text/javascript">

	function abilitaBottone() {
		console.log("questa � la console");
 		document.getElementById("buttonDelete").disabled = false;
 		document.getElementById("buttonUpdate").disabled = false;
	}
	
	function deleteSurvey() {
		console.log("Delete");
		document.getElementById("formSelectSurvey").action = "./DeleteSurveyServlet";
		document.getElementById("formSelectSurvey").method = "post";
		document.getElementById("formSelectSurvey").submit;
	}
	
	function updateSurvey() {
		console.log("Update");
		document.getElementById("formSelectSurvey").action = "./updateSurvey.jsp";
		document.getElementById("formSelectSurvey").method = "post";
		document.getElementById("formSelectSurvey").submit;
	}
	
	function initializeUpdateForm (item) {
		console.log("initializeUpdateForm - START - " + item);
		console.log(item);
		document.getElementById("surveyIdToUpdate").value = item.id;
		document.getElementById("surveyLabelToUpdate").value = item.label;
		document.getElementById("surveyTimeToUpdate").value = item.time;
		document.getElementById("surveyDescriptionToUpdate").value = item.description;
	}
	
	function showUpdateSurveyModal () {
		console.log("showUpdateSurveyModal!!!");
		const xhttp = new XMLHttpRequest();
		  xhttp.onload = function() {
			  var survey = JSON.parse(this.responseText) ;
			  console.log(survey);
			  initializeUpdateForm (survey);
		    }
		  xhttp.open("GET", "http://localhost:8080/repro.admin.web/GetSurveyServlet?id=4", true);
		  xhttp.send();
	}
	
	function update() {
		console.log("update - START");
		var idToUpdate = document.getElementById("surveyIdToUpdate").value;
		var labelToUpdate = document.getElementById("surveyLabelToUpdate").value;
		var timeToUpdate = document.getElementById("surveyTimeToUpdate").value;
		var descriptionToUpdate = document.getElementById("surveyDescriptionToUpdate").value;
		console.log(idToUpdate, labelToUpdate, timeToUpdate, descriptionToUpdate);
		
		var formData = new FormData();
		formaData.append("id", idToUpdate);
		formaData.append("label", labelToUpdate);
		formaData.append("time", timeToUpdate);
		formaData.append("description", descriptionToUpdate);
		
		const xhttp = new XMLHttpRequest();
		xhttp.onload = function() {
			console.log(this.responseText);
		}
		xhttp.open("POST", "http://localhost:8080/repro.admin.web/UpdateSurveyServlet", true)
		xhttp.send(formData);
	}
	
</script>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>List Surveys</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

<link rel="stylesheet" href="list.css">

</head>
<body>
	<%@include file="header.jsp"%>
<div class="container-fluid">
	<h1>Survey List</h1>
	<form id="formSelectSurvey">
		<table class="table table-striped table-hover  table-bordered">
			<thead class="thead-dark">
				<tr>
					<th scope="col"></th>
					<th scope="col">Id</th>
					<th scope="col">Label</th>
					<th scope="col">Time</th>
					<th scope="col">Description</th>
				</tr>
			</thead>	
			<%
			List<EntityInterface> items = SurveyService.getInstance().getAllSurveys();
			for (EntityInterface item : items) {
				Surveys survey = (Surveys)item;
				request.setAttribute("id", survey.getId());
				
			%>
			<tr>
				<th scope="row"><input type="radio" name="surveyId" onclick="javascript:abilitaBottone();" value="<%out.print(survey.getId());%>" /></th>
				<td>
					<%
					out.print(survey.getId().toString());
					%>
				</td>
				<td>
					<%
					out.print(survey.getLabel().toString());
					%>
				</td>
				<td>
					<%
					out.print(survey.getTime().toString());
					%>
				</td>
				<td>
					<%
					out.print(survey.getDescription().toString());
					%>
				</td>
			</tr>
			<%
			}
			%>
		</table>
		<input class="btn btn-danger" type="submit" class="button" id="buttonDelete" value="Delete" disabled onclick="javascript:deleteSurvey();">
		<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#updateSurveyModal" onclick="showUpdateSurveyModal(); return false;">MODIFICA</button>
	</form>
</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>

<!-- Modal -->
<div class="modal fade" id="updateSurveyModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Update Survey</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <form  id="updateSurveyForm">
	      <div class="modal-body">
			
			  	<label>ID</label><br>
		  		<input type="number" name="surveyIdToUpdate" id="surveyIdToUpdate" value=""><br>
		  		
		  		<label>Label</label><br>
		  		<input type="text" name="surveyLabelToUpdate" id="surveyLabelToUpdate" value=""><br>
			
		  		<label>Time</label><br>
		  		<input type="number" name="surveyTimeToUpdate" id="surveyTimeToUpdate" value=""><br>
		  		
		  		<label>Description</label><br>
		  		<input type="text" name="surveyDescriptionToUpdate" id="surveyDescriptionToUpdate" value=""><br>
			
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-primary" onclick="update();">Save changes</button>
	      </div>
      </form> 
    </div>
  </div>
</div>

</body>
</html>