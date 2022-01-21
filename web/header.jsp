<%@ page import="kz.bitlab.m2.model.User" %><%--
  Created by IntelliJ IDEA.
  User: alexa
  Date: 12.01.2022
  Time: 19:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<header>
  <%
    User currentUser = (User) session.getAttribute("CURRENT_USER");
    if (currentUser != null) {
  %>
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link" href="/main">Все фильмы</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Киностудии</a>
    </li>
    <div class="ms-auto d-flex">
      <li class="nav-item ms-auto">
        <a class="nav-link" href=""><%=currentUser.getName()%></a>
      </li>
      <li class="nav-item ms-auto">
        <a class="nav-link" href="/logout">Выйти</a>
      </li>
    </div>

  </ul>
  <%
    } else {
  %>
  <ul class="nav">
    <li class="nav-item">
      <a class="nav-link" href="/main">Все фильмы</a>
    </li>
    <li class="nav-item">
      <a class="nav-link" href="#">Киностудии</a>
    </li>
    <li class="nav-item ms-auto">
      <a class="nav-link" href="/auth">Войти</a>
    </li>
  </ul>
  <%
    }
  %>
</header>
</body>
</html>
