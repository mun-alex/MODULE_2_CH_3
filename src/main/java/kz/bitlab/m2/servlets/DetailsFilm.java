package kz.bitlab.m2.servlets;

import kz.bitlab.m2.db.DBManager;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DetailsFilm", value = "/details-film")
public class DetailsFilm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Long id = Long.parseLong(request.getParameter("filmId"));
        request.setAttribute("film", DBManager.getFilmById(id));
        request.getRequestDispatcher("/details.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
