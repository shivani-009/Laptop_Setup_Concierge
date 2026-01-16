package com.laptopsetup.servlet;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import com.laptopsetup.dao.AppDAO;
import com.laptopsetup.model.App;

@WebServlet("/fetchApps")
public class AppServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int osId = Integer.parseInt(request.getParameter("os"));
        int userTypeId = Integer.parseInt(request.getParameter("userType"));

        List<App> apps = AppDAO.getApps(osId, userTypeId);

        request.setAttribute("apps", apps);
        RequestDispatcher rd = request.getRequestDispatcher("apps.jsp");
        rd.forward(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.sendRedirect("index.jsp");
    }
}
