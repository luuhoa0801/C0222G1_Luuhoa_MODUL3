<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/30/2022
  Time: 2:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<h1>Trang thêm mới</h1>
<a href="/product">Trang list</a>
<c:if test="${mess!=null}">
    <p>${mess}</p>
</c:if>
<form action="/product?action=add" method="post">
    <table>
        <tr>
            <td>ID</td>
            <td><input type="text" name="id" placeholder="nhâp id"></td>
        </tr>
        <tr>
            <td>Tên</td>
            <td><input type="text" name="name" placeholder="nhâp tên"></td>
        </tr>
        <tr>
            <td>Gía</td>
            <td><input type="text" name="price" placeholder="nhâp giá "></td>
        </tr>
        <tr>
            <td>trạng thái</td>
            <td><input type="text" name="describe"></td>
        </tr>

        <tr>
            <td>Nhà sản xuất</td>
            <td>
            <td><input type="text" name="producer"></td>
            </td>
        </tr>

        <tr>
            <td></td>
            <td>
                <button type="submit">Lưu</button>
            </td>
        </tr>

    </table>

</form>

</body>
</html>
