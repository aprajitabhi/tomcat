<!DOCTYPE html>
<html>
<head>
    <title>JSP Implicit Objects</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            background-color: #f2f2f2;
            margin-top: 100px;
        }

        .box {
            display: inline-block;
            padding: 20px;
            border: 2px solid black;
            background-color: white;
            border-radius: 10px;
        }

        h2 {
            color: darkblue;
        }

        .info {
            font-size: 16px;
            color: green;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>JSP Implicit Objects Example</h2>

    <%
        // Session object
        session.setAttribute("username", "Aprajit Abhi");

        // Request object
        String method = request.getMethod();

        // Response object
        response.setContentType("text/html");
    %>

    <div class="info">
        Request Method: <%= method %><br>
        Session Username: <%= session.getAttribute("username") %>
    </div>
</div>

</body>
</html>