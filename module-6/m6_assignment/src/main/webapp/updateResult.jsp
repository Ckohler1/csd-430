<%--
    Author: Colton Kohler
    Date: July 6, 2025
    Assignment: Module 8 – JSP JavaBean Movie Update
    Description:
    This JSP shows the updated movie record after submission.
--%>

<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="com.colton.beans.MovieDetails" %>
<%
  int id = Integer.parseInt(request.getParameter("movieId"));
  String title = request.getParameter("title");
  String genre = request.getParameter("genre");
  int year = Integer.parseInt(request.getParameter("year"));
  double rating = Double.parseDouble(request.getParameter("rating"));

  MovieBean bean = new MovieBean();
  boolean success = bean.updateMovie(id, title, genre, year, rating);
  MovieDetails updatedMovie = bean.getMovieById(id);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Update Result</title>
</head>
<body>
<h1>Update Movie Result</h1>
<% if(success) { %>
<p>The movie was updated successfully. Here are the updated details:</p>
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
  <tr>
    <td><%= updatedMovie.getId() %></td>
    <td><%= updatedMovie.getTitle() %></td>
    <td><%= updatedMovie.getGenre() %></td>
    <td><%= updatedMovie.getReleaseYear() %></td>
    <td><%= updatedMovie.getRating() %></td>
  </tr>
  </tbody>
</table>
<% } else { %>
<p>There was an error updating the movie.</p>
<% } %>
<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
