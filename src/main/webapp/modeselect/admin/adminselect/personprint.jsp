<%@ page import="com.playdata.assignment.dto.Person" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation Check</title>
    <link rel="stylesheet" href="/modecss/admincss/adminselectcss/personprint.css">
</head>
<body>
<div style="text-align: center;">
    <a href="/adminpreviewinsert"><button>시사회 정보 등록하기</button></a>
    <a href="/admincinemainsert"><button>영화관 정보 등록하기</button></a>
    <a href="/admincombine1"><button>시사회 정보 영화관 정보 연결</button></a>
    <a href="/modeservlet"><button>모드 선택으로 돌아가기</button></a>
</div>
<h1 style="text-align: center; margin-top: 60px;">예약자 명단 확인하기</h1>
<div class="align">
    <table style="border-spacing: 0;  width:700px; height :400px;">
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