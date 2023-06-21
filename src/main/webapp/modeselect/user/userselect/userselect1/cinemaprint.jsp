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
  <table style="border-spacing: 0; width : 400px; height:200px; transform: translateX(48px) translateY(-20px);">
    <thead>
    <tr>
      <th style="width: 120px;">영화관 이름</th>
      <th>영화관 장소</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Cinema> cinemas = (List<Cinema>)request.getAttribute("cinemas");
      for (Cinema cinema : cinemas) {%>
    <tr>
      <td><%=cinema.getCinemaName()%></td>
      <td><%=cinema.getAddress()%></td>
      <form method="post" action="/userselect1cinemaprint"><td class="radio"><input type="hidden" name="pcId" value=<%=cinema.getId()%>><input type="submit" value="선택"></td></form>
    </tr>
    <%    }%>
    </tbody>
  </table>
</div>
</body>
</html>