<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/31/2022
  Time: 1:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<p><a href="/product">Back to customer list</a></p>

<table>
    <c:forEach items="${productList}" var="product">
<%--        <tr>--%>
<%--            <td>${product.getId()} </td>--%>
<%--            <td>${product.getName()} </td>--%>
<%--            <td>${product.getPrice()} </td>--%>
<%--            <td>${product.getDescribe()} </td>--%>
<%--            <td>${product.getProducer()} </td>--%>
<%--        </tr>--%>
        <tr>
            <td>Id: </td>
            <td>${product.getId()}</td>
        </tr>
        <tr>
            <td>Name: </td>
            <td>${product.getName()}</td>
        </tr>
        <tr>
            <td>Price: </td>
            <td>${product.getPrice()}</td>
        </tr>
        <tr>
            <td>Describe: </td>
            <td>${product.getDescribe()}</td>
        </tr>
        <tr>
            <td>Producer: </td>
            <td>${product.getProducer()}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
