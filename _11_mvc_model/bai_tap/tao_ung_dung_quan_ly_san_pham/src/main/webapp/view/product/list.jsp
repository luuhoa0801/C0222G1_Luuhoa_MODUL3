<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/30/2022
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Danh sách sản phẩm </h1>
<form action="/product?action=search">
    <input type="hidden" name="action" value="search">
    <input type="text" name="name">
    <button type="submit" value="search">search </button>
</form>
<a href="/product?action=add">Them moi</a>
<table border="1" style="border-collapse:  collapse">
    <tr>
        <th>STT</th>
        <th>Id</th>
        <th>Name</th>
        <th>Gía Sản Phẩm</th>
        <th>Mô tả</th>
        <th>Nhà sản xuất </th>
        <th> Chỉnh sửa</th>
    </tr>

    <c:forEach items="${productList}" var="product" varStatus="status">
        <tr>
            <td>${status.count}</td>
            <td>${product.id}</td>
            <td>${product.name}</td>
            <td>${product.price}</td>
            <td>${product.describe}</td>
            <td>${product.producer}</td>
            <td>
                <a href="/product?action=edit&id=${product.id}"> sửa</a>

            <a href="/product?action=delete&id=${product.id}">xóa</a>

                <a href="/product?action=views&id=${product.id}">xem</a>
            </td>

        </tr>
    </c:forEach>

</table>
</body>
</html>
