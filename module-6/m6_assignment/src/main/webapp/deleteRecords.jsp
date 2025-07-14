<%--
    deleteRecords.jsp
    Author: Colton Kohler
    Date: July 13 2025
    Assignment: Module 9 - JSP JavaBean Movie Delete
    Description:
    This JSP displays all records in a table and a dropdown to select a movie to delete.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="com.colton.beans.MovieDetails" %>

<%
    MovieBean bean = new MovieBean();
    List<MovieDetails> movies = bean.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Movie Record</title>
</head>
<body>
<h1>Delete Movie Record</h1>

<% if (movies.isEmpty()) { %>
<p>No movies to display.</p>
<% } else { %>
<table border="1">
    <thead>
    <tr>
        <th>ID</th>
        <th>Title</th>
        <th>Genre</th>
        <th>Release Year</th>
        <th>Rating</th>
    </tr>
    </thead>
    <tbody>
    <% for (MovieDetails movie : movies) { %>
    <tr>
        <td><%= movie.getId() %></td>
        <td><%= movie.getTitle() %></td>
        <td><%= movie.getGenre() %></td>
        <td><%= movie.getReleaseYear() %></td>
        <td><%= movie.getRating() %></td>
    </tr>
    <% } %>
    </tbody>
</table>

<h3>Select a movie to delete:</h3>
<form action="deleteProcess.jsp" method="post">
    <label for="movieId">Movie ID:</label>
    <select name="movieId" id="movieId" required>
        <% for (MovieDetails movie : movies) { %>
        <option value="<%= movie.getId() %>">
            <%= movie.getId() %> - <%= movie.getTitle() %>
        </option>
        <% } %>
    </select>
    <input type="submit" value="Delete Movie">
</form>
<% } %>

<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
