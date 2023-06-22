<%@ page import="com.playdata.assignment.dto.Chair" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="/modecss/usercss/userselectcss/chiar.css">
</head>

<body>
<div style="text-align: center;position: absolute;top: -10%;left: 37%;">
  <a href="/usermain"><button>모드 선택으로 돌아가기</button></a>
</div>
<h1 style="text-align: center; margin-top: 70px;">좌석 선택</h1>
<div class="bl" style="position: absolute;left: 30%;">
</div>
<div style="position: absolute;left: 32%;">예약불가</div>

 <div class="align">
    <table style="width: 400px; border-collapse: collapse; border-spacing: 0;width :600px; height :400px;background-color: floralwhite;border-radius: 15px;">

      <thead>
      <tr>
        <th colspan="5" style="background-color: rgb(0, 0, 0); color: azure; text-align: center; width: 200px;">SCREEN</th>
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
          <form method="get" action="/chairprint" style="">
            <input type="hidden" name = "pcId" value="<%=request.getAttribute("pcId")%>">
            <input type="hidden" name = "chairId" value="<%=chair.getId()%>" >
            <%
              if(chair.getStatus().equals("X")){
                %><input disabled style="background-color:black;" class="pretty-submit" type="submit"  value="<%=((char)(int)(chair.getY()+64))%><%=(chair.getX())%>" ><%
              }else {
                %><input class="pretty-submit" type="submit"  value="<%=((char)(int)(chair.getY()+64))%><%=(chair.getX())%>" ><%
            }
            %>

          </form>
        </td>

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
       %>
    <marquee scrollamount="15" style="position: absolute;left: 10%;top: 90%"><img style="width: 400px; height: 400px" src="../../../img/ma2.jpg" alt="madongsuck"></marquee>
    <br><br><br>
    <marquee scrollamount="15" style="position: absolute;left: 10%;top: 80%;"><h1>&nbsp;&nbsp;&nbsp;&nbsp;이미 접수된 번호입니다. 다른 휴대폰번호를 입력해주세요. 같은 실수를 반복하지 마세요</h1></marquee><%
     }
     if(request.getParameter("error").equals("2")){
       %><marquee scrollamount="8" style="position: absolute;left: 10%;"><h1>이미 예약된 좌석입니다. 다른 좌석을 클릭해주세요. 같은 실수를 반복하지 마세요.</h1></marquee><%
     }
    }
    %>

    <form method="post" action="/chairprint" style="position: absolute;top: 100%; left: 31.5%;">
      <input style="width: 170px;" type="text" name="id" readonly value=<%=request.getAttribute("chairId")%>>
      <input type="text" name="name" placeholder="예약자 성함 입력">
      <input type="text" name="phoneNum" placeholder="휴대전화번호 입력">
      <input type="hidden" name="pcId" value=<%=request.getAttribute("pcId")%>>
      <button   type="submit">접수</button>
    </form>
  </div>

</body>
</html>