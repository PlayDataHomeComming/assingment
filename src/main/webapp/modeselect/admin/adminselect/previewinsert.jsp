<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resgister preview</title>
    <link rel="stylesheet" href="modecss/css/admincss/adminselectcss/previewinsert.css">
</head>
<body>
<div style="text-align: center;">
    <a href="../adminSelectHtml/2cinema.html"><button>영화관 정보 등록하기</button></a>
    <a href="../adminSelectHtml/3-1preview_cinema.html"><button>시사회 정보 영화관 정보 연결</button></a>
    <a href="../adminSelectHtml/4reservation_check.html"><button>예약자 명단 확인하기</button></a>
    <a href="C:\Users\Playdata\Desktop\2jo-html\modeSelect\main.html"><button>모드 선택으로 돌아가기</button></a>
</div>

<div class="align">
    <form method="post" action="/adminpreviewinsert">
    <h1>시사회 정보 등록하기</h1>
        <input name = "movieName" type="text" style="text-align:center; width: 250px; height: 30px; font-size: 20px;"  placeholder="영화 제목을 입력해주세요" ><br><br>
        <input name = "movieDate" type="date"  style="text-align:center; width: 250px; height: 30px; font-size: 20px;"><br>
        <div class="btn_wrap">
            <button type="submit">등록</button>
        </div>
    </form>
</div>
</body>
</html>