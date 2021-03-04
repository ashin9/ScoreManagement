<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-09-23
  Time: 20:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page import="javax.naming.*" %>

<!DOCTYPE html>
<html>
<head>
    <title>register success!</title>
</head>
<body>
    <%
        Context ctx = null;
        DataSource ds = null;
        Statement stmt = null;
        ResultSet rs = null;
        Connection con = null;

        //去除输入首尾
        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();
        String refill = request.getParameter("refill").trim();

        try{
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");//mysql是在创建连接池时自己创建的名字
            con = ds.getConnection();
            stmt = con.createStatement();

            if(username != null){
                rs = stmt.executeQuery("select * from user where username='"+username+"'");

                if(rs.next()){
                    out.print("用户已经存在  "+"请<a href=\"registered.jsp\">注册</a>");
                }else {
                    if(password.equals(refill)){
                        stmt.executeUpdate("insert into user (username,password) values('"+username+"','"+password+ "')");
    %>
                    注册成功！！！<br>
                    三秒后自动跳转到登录页面！！！<br>
                    如果没有跳转，请点击<a href="login.jsp">这里</a>！！！
                    <span style="font-size:24px;"><meta http-equiv="refresh" content="3;URL=login.jsp"> </span>
    <%
                    }else{
                        out.print("密码输入不一致!!!<br>"+"重新<a href=\"registered.jsp\">注册</a>");
                    }

                }
            }else{
                out.print("姓名不能为空");
            }
        }catch (Exception e){
            out.print(e);
        }finally {
            if(rs!=null)
                rs.close();
            if(stmt!=null)
                stmt.close();
            if(con!=null)
                con.close();
        }

    %>
</body>
</html>
