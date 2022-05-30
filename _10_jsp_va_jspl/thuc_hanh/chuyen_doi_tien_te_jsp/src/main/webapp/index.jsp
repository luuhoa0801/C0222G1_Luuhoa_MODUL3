<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/27/2022
  Time: 3:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h2>Currency Converter</h2>
  <form action="controller.jsp" method="get">
    <label>Rate: </label><br/>
    <input type="text" name="rate" placeholder="RATE" /><br/>

    <label>USD: </label><br/>
    <input type="text" name="usd" placeholder="USD" /><br/>

    <input type = "submit" id = "submit" value = "Converter"/>
  </form>
  </body>
</html>
