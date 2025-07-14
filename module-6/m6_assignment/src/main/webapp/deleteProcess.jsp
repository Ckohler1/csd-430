<%--
    deleteProcess.jsp
    Author: Colton Kohler
    Date: July 13 2025
    Assignment: Module 9 - JSP JavaBean Movie Delete
    Description:
    This JSP deletes the selected movie and returns to deleteRecords.jsp.
--%>
<%@ page import="java.util.List" %>
<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="com.colton.beans.MovieDetails" %>

<%
  int id = Integer.parseInt(request.getParameter("movieId"));
  MovieBean bean = new MovieBean();
  boolean deleted = bean.deleteMovie(id);
  List<MovieDetails> movies = bean.getAllMovies();
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Delete Result</title>
</head>
<body>
<h1>Delete Result</h1>
<% if (deleted) { %>
<p>Movie deleted successfully.</p>
<% } else { %>
<p>Error deleting movie.</p>
<% } %>

<h2>Remaining Movies</h2>

<% if (movies.isEmpty()) { %>
<p>No movies remaining.</p>
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

<h3>Select another movie to delete:</h3>
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
