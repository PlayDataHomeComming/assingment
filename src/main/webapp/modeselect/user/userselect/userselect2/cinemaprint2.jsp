<%@ page import="java.util.List" %>
<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../userSelectCss/1-1preview_view.css">
</head>

<body>
<div style="text-align: center;">
  <a href="/usermain"><button>모드 선택으로 돌아가기</button></a>
</div>

<div class="image-container">
  <div class="movie-image movie-image-1"></div>
  <div class="movie-image movie-image-2"></div>
  <div class="movie-image movie-image-3"></div>
</div>
<h1 style="text-align: center; margin-top: 70px;">영화관 선택</h1>
<div class="align">
  <table style=" margin-left: 70px;  margin-bottom: 50px;  border-collapse: collapse; border-spacing: 0;"width="450px" height="200px">
    <thead>
    <tr>
      <th>영화관 번호</th>
      <th style="width: 120px;">영화관 이름</th>
      <th>영화관 장소</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Cinema> cinemas = (List<Cinema>)request.getAttribute("cinemas");
      for (Cinema cinema : cinemas) {%>
    <tr>
      <td><%=cinema.getId()%></td>
      <td><%=cinema.getCinemaName()%></td>
      <td><%=cinema.getAddress()%></td>
      <form method="post" action="/userselect2cinemaprint"><td class="radio"><input type="submit" name="cinemaId" value=<%=cinema.getId()%>></td></form>
    </tr>
    <%    }%>

    </tbody>
  </table>
</div>

</body>
</html>