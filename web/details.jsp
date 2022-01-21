<%@ page import="kz.bitlab.m2.model.Film" %>
<%@ page import="kz.bitlab.m2.db.DBManager" %><%--
  Created by IntelliJ IDEA.
  User: alexa
  Date: 12.01.2022
  Time: 20:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%@include file="head.jsp"%>
<body>
<div class="container">
    <%@include file="header.jsp"%>
    <div class="row">
        <div class="col-lg-5 m-auto">
        <%
            Film film = (Film) request.getAttribute("film");
        %>
            <h3><%=film.getTitle()%></h3>
            <p><%=film.getDescription()%></p>
            <p><%=DBManager.getStudioByFilmId(film.getId())%></p>
            <p><%=film.getRating()%></p>
            <a href="/edit-film?filmId=<%=film.getId()%>" class="btn btn-primary">Изменить</a>
            <a href="" class="btn btn-danger">Удалить</a>
        </div>
    </div>
</div>
</body>
</html>
