package ${package}.servlets;

import ${package}.model.Project;
import ${package}.model.Task;
import ${package}.service.DatabaseService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Created by IntelliJ IDEA.
 * User: niqbal
 * Date: 6/22/11
 * Time: 9:29 AM
 * To change this template use File | Settings | File Templates.
 */
public class SaveTask extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Task task = new Task();
        task.setId((request.getParameter("id")));
        task.setName((request.getParameter("name")));
        task.setDesc((request.getParameter("desc")));
        if (request.getParameter("project_id") != null) {
            DatabaseService.saveTask(request.getParameter("project_id").toString(), task);
            response.sendRedirect("NewProject?id="+request.getParameter("project_id").toString());
        }
        else {
            DatabaseService.saveTask(task);
            response.sendRedirect("TaskList");
        }
    }
}
