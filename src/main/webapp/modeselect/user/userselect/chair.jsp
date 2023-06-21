<%@ page import="com.playdata.assignment.dto.Chair" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="../userSelectCss/1-3chair.css">
</head>

<body>
<div style="text-align: center;">
  <a href="../userSelectHtml/1-2cinema_view.html"><button>영화관 정보 보기</button></a>
  <a href="C:\Users\Playdata\Desktop\2jo-html\modeSelect\main.html"><button>모드 선택으로 돌아가기</button></a>
</div>
<h1 style="text-align: center; margin-top: 70px;">좌석 선택</h1>
 <div class="align">
    <table style=" border-collapse: collapse; border-spacing: 0;" width="600px" height="400px">
      <thead>
      <tr>
        <th>id</th>
        <th>x</th>
        <th>y</th>
        <th>status</th>
        <th colspan="5" style="background-color: rgb(0, 0, 0); color: azure; text-align: center;">SCREEN</th>
      </tr>
      </thead>
      <tbody>

      <%
        List<Chair> chairs = (List<Chair>)request.getAttribute("chairs");
        for (Chair chair : chairs) {%>
      <tr>
        <td><%=chair.getId()%></td>
        <td><%=chair.getX()%></td>
        <td><%=chair.getY()%></td>
        <td><%=chair.getStatus()%></td>
      </tr>
      <%    }%>
      </tbody>
    </table>

  </div>
  <div style="display: flex; justify-content: center;">
    <%
    if (request.getParameter("error") !=null){
     if(request.getParameter("error").equals("1")){
       %><h3>시사회 중복 입니다</h3><%
     }
     if(request.getParameter("error").equals("2")){
       %><h3>이미 선택된 좌석입니다</h3><%
     }
    }
    %>

    <form method="post" action="/chairprint">
      <input type="text" name="id" placeholder="좌석 ID 입력">
      <input type="text" name="name" placeholder="예약자 성함 입력">
      <input type="text" name="phoneNum" placeholder="휴대전화번호 입력">
      <input type="hidden" name="pcId" value=<%=request.getAttribute("pcId")%>>
      <button   type="submit">선택</button>
    </form>
  </div>

</body>
</html>