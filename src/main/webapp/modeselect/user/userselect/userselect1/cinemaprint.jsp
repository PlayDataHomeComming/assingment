<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/modecss/usercss/userselectcss/cinemaprint.css">
</head>

<body>
<div style="text-align: center; ">
  <a href="/userselect1previewprint"><button>시사회 정보 선택으로 돌아가기</button></a>
  <a href="/usermain"><button>정보 선택 모드로 돌아가기</button></a>
</div>
<h1 style="text-align: center; transform: translateY(10px)">영화관 정보 선택</h1>
<div class="align">
  <table style="border-spacing: 0; width : 400px; height:200px; transform: translateX(38px); margin-top: 85px;">
    <thead>
    <tr>
      <th style="width: 120px;">영화관 이름</th>
      <th>영화관 장소</th>
    </tr>
    </thead>
    <tbody>
    <%
      int pageSize = 15;
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
      <td><%=cinema.getCinemaName()%></td>
      <td><%=cinema.getAddress()%></td>
      <form method="post" action="/userselect1cinemaprint"><td class="radio"><input type="hidden" name="pcId" value=<%=cinema.getId()%>><input type="submit" value="선택"></td></form>
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