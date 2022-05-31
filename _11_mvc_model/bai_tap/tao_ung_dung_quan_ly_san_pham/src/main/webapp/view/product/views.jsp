<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/31/2022
  Time: 9:25 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Product</title>
</head>
<body>
<p> <a href="/product">Back to customer list</a> </p>

<form action="/product?action=views&id=${requestScope["product"].getId()}" method="get">
    <table>
        <tr>
            <td>Name: </td>
            <td>${requestScope["product"].getName()}</td>
        </tr>
        <tr>
            <td>Price: </td>
            <td>${requestScope["product"].getPrice()}</td>
        </tr>
        <tr>
        <td>Describe: </td>
        <td>${requestScope["product"].getDescribe()}</td>
        </tr>
        <tr>
            <td>Producer: </td>
            <td>${requestScope["product"].getProducer()}</td>
        </tr>
    </table>
</form>
</body>
</html>
