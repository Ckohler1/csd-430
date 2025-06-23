<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="com.colton.beans.MovieDetails" %>

<%--
    index.jsp
    Author: Colton Kohler
    Date: June 22, 2025
    Assignment: Module 6 - JSP JavaBean Movie App

    Description:
    This JSP page displays a dropdown menu populated with movie titles from a MySQL database.
    Users can select a movie and submit the form to view its full details on result.jsp.
--%>

<%
    // Create an instance of the JavaBean
    MovieBean bean = new MovieBean();

    // Retrieve the list of movies (ID and title only)
    List<MovieDetails> movies = bean.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Select a Movie</title>
</head>
<body>
<h1>Select a Movie</h1>
<p>Choose a movie title from the list below to view its details.</p>

<!-- Form to submit selected movie ID -->
<form action="result.jsp" method="post">
    <label for="movieId">Movie Title:</label>
    <select name="movieId" id="movieId">
        <%-- Loop through movies and generate dropdown options --%>
        <% for (MovieDetails movie : movies) { %>
        <option value="<%= movie.getId() %>"><%= movie.getTitle() %></option>
        <% } %>
    </select>
    <br><br>
    <input type="submit" value="View Details">
</form>
</body>
</html>
