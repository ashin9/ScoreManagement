<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-09-24
  Time: 14:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"%>
<%@page import="javax.sql.*"%>
<%@page import="javax.naming.*"%>
<%request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
    <title>Login Success page</title>
</head>
<body>
<%
    Context ctx = null;
    DataSource ds = null;
    Statement stmt =null;
    ResultSet rs = null;
    Connection con = null;

    String stuId = request.getParameter("stuId").trim();
    String stuPassword = request.getParameter("stuPassword").trim();

    try{
        ctx = new InitialContext();
        ds = (DataSource)ctx.lookup("java:comp/env/jdbc/mysql");
        con = ds.getConnection();//创建数据库连接
        stmt = con.createStatement();

        //SQL语句预处理
        //PreparedStatement pstmt = con.prepareStatement("select * from user where username=? and password=? ");

        rs=stmt.executeQuery("select * from student where stuID='"+stuId+"'");
        if(rs.next()){
            rs=stmt.executeQuery("select * from student where stuID='"+stuId+"' and stuPassword='"+stuPassword+"'");
            if(rs.next())
            {
                out.print(stuId+"登录成功");
            } else {
                out.print("密码输入错误！！！<br>"+"重新<a href=\"../html/login.html\">登录</a>");
            }
        }else{
            out.print("<font color=red>"+stuId+"</font>用户不存在！！！<br>"+"请点击<a href=\"../html/login.html\">注册</a>");
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
