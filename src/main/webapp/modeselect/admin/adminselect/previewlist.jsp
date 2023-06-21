<%@ page import="com.playdata.assignment.dto.Preview" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="/modecss/admincss/adminselectcss/previewlist.css">
</head>
<body>
<h1 style="text-align: center; margin-top: 60px;">시사회 정보</h1>
<div class="align">
    <table  style="border-spacing: 0; width: 400px;">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화 제목</th>
            <th>상영 날짜</th>
        </tr>
        </thead>
        <%
            int pageSize = 10;
            List<Preview> previews = (List<Preview>)request.getAttribute("previews");
            int totalRows = previews.size();
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
                Preview preview = previews.get(i);
        %>
        <tr>
            <td><%=preview.getId()%></td>
            <td><%=preview.getMovieName()%></td>
            <td><%=preview.getDateOfPreview()%></td>
        </tr>
        <%    }%>


    </table>
</div>
<div style="text-align: center; transform: translateY(-30px);">
    <% for (int i = 1; i <= totalPages; i++) { %>
    <a href="?page=<%= i %>" style="color: #f9ffe5; text-decoration: none;"><%= i %></a>
    <% } %>
</div>
</body>

</html>