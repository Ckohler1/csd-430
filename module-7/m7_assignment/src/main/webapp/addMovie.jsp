<%--
    addMovie.jsp
    Author: Colton Kohler
    Date: June 29, 2025
    Assignment: Module 7 - JSP JavaBean Movie Insert
    Description:
    This JSP page displays a form to add a new movie to the database.
--%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Add a New Movie</title>
</head>
<body>
<h1>Add a New Movie</h1>
<form action="insertResult.jsp" method="post">
  <p>
    <label for="title">Title:</label>
    <input type="text" name="title" id="title" required>
  </p>
  <p>
    <label for="genre">Genre:</label>
    <input type="text" name="genre" id="genre" required>
  </p>
  <p>
    <label for="year">Release Year:</label>
    <input type="number" name="year" id="year" required>
  </p>
  <p>
    <label for="rating">Rating:</label>
    <input type="number" name="rating" id="rating" step="0.1" required>
  </p>
  <input type="submit" value="Add Movie">
</form>
<p><a href="index.jsp">Back to Movie List</a></p>
</body>
</html>
