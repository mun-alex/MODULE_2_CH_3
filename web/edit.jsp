<%@ page import="kz.bitlab.m2.model.Film" %>
<%@ page import="java.util.ArrayList" %><%--
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
    <%
        Film film = (Film) request.getAttribute("film");
    %>
    <div class="row">
        <div class="col-lg-5 m-auto">
            <form action="/edit-film?filmId=<%=film.getId()%>" method="post">
                <h3>Редактировать</h3>
                <div class="mb-3">
                    <label for="title" class="form-label">Название</label>
                    <input type="text" class="form-control" value="<%=film.getTitle()%>" name="title" id="title">
                </div>
                <div class="mb-3">
                    <label for="description" class="form-label">Описание</label>
                    <textarea name="description" id="description" class="form-control" cols="30" rows="5"><%=film.getDescription()%></textarea>
                </div>
                <div class="mb-3">
                    <label for="studio" class="form-label">Киностудия</label>
                    <select name="studio" id="studio" class="d-block form-control">
                        <option value="<%=film.getStudio()%>"><%=film.getStudio()%></option>
                        <option value="WB">WB</option>
                        <option value="Kazakhfilm">Kazakhfilm</option>
                        <option value="Disney">Disney</option>
                    </select>
                </div>
                <div class="mb-3">
                    <label for="rating" class="form-label">Рейтинг</label>
                    <input type="text" value="<%=film.getRating()%>" class="form-control" name="rating" id="rating">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Закрыть</button>
                    <button type="submit" class="btn btn-primary">Сохранить</button>
                </div>
            </form>
        </div>
    </div>

</div>
</body>
</html>
