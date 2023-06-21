<%@ page import="java.util.List" %>
<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/modecss/usercss/userselectcss/cinemaprint2.css">
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
<h1 style="text-align: center;transform: translateY(10px)">영화관 선택</h1>
<div class="align">
  <table style="border-spacing: 0; width : 400px; height:200px; transform: translateX(48px) translateY(-20px);">
    <thead>
    <tr>
      <th style="width: 120px;">영화관 이름</th>
      <th>지점</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Cinema> cinemas = (List<Cinema>)request.getAttribute("cinemas");
      for (Cinema cinema : cinemas) {%>
    <tr>
      <td><%=cinema.getCinemaName()%></td>
      <td><%=cinema.getAddress()%></td>
      <form method="post" action="/userselect2cinemaprint"><td class="radio"><input type="hidden" name="cinemaId" value=<%=cinema.getId()%>><input type="submit" value="선택"></td></form>
    </tr>
    <%    }%>

    </tbody>
  </table>
</div>

</body>
</html>