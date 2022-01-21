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

</div>
</body>
</html>
