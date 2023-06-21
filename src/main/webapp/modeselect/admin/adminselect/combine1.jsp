<%@ page import="java.util.List" %>
<%@ page import="com.playdata.assignment.dto.Preview" %>


<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preview Select</title>
    <link rel="stylesheet" href="">
</head>

<body>
<div style="text-align: center;">
    <a href="../adminSelectHtml/1preview.html"><button>시사회 정보 등록하기</button></a>
    <a href="../adminSelectHtml/2cinema.html"><button>영화관 정보 등록하기</button></a>
    <a href="../adminSelectHtml/4reservation_check.html"><button>예약자 명단 확인하기</button></a>
    <a href="C:\Users\Playdata\Desktop\2jo-html\modeSelect\main.html"><button>모드 선택으로 돌아가기</button></a>
</div>


<h1 style="text-align: center; margin-top: 100px;">시사회 정보 선택하기</h1>
<div class="align">
    <table  style=" margin-left: 120px;  margin-bottom: 50px;  border-collapse: collapse; border-spacing: 0;" width="700px" height="400px">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화 제목</th>
            <th>상영 날짜</th>
        </tr>
        </thead>
        <tbody>
        <%
            List<Preview> previews = (List<Preview>)request.getAttribute("previews");
            for (Preview preview : previews) {%>
                <tr>
                    <td><%=preview.getId()%></td>
                    <td><%=preview.getMovieName()%></td>
                    <td><%=preview.getDateOfPreview()%></td>
                    <form method="post" action="/admincombine1"><td class="radio"><input type="submit" name="previewId" value=<%=preview.getId()%>></td></form>
                </tr>
        <%    }%>
        </tbody>
    </table>
</div>
</body>
</html>