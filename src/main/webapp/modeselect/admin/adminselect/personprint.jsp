<%@ page import="com.playdata.assignment.dto.Person" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Check</title>
    <link rel="stylesheet" href="../adminSelectCss/4reservation_check.css">
</head>
<body>
</div>
<h1 style="text-align: center; margin-top: 100px;">예약자 명단 확인하기</h1>
<div class="align">
    <table style=" margin-bottom: 70px; border-collapse: collapse; border-spacing: 0;"  width="700px" height="400px">
        <thead>
        <tr>
            <th>영화 제목</th>
            <th>상영 날짜</th>
            <th>영화관 이름</th>
            <th>지점명</th>
            <th>예약자명</th>
            <th>핸드폰번호</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Person> people = (List<Person>)request.getAttribute("people");
            for (Person person : people) {%>
        <tr>
            <td><%=person.getMovieName()%></td>
            <td><%=person.getDateOfPreview()%></td>
            <td><%=person.getCinemaName()%></td>
            <td><%=person.getAddress()%></td>
            <td><%=person.getName()%></td>
            <td><%=person.getPhoneNum()%></td>
        </tr>
        <%    }%>
        </tbody>
    </table>
</div>
</body>
</html>