<%--
    Author: Colton Kohler
    Date: 6/8/2025
    Assignment: Module 3 Assignment
    Purpose: Display submitted Japan travel feedback using Scriptlets
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Feedback Summary</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Thank You for Your Feedback!</h1>
<p>Here is what you submitted:</p>

<%
    String name = request.getParameter("name");
    String region = request.getParameter("region");
    String activity = request.getParameter("activity");
    String rating = request.getParameter("rating");
    String recommend = request.getParameter("recommend");
    if (recommend == null) recommend = "No";
%>

<table>
    <tr><th>Field</th><th>Your Input</th></tr>
    <tr><td>Name</td><td><%= name %></td></tr>
    <tr><td>Region Visited</td><td><%= region %></td></tr>
    <tr><td>Favorite Activity</td><td><%= activity %></td></tr>
    <tr><td>Food Rating</td><td><%= rating %> / 5</td></tr>
    <tr><td>Would Recommend</td><td><%= recommend %></td></tr>
</table>
</body>
</html>
