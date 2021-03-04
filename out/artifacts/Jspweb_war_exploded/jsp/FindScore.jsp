<%--
  Created by IntelliJ IDEA.
  User: dxx
  Date: 2019-10-15
  Time: 20:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" import="java.util.*" import="Model.Grade"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生成绩管理系统-查询成绩</title>
</head>
<body  style="text-align: center;">
<c:choose>
    <c:when test="${sessionScope.user==null }">
        <a href="${pageContext.request.contextPath }/jsp/Login.jsp">用户登录</a>
    </c:when>
    <c:otherwise>
        <div>
            <form action="${pageContext.request.contextPath }/FindScoreServlet" method = "post">
                <input name="func" type="hidden" value="show">成绩查询方式：学号查询<br/>
                <c:if test="${sessionScope.user.identity == 'admin'}">
                    <input name="id" type="text">${errerMsg}
                </c:if>
                <input type="submit" value="查询">
            </form>
        </div>
        <br/>
        <table align="center" cellpadding="5" cellspacing="5" border="1">
            <%
                ArrayList<Grade> list=(ArrayList<Grade>) session.getAttribute("grade");
                if(list!=null&&list.size()!=0){%>
            <tr>
                <td colspan="6" align="center">学号为<%=list.get(0).getStuId() %>的学生成绩如下</td>
            </tr>
            <tr>
                <td>学生学号</td>
                <td>学生姓名</td>
                <td>课程编号</td>
                <td>教师编号</td>
                <td>课程分数</td>
                <td>班级编号</td>
            </tr>
            <%
                for(int j=0;j<list.size();j++){%>
            <tr>
                <td><%=list.get(j).getStuId()%></td>
                <td><%=list.get(j).getStuName()%></td>
                <td><%=list.get(j).getCourseId()%></td>
                <td><%=list.get(j).getTcId()%></td>
                <td><%=list.get(j).getCourseGrade()%></td>
                <td><%=list.get(j).getClassId()%></td>
            </tr>
            <% }}%>
        </table>
        <%@ include file="Foot.jsp" %>
    </c:otherwise>
</c:choose>
</body>
</html>
