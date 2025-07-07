<%--
    Author: Colton Kohler
    Date: July 6, 2025
    Assignment: Module 8 – JSP JavaBean Movie Update
    Description:
    Description:
    This JSP displays a dropdown menu of movies for the user to select a record to update.

--%>

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
  <title>Select a Movie to Update</title>
</head>
<body>
<h1>Select a Movie to Update</h1>
<form action="updateForm.jsp" method="get">
  <label for="movieId">Movie Title:</label>
  <select name="movieId" id="movieId" required>
    <% for (MovieDetails movie : movies) { %>
    <option value="<%= movie.getId() %>"><%= movie.getTitle() %></option>
    <% } %>
  </select>
  <input type="submit" value="Edit Movie">
</form>
<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
