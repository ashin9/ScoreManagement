<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-09-23
  Time: 20:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>register</title>
</head>
<body>
    <h2>rigister</h2>
    <form action="registerSucceed.jsp" method="post">
        <table align="center">
            <tr align="right">
                <td>pealse input your username:</td>
                <td><input type="text" name=username autofocus="autofocus"></td>
            </tr>
            <tr align="right">
                <td>pealse input your password:</td>
                <td><input type="text" name=password></td>
            </tr>
            <tr align="right">
                <td>pealse input ensure password:</td>
                <td><input type="text" name=refill></td>
            </tr>
        </table>
            <input type="submit" name=register value="register" >
            <input type="reset" name=refill value="refill" >
    </form>
</body>
</html>
