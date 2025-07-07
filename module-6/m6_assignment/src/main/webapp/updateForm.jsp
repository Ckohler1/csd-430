<%--
    Author: Colton Kohler
    Date: July 6, 2025
    Assignment: Module 8 – JSP JavaBean Movie Update
    Description:
    This JSP displays a form populated with the selected movie’s details for editing.
--%>

<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="com.colton.beans.MovieDetails" %>
<%
  int movieId = Integer.parseInt(request.getParameter("movieId"));
  MovieBean bean = new MovieBean();
  MovieDetails movie = bean.getMovieById(movieId);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Edit Movie</title>
</head>
<body>
<h1>Edit Movie</h1>
<form action="updateResult.jsp" method="post">
  <p>
    <strong>Movie ID:</strong> <%= movie.getId() %>
    <input type="hidden" name="movieId" value="<%= movie.getId() %>">
  </p>
  <p>
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" value="<%= movie.getTitle() %>" required>
  </p>
  <p>
    <label for="genre">Genre:</label>
    <input type="text" name="genre" id="genre" value="<%= movie.getGenre() %>" required>
  </p>
  <p>
    <label for="year">Release Year:</label>
    <input type="number" name="year" id="year" value="<%= movie.getReleaseYear() %>" required>
  </p>
  <p>
    <label for="rating">Rating:</label>
    <input type="number" step="0.1" name="rating" id="rating" value="<%= movie.getRating() %>" required>
  </p>
  <input type="submit" value="Update Movie">
</form>
<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
