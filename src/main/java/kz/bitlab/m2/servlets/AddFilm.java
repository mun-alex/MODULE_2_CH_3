package kz.bitlab.m2.servlets;

import kz.bitlab.m2.db.DBManager;
import kz.bitlab.m2.model.Film;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "AddFilm", value = "/add-film")
public class AddFilm extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        String title = request.getParameter("title");
        String description = request.getParameter("description");
        Long studioId = Long.parseLong(request.getParameter("studioId"));
        double rating = Double.parseDouble(request.getParameter("rating"));
        Film film = new Film(null, title, description, studioId, rating);
        DBManager.addFilm(film);
        response.sendRedirect("/main");
    }
}
