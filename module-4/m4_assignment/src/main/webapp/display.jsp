<%--
    Author: Colton Kohler
    Date: 06/15/2025
    Assignment: Module 4 – JSP Travel Display
    Purpose: Display travel memories from JavaBeans in an HTML table using Scriptlets
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<%@ page import="beans.TravelMemory" %>

<!DOCTYPE html>
<html>
<head>
    <title>Travel Memories Using JavaBean</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
<h1>Travel Memories: Japan</h1>
<p>This page displays favorite travel memories from Japan using JavaBeans and Scriptlets.</p>

<%
    HashMap<String, ArrayList<TravelMemory>> memories = new HashMap<>();

    ArrayList<TravelMemory> tokyo = new ArrayList<>();
    tokyo.add(new TravelMemory("Ueno, Tokyo", "Arrival dinner", "Sushi at Sushiro", "2024-05-13", "7/10"));
    tokyo.add(new TravelMemory("Akihabara, Tokyo", "Exploring shops", "Ramen at Kyushu Jangara", "2024-05-14", "9/10"));
    memories.put("Tokyo", tokyo);

    ArrayList<TravelMemory> okinawa = new ArrayList<>();
    okinawa.add(new TravelMemory("Kumejima, Okinawa", "Arrival in Kumejima", "Okinawa soba at Yanguwa", "2024-05-17", "10/10"));
    okinawa.add(new TravelMemory("Nago, Okinawa", "Exploring Okinawa", "Yakiniku at Goen Okinawa Nago", "2024-05-21", "6/10"));
    memories.put("Okinawa", okinawa);

    ArrayList<TravelMemory> hokkaido = new ArrayList<>();
    hokkaido.add(new TravelMemory("Niseko, Hokkaido", "Onsen and family time", "Buffet at Hilton Niseko", "2024-05-24", "10/10"));
    hokkaido.add(new TravelMemory("Chitose, Hokkaido", "Farewell lunch with grandparents", "Matsuo Jingiskan", "2024-05-25", "8/10"));
    memories.put("Hokkaido", hokkaido);

    for (String region : memories.keySet()) {
%>
<h2><%= region %></h2>
<table>
    <tr>
        <th>Location</th>
        <th>Memory</th>
        <th>Food Tried</th>
        <th>Date</th>
        <th>Rating</th>
    </tr>
    <% for (TravelMemory tm : memories.get(region)) { %>
    <tr>
        <td><%= tm.getLocation() %></td>
        <td><%= tm.getMemory() %></td>
        <td><%= tm.getFood() %></td>
        <td><%= tm.getDate() %></td>
        <td><%= tm.getRating() %></td>
    </tr>
    <% } %>
</table>
<% } %>
</body>
</html>
