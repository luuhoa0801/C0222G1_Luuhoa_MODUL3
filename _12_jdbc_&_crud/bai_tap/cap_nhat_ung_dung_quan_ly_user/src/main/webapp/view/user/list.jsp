<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 6/1/2022
  Time: 8:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<a href="/user?action=add">Them moi</a>
<p>${mess}</p>
<form action="/user?action=search" method="post">
    <input type="text" name="country">
    <input type="submit" value="search">
</form>

<form action="/user?action=sort" method="post">
    <input type="submit" value="sort">
</form>

<table  border="1" style="border-collapse:  collapse;padding-top: 10px">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Email</th>
        <th>Country</th>
        <th>Chỉnh sửa</th>

    </tr>
    <c:forEach items="${userList}" var="user">

<tr>
    <td>${user.id}</td>
    <td>${user.name}</td>
    <td>${user.email}</td>
    <td>${user.country}</td>
    <td>
        <a href="/user?action=edit&id=${user.id}">edit</a>
    </td>
</tr>
    </c:forEach>
</table>


</body>
</html>
