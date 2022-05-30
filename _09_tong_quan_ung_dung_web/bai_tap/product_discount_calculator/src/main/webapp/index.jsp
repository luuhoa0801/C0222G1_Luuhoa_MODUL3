<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/27/2022
  Time: 1:41 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <form action="product" method="get">
    <p> Product Description (Mô tả của sản phẩm)</p>
    <input  name="description">

    <p>List Price ( Giá niêm yết của sản phẩm)</p>
    <input  name="price">

    <p>Discount Percent (Tỷ lệ chiết khấu (phần trăm))</p>
    <input   name="percent">

    <button type="submit">Kết quả</button>
  </form>

  <div>
    <p>Lượng chiết khấu: ${discountAmount}</p>

    <p>Giá sau khi đã được chiết khấu: ${discountPrice}</p>

  </div>
  </body>
</html>
