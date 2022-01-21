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
    <div class="row">
        <div class="col-lg-5 mt-5 m-auto">
            <form action="/auth" method="post">
                <h3>Login</h3>
                <%
                    if (request.getParameter("emailError") != null) {
                %>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        Such Email does not exist!
                    </div>
                </div>
                <%
                    }
                %>

                <%
                    if (request.getParameter("passwordError") != null) {
                %>
                <div class="alert alert-danger d-flex align-items-center" role="alert">
                    <svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img" aria-label="Danger:"><use xlink:href="#exclamation-triangle-fill"/></svg>
                    <div>
                        Password is wrong!
                    </div>
                </div>
                <%
                    }
                %>
                <div class="mb-3">
                    <label for="userEmail" class="form-label">Email:</label>
                    <input type="text" class="form-control" name="userEmail" id="userEmail">
                </div>
                <div class="mb-3">
                    <label for="userPassword" class="form-label">Password:</label>
                    <input type="password" class="form-control" name="userPassword" id="userPassword">
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary">Login</button>
                </div>
            </form>
        </div>
    </div>
</div>
</body>
</html>
