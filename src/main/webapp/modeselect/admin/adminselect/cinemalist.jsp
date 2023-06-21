<%@ page import="com.playdata.assignment.dto.Preview" %>
<%@ page import="java.util.List" %>
<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/modecss/admincss/adminselectcss/cinemalist.css">
</head>
<body>
<h1 style="text-align: center;">영화관 정보</h1>
<div class="align">
    <table  style="border-spacing: 0; width: 500px;">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화관 이름</th>
            <th>지점</th>
            <th>총 좌석 수</th>
        </tr>
        </thead>
        <%
            int pageSize = 10;
            List<Cinema> cinemas = (List<Cinema>)request.getAttribute("cinemas");
            int totalRows = cinemas.size();
            int totalPages = (int) Math.ceil((double) totalRows / pageSize);

            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }

            int startRow = (currentPage - 1) * pageSize;
            int endRow = currentPage * pageSize;
            if (endRow > totalRows) {
                endRow = totalRows;
            }

            for (int i = startRow; i < endRow; i++) {
                Cinema cinema = cinemas.get(i);
        %>
        <tr>
            <td><%=cinema.getId()%></td>
            <td><%=cinema.getCinemaName()%></td>
            <td><%=cinema.getAddress()%></td>
            <td><%=cinema.getCapacityChair()%></td>
        </tr>
        <%    }%>


    </table>
</div>
<div style="text-align: center;transform: translateY(-30px);">
        <% for (int i = 1; i <= totalPages; i++) { %>
    <a href="?page=<%= i %>" style="color: #f9ffe5; text-decoration: none;"><%= i %></a>
        <% } %>
</div>
</body>

</html>