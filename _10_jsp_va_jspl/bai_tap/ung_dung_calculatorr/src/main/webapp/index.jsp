<%--
  Created by IntelliJ IDEA.
  User: Luu Hoa
  Date: 5/27/2022
  Time: 11:23 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>$Title$</title>
  </head>
  <body>
  <h1>
    Simple Calculator
  </h1>
  <form action="calculator" method="post">
    <p>Calculator</p>
    <div style="display: flex;flex-direction: row ;gap: 50px; margin-bottom: 20px" >
      <lable>First operand </lable>
      <input type="text" name="number1">
    </div>
    <div style="display: flex;flex-direction: row ;gap: 50px; margin-bottom: 20px">

      <lable> Operator</lable>
      <select name="operator">
        <option>addition</option>
        <option>subtraction</option>
        <option>multiplication</option>
        <option>division</option>
      </select>
    </div>

    <div style="display: flex;flex-direction: row ;gap: 50px" >
      <lable>Second operand </lable>
      <input type="text" name="number2">
    </div>
    <input type="submit">
  </form>

  <p> Result : ${result}</p>

  </body>
</html>
