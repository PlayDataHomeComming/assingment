

<%@ page import="com.playdata.assignment.dto.Cinema" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
String previewId=request.getAttribute("previewId")+"";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Select</title>
</head>
<link rel="stylesheet" href="/modecss/admincss/adminselectcss/pre_cin_combine2.css">
<body>
<div style="text-align: center;">
    <a href="/adminpreviewinsert"><button>시사회 정보 등록하기</button></a>
    <a href="/admincinemainsert"><button>영화관 정보 등록하기</button></a>
    <a href="/admincombine1"><button>시사회 정보 선택으로 돌아가기</button></a>
    <a href="/adminprintperson"><button>예약자 명단 확인하기</button></a>
    <a href="/modeservlet"><button>모드 선택으로 돌아가기</button></a>
</div>



<h1 style="text-align: center; margin-top: 60px;">영화관 정보 선택하기</h1>
<div class="align">
    <table  style="margin-left: 90px;border-spacing: 0; width: 700px;height: 400px;">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화관 이름</th>
            <th>지점</th>
            <th>총 좌석 수</th>
        </tr>
        </thead>

        <%
            List<Cinema> cinemas = (List<Cinema>)request.getAttribute("cinemas");
            int pageSize = 15;
            int totalRows = cinemas.size();
            int totalPages = (int) Math.ceil((double) totalRows / pageSize);

            int currentPage = 1;
            if (request.getParameter("page") != null) {
                currentPage = Integer.parseInt(request.getParameter("page"));
            }

            int startRow = (currentPage - 1) * pageSize;
            int endRow = currentPage * pageSize;
            if (endRow > totalRows) {
                endRow = totalRows;
            }

            for (int i = startRow; i < endRow; i++) {
                Cinema cinema = cinemas.get(i);
        %>


        <tr>
            <td><%=cinema.getId()%></td>
            <td><%=cinema.getCinemaName()%></td>
            <td><%=cinema.getAddress()%></td>
            <td><%=cinema.getCapacityChair()%></td>
            <form method="post" action="/admincombine2"><td class="radio"><input type="hidden" name="previewId" value='<%=previewId%>'><input type="hidden" name="cinemaId" value=<%=cinema.getId()%>><input type="submit" value="선택"></td></form>
        </tr>
        <%    }%>

        </tbody>
    </table>
</div>


<div style="text-align: center;font-weight: bold;">
    <% for (int i = 1; i <= totalPages; i++) { %>
    &nbsp;&nbsp;
    <a href="?page=<%= i %>&previewId=<%=request.getParameter("previewId")%>" style="color: black; text-decoration: none;"><%= i %></a>
    <% } %>
</div>
</body>
</html>
