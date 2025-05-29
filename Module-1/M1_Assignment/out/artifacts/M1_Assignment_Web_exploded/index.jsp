<%@ page contentType="text/html;charset=UTF-8" %>
<%@ page import="java.util.Random" %>
<!DOCTYPE html>
<html>
<head>
    <title>Random Joke Generator</title>
</head>
<body>
<h1>😂 Welcome to the JSP Joke Machine!</h1>
<%
    String[] jokes = {
            "Why don’t scientists trust atoms? Because they make up everything!",
            "What do you call fake spaghetti? An impasta.",
            "Why was the math book sad? It had too many problems.",
            "Parallel lines have so much in common. It’s a shame they’ll never meet.",
            "What do you get when you cross a snowman and a dog? Frostbite!"
    };
    Random rand = new Random();
    int i = rand.nextInt(jokes.length);
%>
<p><strong>Here's a random joke:</strong></p>
<p><em><%= jokes[i] %></em></p>
</body>
</html>