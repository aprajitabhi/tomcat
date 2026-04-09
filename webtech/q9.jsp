<!DOCTYPE html>
<html>
<head>
    <title>JSP Scriptlet Example</title>

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

        .result {
            font-size: 18px;
            color: green;
            margin-top: 10px;
        }
    </style>
</head>

<body>

<div class="box">
    <h2>JSP Scriptlet & Expression Example</h2>

    <%
        int a = 10;
        int b = 20;
        int sum = a + b;
    %>

    <div class="result">
        Sum of <%= a %> and <%= b %> is: <%= sum %>
    </div>
</div>

</body>
</html>