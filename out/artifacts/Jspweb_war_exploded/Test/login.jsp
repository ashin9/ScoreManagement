<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-09-23
  Time: 19:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login page</title>
</head>
<body>
    <h2 align="center"><font color="red">user login page</font> </h2>
    <form action="success.jsp" method="post">
        <table align="center" border="1">
            <tr>
                <td>username:</td>
                <td><input type="text" name="username"></td>
            </tr>
            <tr>
                <td>password:</td>
                <td><input type="text" name="password"></td>
            </tr>
            <tr>
                <td><input type="submit" value="login" name="login"></td>
                <td><input type="reset" value="reset" name="reset"></td>
            </tr>
        </table>
        <p align="center"><a href="register.jsp" color=blue>register</a></p>
    </form>

</body>
</html>
