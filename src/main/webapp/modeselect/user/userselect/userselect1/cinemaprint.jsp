<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../userSelectCss/1-2cinema_view.css">
</head>

<body>
<div style="text-align: center;">
  <a href="../userSelectHtml/1-1preview_view.html"><button>시사회 정보 보기</button></a>
  <a href="C:\Users\Playdata\Desktop\2jo-html\modeSelect\main.html"><button>모드 선택으로 돌아가기</button></a>
</div>
<h1 style="text-align: center; margin-top: 70px;">영화관 정보 선택</h1>
<div class="align">
  <table style=" margin-left: 50px;  margin-bottom: 50px;  border-collapse: collapse; border-spacing: 0;"width="400px" height="200px">
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
      <form method="post" action="/userselect1cinemaprint"><td class="radio"><input type="submit" name="pcId" value=<%=cinema.getId()%>></td></form>
    </tr>
    <%    }%>
    </tbody>
  </table>
</div>
</body>
</html>