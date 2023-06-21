
<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
Integer previewId=(Integer)( request.getAttribute("previewId"));
request.setAttribute("previewId",previewId);
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Select</title>
</head>
<link rel="stylesheet" href="../adminSelectCss/3-2preview_cinama.css">
<body>

<h1 style="text-align: center; margin-top: 100px;">영화관 정보 선택하기</h1>
<div class="align">
    <table  style="margin-left: 120px; margin-bottom: 50px; border-collapse: collapse; border-spacing: 0;"width="700px" height="400px">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화관 이름</th>
            <th>지점</th>
            <th>총 좌석 수</th>
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
            <td><%=cinema.getCapacityChair()%></td>
            <form method="post" action="/admincombine2"><td class="radio"><input type="submit" name="previewId" value=<%=cinema.getId()%>></td></form>
        </tr>
        <%    }%>
        </tbody>
    </table>
</div>
</body>
</html>
