<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en" style="background-color: #ff2099;">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Resgister preview</title>
    <link rel="stylesheet" href="/modecss/admincss/adminselectcss/previewinsert.css">
</head>
<body>
<div style="text-align: center;">
    <a href="/admincinemainsert"><button>영화관 정보 등록하기</button></a>
    <a href="/admincombine1"><button>시사회 정보 영화관 정보 연결</button></a>
    <a href="/adminprintperson"><button>예약자 명단 확인하기</button></a>
    <a href="/modeservlet"><button>모드 선택으로 돌아가기</button></a>
</div>
<marquee style="font-size: 60px; color: #f9ffe5; font-family: '야놀자 야체 B'">요기어때? 야보자</marquee>
<div style="display: flex;">
    <div style="flex: 1;">
    <form method="post" action="/adminpreviewinsert">
        <div class="align">
    <h1>시사회 정보 등록하기</h1>
        <input name = "movieName" type="text" style="text-align:center; width: 250px; height: 30px; font-size: 20px;"  placeholder="영화 제목을 입력해주세요" ><br><br>
        <input name = "movieDate" type="date"  style="text-align:center; width: 250px; height: 30px; font-size: 20px;"><br>

        <div class="btn_wrap">
            <button type="submit">등록</button>
        </div>
        </div>
    </form>
    </div>
<div style="flex: 1;">
<%@include file="previewlist.jsp"%>
</div>
</div>
<marquee style="font-size: 40px; color: #fff6fc; ">요기어때? 야보자</marquee>
</body>
</html>