<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/27/2022
  Time: 4:33 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div style="display: flex;flex-direction: column">
<h2 style="text-align: center"> Danh sách khách hàng</h2>
<table>
    <tr style="text-align: left">
        <th> Tên </th>
        <th> Ngày sinh </th>
        <th> Địa chỉ </th>
        <th> Ảnh </th>
    </tr>

    <c:forEach items="${listCustomer}" var="customer">
        <tr>
            <td>${customer.name}</td>
            <td>${customer.date}</td>
            <td>${customer.address}</td>
            <td> <img src="${customer.image}" alt="" width="50" height="50"></td>
        </tr>
    </c:forEach>
</table>
</div>
</body>
</html>
