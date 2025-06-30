<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.colton.beans.MovieBean" %>
<%@ page import="com.colton.beans.MovieDetails" %>

<%--
    result.jsp
    Author: Colton Kohler
    Date: June 29, 2025
    Assignment: Module 7 - JSP JavaBean Movie App

    Description:
    This JSP receives a movie ID from the form in index.jsp, fetches the movie details from the bean,
    and displays them to the user.
--%>

<%
  String movieIdParam = request.getParameter("movieId");
  MovieDetails movie = null;

  if (movieIdParam != null) {
    try {
      int movieId = Integer.parseInt(movieIdParam);
      MovieBean bean = new MovieBean();
      movie = bean.getMovieById(movieId);
    } catch (NumberFormatException e) {
      out.println("<p>Invalid movie ID format.</p>");
    }
  } else {
    out.println("<p>No movie selected.</p>");
  }
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Movie Details</title>
</head>
<body>
<h1>Movie Details</h1>

<% if (movie != null) { %>
<p><strong>Title:</strong> <%= movie.getTitle() %></p>
<p><strong>Genre:</strong> <%= movie.getGenre() %></p>
<p><strong>Release Year:</strong> <%= movie.getReleaseYear() %></p>
<p><strong>Rating:</strong> <%= movie.getRating() %></p>
<% } else { %>
<p>Movie not found or an error occurred.</p>
<% } %>

<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
