<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en" class="back">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register cinema</title>
    <link rel="stylesheet" href="/modecss/admincss/adminselectcss/cienemainsert.css">
</head>
<body>
<div style="text-align: center;">
    <a href="/adminpreviewinsert"><button>시사회 정보 등록하기</button></a>
    <a href="/admincombine1"><button>시사회 정보 영화관 정보 연결</button></a>
    <a href="/adminprintperson"><button>예약자 명단 확인하기</button></a>
    <a href="/modeservlet"><button>모드 선택으로 돌아가기</button></a>
</div>

    <form method="post" action="/admincinemainsert">
        <div class="align">
        <h1>영화관 정보 등록하기</h1>
        <input type="text" name="cinemaName" style="text-align:center; width: 250px; height: 30px; font-size: 20px;" placeholder="영화관 이름을 입력해주세요"><br><br>
        <input type="text" name="moviePlace" style="text-align:center; width: 250px; height: 30px; font-size: 20px;" placeholder="영화관 지점을 입력해주세요"><br><br>
        <input type="text" name="chairNum" style="text-align:center; width: 250px; height: 30px; font-size: 20px;" placeholder="총 좌석수를 입력해주세요"><br><br>
        <div class="btn_wrap">
            <button type="submit">등록</button>
        </div>
        </div>
    </form>


</body>
</html>