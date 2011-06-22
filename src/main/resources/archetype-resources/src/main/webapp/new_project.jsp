<%@ page import="${package}.service.DatabaseService" %>
<%@ page import="${package}.model.Project" %>
<jsp:useBean id="project" scope="request" class="${package}.model.Project" >
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

    <%
        if(request.getParameter("id") != null) {
            Project p = DatabaseService.getProject(request.getParameter("id"));
            request.setAttribute("project", p);
        }
    %>

<tags:mainlayout>

	<jsp:attribute name="breadcrumb"><a href="index.jsp">Home</a> / <a href="project_list.jsp">Projects</a> / ${dollar}{project.name}</jsp:attribute>
    <jsp:attribute name="hidesearch">true</jsp:attribute>
	<jsp:body>



		<form action="save_project.jsp">
		<table>
			<tr>
                <input type="hidden" size="40" name="id" value="${dollar}{project.id}" />
				<td>Name:</td><td><input type="text" size="40" name="name" value="${dollar}{project.name}" /> </td>
			</tr>
			<tr>
				<td>Description:</td><td><input type="text" size="40" name="desc"  value="${dollar}{project.desc}" /></td>
			</tr>
		</table>
		<p/>

		<input type="submit" value="Save"/>
		<input type="button" value="Projects List" onclick="location.href='project_list.jsp'"/>

		</form>


        <c:if test="${dollar}{project.id!=null}">
        <form action="save_task.jsp">
            <table>
                <tr>
                    <input type="hidden" size="40" name="project_id" value="${dollar}{project.id}" />
                    <td>Task Name:</td><td><input type="text" size="40" name="name" /> </td>
                </tr>
                <tr>
                    <td>Task Description:</td><td><input type="text" size="40" name="desc"  /></td>
                </tr>
            </table>
            <input type="submit" value="Add Task"/>
        </form>

        <table border="1">
            <tr>
                <th>Task Name</th>
                <th>Task Description</th>
            </tr>
        <c:forEach items="${dollar}{project.tasks}" var="t">
                <tr>
                    <td><input type="text" size="40" name="name" value="${dollar}{t.name}"/> </td>
                    <td><input type="text" size="40" name="desc"  value="${dollar}{t.desc}"/></td>
                </tr>
        </c:forEach>
        </table>
    </c:if>

	</jsp:body>


</tags:mainlayout>
</jsp:useBean>