<%@ page import="java.util.List" %>
<%@ page import="${package}.service.DatabaseService" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page session="false" %>

<%
    List list = DatabaseService.getList("Task");
    request.setAttribute("list",list);

%>

<tags:mainlayout>

	<jsp:attribute name="breadcrumb"><a href="index.jsp">Home</a> / Tasks</jsp:attribute>
	
	<jsp:body>
		<table class="itemlist" width="100%">
			<tr>
				<th>Name</th><th>Description</th><th>Parent Project</th>
			</tr>
			<c:forEach items="${dollar}{list}" var="task">
				<tr>
                    <td><a href="new_task.jsp?id=${dollar}{task.id}">${dollar}{task.name}</a></td>
					<td>${dollar}{task.desc}</td>
                    <td>${dollar}{task.project.name}</td>
				</tr>
			</c:forEach>
		</table>
		<p/>
		<form action="" method="post">
			<input type="button" name="New Task" value="New Task" onclick="location.href='new_task.jsp'"/>
		</form>
	</jsp:body>

</tags:mainlayout>