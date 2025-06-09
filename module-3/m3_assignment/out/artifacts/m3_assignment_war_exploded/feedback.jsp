<%--
    Author: Colton Kohler
    Date: 6/8/2025
    Assignment: Module 3 Assignment
    Purpose: Form to collect Japan travel feedback from users
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Japan Travel Feedback</title>
  <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Japan Travel Feedback Form</h1>
<p>Please fill out the form below to share your travel experience in Japan.</p>

<form action="result.jsp" method="post">
  <label for="name">Your Name:</label>
  <input type="text" id="name" name="name" required><br>

  <label for="region">Region Visited:</label>
  <select id="region" name="region">
    <option value="Tokyo">Tokyo</option>
    <option value="Hokkaido">Hokkaido</option>
    <option value="Kyoto">Kyoto</option>
    <option value="Okinawa">Okinawa</option>
    <option value="Other">Other</option>
  </select><br>

  <label for="activity">Favorite Activity:</label>
  <input type="text" id="activity" name="activity" required><br>

  <label>Food Rating:</label><br>
  <input type="radio" name="rating" value="1">1
  <input type="radio" name="rating" value="2">2
  <input type="radio" name="rating" value="3" checked>3
  <input type="radio" name="rating" value="4">4
  <input type="radio" name="rating" value="5">5<br>

  <label for="recommend">Would you recommend this trip?</label>
  <input type="checkbox" id="recommend" name="recommend" value="Yes"><br>

  <input type="submit" value="Submit Feedback">
</form>
</body>
</html>
