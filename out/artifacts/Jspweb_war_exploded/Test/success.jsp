<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-09-23
  Time: 20:30
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%request.setCharacterEncoding("utf-8"); %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>判断登录</title>
</head>
<body>
    <%
        Context ctx = null;
        DataSource ds = null;
        Statement stmt =null;
        ResultSet rs = null;
        Connection con = null;

        String username = request.getParameter("username").trim();
        String password = request.getParameter("password").trim();

        try{
            ctx = new InitialContext();
            ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
            con = ds.getConnection();//创建数据库连接
            stmt = con.createStatement();

            rs=stmt.executeQuery("select * from user where username='"+username+"'");
            if(rs.next()){
                rs=stmt.executeQuery("select * from user where username='"+username+"' and password='"+password+"'");
                if(rs.next())
                {
                    out.print(username+"登录成功");
                } else {
                    out.print("密码输入错误！！！<br>"+"重新<a href=\"login.html\">登录</a>");
                }
            }else{
                out.print("<font color=red>"+username+"</font>用户不存在！！！<br>"+"请点击<a href=\"registered.jsp\">注册</a>");
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
