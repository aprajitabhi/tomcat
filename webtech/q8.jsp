<!DOCTYPE html>
<html>
<head>
    <title>Date & Time</title>

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

        .time {
            font-size: 18px;
            color: green;
            margin-top: 10px;
        }
    </style>
</head>

<body>
<%@ page import="java.util.Date" %>

<div class="box">
    <h2>Current Date & Time</h2>
    
    <div class="time">
        <%= new Date() %>
    </div>
</div>

</body>
</html>