<%--
    index.jsp
    Author: Colton Kohler
    Date: July 13 2025
    Assignment: Module 9 - JSP JavaBean Movie Delete

--%>
<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.colton.beans.MovieDetails" %>
<%
    // Retrieve all movies from the database
    MovieBean bean = new MovieBean();
    List<MovieDetails> movies = bean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie List</title>
    <style>
        body { font-family: Arial, sans-serif; }
        table { border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 8px 12px; border: 1px solid #333; }
        th { background-color: #eee; }
        a { margin-right: 10px; }
    </style>
</head>
<body>
<h1>Movie List</h1>

<p>
    <a href="addMovie.jsp">Add a New Movie</a> |
    <a href="updateSelect.jsp">Update Existing Movie</a> |
    <a href="deleteRecords.jsp">Delete Movie</a>
</p>

<p>Select a movie below to view its details:</p>
<form action="result.jsp" method="post">
    <label for="movieId">Movie Title:</label>
    <select name="movieId" id="movieId" required>
        <% for (MovieDetails movie : movies) { %>
        <option value="<%= movie.getId() %>"><%= movie.getTitle() %></option>
        <% } %>
    </select>
    <input type="submit" value="View Details">
</form>

<h2>All Movies</h2>
<table>
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

</body>
</html>
