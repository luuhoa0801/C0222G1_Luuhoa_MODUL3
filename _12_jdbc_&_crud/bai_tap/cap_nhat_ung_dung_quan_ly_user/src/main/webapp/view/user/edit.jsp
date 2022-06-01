<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 6/1/2022
  Time: 4:35 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>edit</title>
</head>
<body>
<h1>Edit User</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p><a href="/user"></a></p>
<form action="/user?action=edit&id=${requestScope["user"].getId()}" method="post" >
    <legend>User information</legend>
    <table>

        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" id="name" value="${requestScope["user"].getName()}"></td>
        </tr>
        <tr>
            <td>Email:</td>
            <td><input type="text" name="email" id="email" value="${requestScope["user"].getEmail()}"></td>
        </tr>
        <tr>
            <td>Country:</td>
            <td><input type="text" name="country" id="country" value="${requestScope["user"].getCountry()}"></td>
        </tr>

        <tr>
            <td></td>
            <td>
                <button type="submit"> update</button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
