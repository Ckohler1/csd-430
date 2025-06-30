<%--
    insertResult.jsp
    Author: Colton Kohler
    Date: June 29, 2025
    Assignment: Module 7 - JSP JavaBean Movie App (Add Movie)

    This JSP handles the form submission from insertForm.jsp,
    inserts the new movie into the database, and displays all records in a table.
--%>

<%@ page import="java.util.*, com.colton.beans.MovieBean, com.colton.beans.MovieDetails" %>

<%
  // Get parameters from the form
  String title = request.getParameter("title");
  String genre = request.getParameter("genre");
  String releaseYearStr = request.getParameter("releaseYear");
  String ratingStr = request.getParameter("rating");

  int releaseYear = 0;
  double rating = 0.0;

  try {
    releaseYear = Integer.parseInt(releaseYearStr);
  } catch (Exception e) {
    releaseYear = 0;
  }
  try {
    rating = Double.parseDouble(ratingStr);
  } catch (Exception e) {
    rating = 0.0;
  }

  // Insert the new movie
  MovieBean bean = new MovieBean();
  bean.insertMovie(title, genre, releaseYear, rating);

  // Retrieve updated movie list
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
<p>The new movie has been added. Here is the updated list of movies.</p>

<table border="1" cellpadding="5" cellspacing="0">
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

<br>
<a href="index.jsp">Back to Movie List</a>
</body>
</html>
