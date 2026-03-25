<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <%@ ErrorPage=Error.jsp %>
    <h1>Hello AK</h1>
    <%
        int num=0;
        if(num==0)
        {
            throw new ArithmeticException("Add number betwwen 1 to 9");
        }
        else
        {
            out.println(num);
        }
    %>
</body>
</html>