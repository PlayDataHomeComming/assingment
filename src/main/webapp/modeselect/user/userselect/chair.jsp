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
  <a href="/usermain"><button>모드 선택으로 돌아가기</button></a>
</div>
<h1 style="text-align: center; margin-top: 70px;">좌석 선택</h1>
 <div class="align">
    <table style=" border-collapse: collapse; border-spacing: 0;width :600px; height :400px;">
      <thead>
      <tr>
        <th colspan="5" style="background-color: rgb(0, 0, 0); color: azure; text-align: center;">SCREEN</th>
      </tr>
      </thead>
      <tbody>

      <%
        List<Chair> chairs = (List<Chair>)request.getAttribute("chairs");
        int rowCount = 0;
        char rowChar = 'A';
        for (Chair chair : chairs) {
      if (rowCount % 5 == 0) {
      out.println("<tr>");
        }%>
        <td>
          <form method="post" action="/reservation">
          <input type="hidden" name="chairId" value=<%=chair.getId()%>>
            <input type="button" value="<%= rowChar + "" + (rowCount % 5 + 1) %>">
          </form>
        </td>
        <td><%=chair.getStatus()%></td>
      <%
      if (rowCount % 5 == 4) { // 5개의 열마다 행 닫기
      out.println("</tr>");
        rowChar++;
      }
      rowCount++;
      }
      // 마지막 행이 5의 배수가 아니면 행 닫기
      if (rowCount % 5 != 0) {
      out.println("</tr>");
      }
      %>
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