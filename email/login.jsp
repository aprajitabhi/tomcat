<%@ page import="java.util.*" %>
<%
    String user = request.getParameter("username");
    String pass = request.getParameter("password");

    if ("admin".equals(user) && "1234".equals(pass)) {
        session.setAttribute("user", user);

        List<String> inbox = new ArrayList<>();
        inbox.add("Welcome to your inbox, " + user + "!");
        inbox.add("Email 1: From support@sample.app - Your account is ready.");
        inbox.add("Email 2: From team@sample.app - Enjoy your demo mailbox.");
        session.setAttribute("inbox", inbox);

        List<String> sent = new ArrayList<>();
        session.setAttribute("sent", sent);

        response.sendRedirect("inbox.jsp");
        return;
    } else {
        request.setAttribute("error", "Invalid username or password.");
        request.getRequestDispatcher("index.jsp").forward(request, response);
        return;
    }
%>