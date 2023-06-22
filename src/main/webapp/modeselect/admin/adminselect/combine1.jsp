
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<%@ page import="java.util.List" %>
<%@ page import="com.playdata.assignment.dto.Preview" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Preview Select</title>

    <link rel="stylesheet" href="/modecss/admincss/adminselectcss/pre_cin_combine1.css">
</head>

<body>
<div style="text-align: center;">
    <a href="/adminpreviewinsert"><button>시사회 정보 등록하기</button></a>
    <a href="/admincinemainsert"><button>영화관 정보 등록하기</button></a>
    <a href="/adminprintperson"><button>예약자 명단 확인하기</button></a>
    <a href="/modeservlet"><button>모드 선택으로 돌아가기</button></a>
</div>


<h1 style="text-align: center; margin-top: 60px;">시사회 정보 선택하기</h1>
<div class="align">
    <table  style="margin-left: 90px;border-spacing: 0; width: 700px;height: 400px;">
        <thead>
        <tr>
            <th>No.</th>
            <th>영화 제목</th>
            <th>상영 날짜</th>
        </tr>
        </thead>
        <%
            int pageSize = 15;
            List<Preview> previews = (List<Preview>)request.getAttribute("previews");
            int totalRows = previews.size();
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
                Preview preview = previews.get(i);
        %>
                <tr>
                    <td><%=preview.getId()%></td>
                    <td><%=preview.getMovieName()%></td>
                    <td><%=preview.getDateOfPreview()%></td>
                    <form method="post" action="/admincombine1"><td class="btn"><input type="hidden" name="previewId" value=<%=preview.getId()%>><input type="submit" value="선택"></td></form>
                </tr>
        <%    }%>


    </table>
</div>

<div style="text-align: center;font-weight: bold;">
    <% for (int i = 1; i <= totalPages; i++) { %>
    &nbsp;&nbsp;
    <a href="?page=<%= i %>" style="color: black; text-decoration: none;"><%= i %></a>
    <% } %>
</div>
</body>

</html>


