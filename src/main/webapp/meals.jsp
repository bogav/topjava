<%@ page import="ru.javawebinar.topjava.model.MealWithExceed" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Meals</title>
</head>
<body>
<h3><a href="index.html">Home</a></h3>
<h2>Meals</h2>

<%
    List<MealWithExceed> meals = (List<MealWithExceed>)request.getAttribute("meals");
%>

    <table class="tg" border=1>
        <tr >
            <th width="100">Description</th>
            <th width="150">Date</th>
            <th width="100">Calories</th>
            <th width="100">Exceed</th>
            <th width="100">Edit</th>
            <th width="100">Delete</th>
        </tr>
        <%
            for (MealWithExceed item: meals) {
                if (item.isExceed()) {
        %>
        <tr bgcolor="#8b0000">
                <%
                } else {
                %>
        <tr bgcolor="#a9a9a9">
        <%
            };
        %>
        <td>
                    <%=
                        item.getDescription()
                    %>
                </td>
                <td>
                    <%=
                        item.getDateTime().toLocalDate().toString() + " " + item.getDateTime().toLocalTime().toString()
                    %>
                </td>
                <td>
                    <%=
                        item.getCalories()
                    %>
                </td>
                <td>
                    <%=
                        item.isExceed()
                    %>
                </td>
                <td><a href="<c:url value='/edit/${meal.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${meal.id}'/>">Delete</a></td>
            </tr>
        <%
            }
        %>

    </table>

<h1>Add new meal</h1>

<br/>
<br/>


</body>
</html>