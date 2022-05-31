<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/30/2022
  Time: 10:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Edit customer</h1>
<p>
    <c:if test='${requestScope["message"] != null}'>
        <span class="message">${requestScope["message"]}</span>
    </c:if>
</p>
<p>
    <a href="/product">Back to customer list</a>
</p>
<legend>product information</legend>
<form action="/product?action=delete&id=${requestScope["product"].getId()}" method="post">
    <table>
        <tr>
            <td>Name:</td>
            <td><input type="text" name="name" id="name" value="${requestScope["product"].getName()}"></td>
        </tr>
        <tr>
            <td>Price:</td>
            <td><input type="text" name="price" id="price" value="${requestScope["product"].getPrice()}"></td>
        </tr>
        <tr>
            <td>Describe:</td>
            <td><input type="text" name="describe" id="describe" value="${requestScope["product"].getDescribe()}"></td>
        </tr>
        <tr>
            <td>Producer:</td>
            <td><input type="text" name="producer" id="producer" value="${requestScope["product"].getProducer()}"></td>
        </tr>
        <tr>
            <td>Id:</td>
            <td><input type="text" value="${requestScope["product"].getId()}"></td>
        </tr>
        <tr>
            <td></td>
            <td>
                <input  type="submit"> xóa </input>
            </td>
        </tr>
    </table>
</form>

</body>
</html>
