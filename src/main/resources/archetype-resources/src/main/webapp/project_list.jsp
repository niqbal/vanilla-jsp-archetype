<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<tags:mainlayout>


	<jsp:attribute name="breadcrumb"><a href="index.jsp">Home</a> / Projects</jsp:attribute>
	
	<jsp:body>
		<table class="itemlist" width="100%">
			<tr>
				<th>Name</th><th>Desc</th>
			</tr>
			<c:forEach items="${dollar}{list}" var="project">
				<tr>
					<td><a href="NewProject?id=${dollar}{project.id}">${dollar}{project.name}</a></td>
					<td>${dollar}{project.desc}</td>
				</tr>
			</c:forEach>
		</table>
		<p/>
		<form action="" method="post">
			<input type="button" name="New Project" value="New Project" onclick="location.href='NewProject'"/>
		</form>
	</jsp:body>

</tags:mainlayout>