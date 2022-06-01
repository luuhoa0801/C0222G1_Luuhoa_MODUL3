
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Them moi</title>
</head>
<body>
<h1>Thêm mới User</h1>
<a href="/user">Trang list</a>

<form action="/user?action=add" method="post">
<table>
    <tr>
        <td>Name</td>
        <td><input type="text" name="name" placeholder="nhâp tên"></td>
    </tr>
    <tr>
        <td>Email</td>
        <td><input type="text" name="email" placeholder="nhâp email"></td>
    </tr>
    <tr>
        <td>Country</td>
        <td><input type="text" name="country" placeholder="nhâp country"></td>
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
