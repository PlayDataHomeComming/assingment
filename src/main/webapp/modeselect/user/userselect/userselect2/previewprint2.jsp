<%@ page import="com.playdata.assignment.dto.Preview" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/modecss/usercss/userselectcss/previewprint2.css">
</head>

<body>
<div style="text-align: center;">
  <a href="/userselect2cinemaprint"><button>영화관 정보 선택으로 돌아가기</button></a>
  <a href="/usermain"><button>모드 선택으로 돌아가기</button></a>
</div>

<div class="image-container">
  <div class="movie-image movie-image-1"></div>
  <div class="movie-image movie-image-2"></div>
  <div class="movie-image movie-image-3"></div>
</div>
<h1 style="text-align: center; transform: translatey(20px);">시사회 정보 선택</h1>
<div class="align">
  <table style="transform: translatey(20px) translateX(40px); border-spacing: 0;width:450px; height:200px;">
    <thead>
    <tr>
      <th style="width: 40%;">영화 제목</th>
      <th>시사회 날짜</th>
    </tr>
    </thead>
    <tbody>
    <%
      List<Preview> previews = (List<Preview>)request.getAttribute("previews");
      for (Preview preview : previews) {%>
    <tr>
      <td><%=preview.getMovieName()%></td>
      <td><%=preview.getDateOfPreview()%></td>
      <form method="post" action="/userselect2previewprint"><td class="radio"><input type="hidden" name="pcId" value=<%=preview.getId()%>><input type="submit" value="선택"></td></form>
    </tr>
    <%    }%>

    </tbody>
  </table>
</div>

</body>
</html>