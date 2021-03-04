<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-09-23
  Time: 17:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="ISO-8859-1">
  <title>Title</title>
</head>
<body>
<%
  String url = "jdbc:mysql://localhost:3306/jspweb1?serverTimezone=UTC";
  //connect username and password
  String username = "root";
  String password = "123456";

  try{
    String str = "NYC";
    //反射加载jdbd的Driver类
    Class.forName("com.mysql.cj.jdbc.Driver");
    //通过DriverManager获取Connectioin对象
    Connection con = DriverManager.getConnection(url, username, password);

    String sql = "select * from user";

    //通过PrepardStatement准备sql语句
    PreparedStatement statement = con.prepareStatement(sql);

    //获取结果集
    ResultSet rs = statement.executeQuery();
    //声明结果集的结构
    ResultSetMetaData rsmd = rs.getMetaData();
    //获取结果集的列数
    int count = rsmd.getColumnCount();

    //对结果集进行遍历
    out.print("数据库连接信息\n");
    while(rs.next())
    {
      out.println("");
      for(int i=1;i<count;i++)
      {
        out.println(rs.getString(i));
      }

      out.println("<br>");
    }

    //关闭连接
    rs.close();
    statement.close();
    con.close();
  }catch (Exception e){
    e.printStackTrace();
  }
%>

</body>
</html>
