<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Inbox</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
    <%@ page import="java.util.*" %>
    <%
        String user = (String) session.getAttribute("user");
        if (user == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        List<String> inbox = (List<String>) session.getAttribute("inbox");
        if (inbox == null) {
            inbox = new ArrayList<>();
            session.setAttribute("inbox", inbox);
        }

        List<String> sent = (List<String>) session.getAttribute("sent");
        if (sent == null) {
            sent = new ArrayList<>();
            session.setAttribute("sent", sent);
        }

        String to = request.getParameter("to");
        String subject = request.getParameter("subject");
        String body = request.getParameter("body");
        if (to != null && !to.trim().isEmpty()) {
            String mail = "To: " + to + " | Subject: " + (subject == null ? "" : subject) + " | Body: " + (body == null ? "" : body) + " | Sent: " + new Date();
            sent.add(mail);
            request.setAttribute("mailMessage", "Sent mail details updated.");
        }
    %>
    <h2>Welcome, <%= user %>!</h2>
    <p><a href="logout.jsp" class="logout-link">Logout</a></p>

    <h3>Inbox Messages</h3>
    <ul>
        <% for (String message : inbox) { %>
            <li><%= message %></li>
        <% } %>
    </ul>

    <h3>Compose Email</h3>
    <% if (request.getAttribute("mailMessage") != null) { %>
        <p class="success"><%= request.getAttribute("mailMessage") %></p>
    <% } %>
    <form method="post" action="inbox.jsp">
        To: <input type="text" name="to" required><br><br>
        Subject: <input type="text" name="subject"><br><br>
        Body:<br>
        <textarea name="body" rows="5" cols="40" required></textarea><br><br>
        <input type="submit" value="Send">
    </form>

    <h3>Sent Messages</h3>
    <ul>
        <% if (sent.isEmpty()) { %>
            <li>No sent messages yet.</li>
        <% } else {
            for (String s : sent) { %>
                <li><%= s %></li>
        <% }
        } %>
    </ul>
</body>
</html>