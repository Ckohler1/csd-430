<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="java.util.List" %>
<%@ page import="com.colton.beans.MovieDetails" %>
<%
    MovieBean bean = new MovieBean();
    List<MovieDetails> movies = bean.getAllMovies();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Movie List</title>
</head>
<body>
<h1>Movie List</h1>

<p>
    <a href="addMovie.jsp">Add a New Movie</a> |
    <a href="updateSelect.jsp">Update Existing Movie</a>
</p>

<p>Choose a movie title from the list below to view its details.</p>
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
</body>
</html>

