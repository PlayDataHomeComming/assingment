<%@ page import="com.playdata.assignment.dto.Preview" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/modecss/usercss/userselectcss/previewprint.css">
</head>

<body>
<div style="text-align: center;">
    <a href="/usermain"><button>정보 선택 모드로 돌아가기</button></a>
</div>

<div class="image-container">
    <div class="movie-image movie-image-1"></div>
    <div class="movie-image movie-image-2"></div>
    <div class="movie-image movie-image-3"></div>
</div>
<h1 style="text-align: center; transform: translatey(20px);">시사회 정보 선택</h1>
<div class="align">
    <table style="border-spacing: 0; width : 600px; height:200px; transform: translateX(38px); margin-top: 85px;">
        <thead>
        <tr>
            <th style="width: 40%;">영화 제목</th>
            <th>시사회 날짜</th>
        </tr>
        </thead>
        <tbody>
        <%
            int pageSize = 15;
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
            <td><%=preview.getMovieName()%></td>
            <td><%=preview.getDateOfPreview()%></td>
            <form method="post" action="/userselect1previewprint"><td class="radio"><input type="hidden" name="previewId" value=<%=preview.getId()%>><input type="submit" value="선택"></td></form>
        </tr>
        <%    }%>

        </tbody>
    </table>
</div>
<br><br><br><br><br>
<div style="text-align: center;font-weight: bold;">
    <% for (int i = 1; i <= totalPages; i++) { %>
    &nbsp;&nbsp;
    <a href="?page=<%= i %>" style="color: black; text-decoration: none;"><%= i %></a>
    <% } %>
</div>
</body>
</html>