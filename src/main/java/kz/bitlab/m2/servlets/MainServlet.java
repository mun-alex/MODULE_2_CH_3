package kz.bitlab.m2.servlets;

import kz.bitlab.m2.db.DBManager;
import kz.bitlab.m2.model.User;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "MainServlet", value = "/main")
public class MainServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        DBManager.connectToDB();
        request.setAttribute("allFilms", DBManager.getAllFilms());

        HttpSession session = request.getSession();
        User currentUser = (User) session.getAttribute("CURRENT_USER");

        if (currentUser != null) {
            request.getRequestDispatcher("/adminPanel.jsp").forward(request, response);
        } else  {
            request.getRequestDispatcher("/index.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
