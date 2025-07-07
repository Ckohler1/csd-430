<%@ page import="com.colton.beans.MovieBean" %>
<%
  String title = request.getParameter("title");
  String genre = request.getParameter("genre");
  int year = Integer.parseInt(request.getParameter("year"));
  double rating = Double.parseDouble(request.getParameter("rating"));

  MovieBean bean = new MovieBean();
  boolean success = bean.insertMovie(title, genre, year, rating);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Insert Result</title>
</head>
<body>
<h1>Insert Movie Result</h1>
<% if(success) { %>
<p>The movie was added successfully.</p>
<% } else { %>
<p>There was an error adding the movie.</p>
<% } %>
<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
