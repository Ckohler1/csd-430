<%--
    Author: Colton Kohler
    Date: 6/1/2025
    Assignment: Module 2 Assignment
    Purpose: Display travel memories in Japan using Scriptlets and HTML tables.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %>
<!DOCTYPE html>
<html>
<head>
    <title>My Japan Travel Memories</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<h1>Travel Memories: Japan</h1>
<p>This page displays some of my favorite memories from visiting Japan, grouped by region.</p>

<%
    // Create a list of travel memories grouped by region
    HashMap<String, ArrayList<String[]>> travelMemories = new HashMap<>();

    // Add Tokyo memories
    ArrayList<String[]> tokyo = new ArrayList<>();
    tokyo.add(new String[]{"Ueno, Tokyo", "Arrival dinner", "Sushi at Sushiro"});
    tokyo.add(new String[]{"Akihabara, Tokyo", "Exploring shops", "Ramen at Kyushu Jangara Akihabara"});
    travelMemories.put("Tokyo", tokyo);

    // Add Okinawa memories
    ArrayList<String[]> okinawa = new ArrayList<>();
    okinawa.add(new String[]{"Kumejima, Okinawa", "Arrival in Kumejima", "Okinawa soba at Yanguwa"});
    okinawa.add(new String[]{"Nago, Okinawa", "Exploring Okinawa", "Yakiniku at Yakiniku Goen Okinawa Nago"});
    travelMemories.put("Okinawa", okinawa);

    // Add Hokkaido memories
    ArrayList<String[]> hokkaido = new ArrayList<>();
    hokkaido.add(new String[]{"Niseko, Hokkaido", "Onsen and family time", "Breakfast buffet at Hilton Niseko Village"});
    hokkaido.add(new String[]{"Chitose, Hokkaido", "Farewell lunch with grandparents", "Matsuo Jingiskan New Chitose Airport"});
    travelMemories.put("Hokkaido", hokkaido);

    // Loop through each region to display grouped data in tables
    for (String region : travelMemories.keySet()) {
%>

<h2><%= region %></h2>
<table>
    <tr>
        <th>Location</th>
        <th>Memory</th>
        <th>Food Tried</th>
    </tr>
    <% for (String[] record : travelMemories.get(region)) { %>
    <tr>
        <td><%= record[0] %></td>
        <td><%= record[1] %></td>
        <td><%= record[2] %></td>
    </tr>
    <% } %>
</table>

<%
    } // end region loop
%>
</body>
</html>
