<%@ page import="kz.bitlab.m2.model.Film" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="kz.bitlab.m2.db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: alexa
  Date: 12.01.2022
  Time: 19:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>
<body>
<div class="container">
    <%@include file="header.jsp"%>
    <h2 class="mt-3 text-center fw-bold">Фильмы</h2>
    <a href="" class="btn btn-info" data-bs-toggle="modal" data-bs-target="#addNewFilm">Добавить фильм</a>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">Название</th>
            <th scope="col">Описание</th>
            <th scope="col">Студия</th>
            <th scope="col">Рейтинг</th>
            <th scope="col">Детали</th>
        </tr>
        </thead>
        <tbody>
        <%
            ArrayList<Film> allFilms = (ArrayList<Film>) request.getAttribute("allFilms");
            for (Film film : allFilms) {
        %>
        <tr>
            <td><%=film.getId()%></td>
            <td><%=film.getTitle()%></td>
            <td><%=film.getDescription()%></td>
            <td><%=DBManager.getStudioByFilmId(film.getId())%></td>
            <td><%=film.getRating()%></td>
            <td><a href="/details-film?filmId=<%=film.getId()%>" class="btn btn-info">Детали</a></td>
        </tr>
        <%
            }
        %>
        </tbody>
    </table>

    <!-- Modal -->
    <div class="modal fade" id="addNewFilm">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Добавить фильм</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form action="/add-film" method="post">
                        <div class="mb-3">
                            <label for="title" class="form-label">Название</label>
                            <input type="text" class="form-control" name="title" id="title">
                        </div>
                        <div class="mb-3">
                            <label for="description" class="form-label">Описание</label>
                            <textarea name="description" id="description" class="form-control" cols="30" rows="5"></textarea>
                        </div>
                        <div class="mb-3">
                            <label for="studio" class="form-label">Киностудия</label>
                            <select name="studio" id="studio" class="d-block form-control">
                                <option value="WB">WB</option>
                                <option value="Kazakhfilm">Kazakhfilm</option>
                                <option value="Disney">Disney</option>
                            </select>
                        </div>
                        <div class="mb-3">
                            <label for="rating" class="form-label">Рейтинг</label>
                            <input type="text" class="form-control" name="rating" id="rating">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                            <button type="submit" class="btn btn-primary">Добавить фильм</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</div>
</body>
</html>
