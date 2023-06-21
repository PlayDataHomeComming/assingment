
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/modecss/usercss/userselectcss/chairselect.css">
</head>

<body>
<div style="text-align: center;">
    <a href="/modeselect/user/userselect/cinemaselect.jsp"><button>영화관 정보 보기</button></a>
    <a href="/modeselect/user/userselect/mode.jsp"><button>모드 선택으로 돌아가기</button></a>
</div>
<h1 style="text-align: center; margin-top: 70px;">좌석 선택</h1>
<form action="" class="center">
    <div class="align">
        <table style="border-collapse: collapse; border-spacing: 0; width : 600px; height : 400px;>
            <thead>
            <tr>
                <th></th>
                <th colspan ="5" style=" background-color: rgb(0, 0, 0); color: azure; text-align: center;">SCREEN</th>
            </tr>
            </thead>
            <tbody>
            <tr>
                <td>A</td>
                <td>1<input type="radio" name="check"></td>
                <td>2<input type="radio" name="check"></td>
                <td>3<input type="radio" name="check"></td>
                <td>4<input type="radio" name="check"></td>
                <td>5<input type="radio" name="check"></td>
            </tr>
            <tr>
                <td>B</td>
                <td>1<input type="radio" name="check"></td>
                <td>2<input type="radio" name="check"></td>
                <td>3<input type="radio" name="check"></td>
                <td>4<input type="radio" name="check"></td>
                <td>5<input type="radio" name="check"></td>
            </tr>
            <tr>
                <td>C</td>
                <td>1<input type="radio" name="check"></td>
                <td>2<input type="radio" name="check"></td>
                <td>3<input type="radio" name="check"></td>
                <td>4<input type="radio" name="check"></td>
                <td>5<input type="radio" name="check"></td>
            </tr>
            <tr>
                <td>D</td>
                <td>1<input type="radio" name="check"></td>
                <td>2<input type="radio" name="check"></td>
                <td>3<input type="radio" name="check"></td>
                <td>4<input type="radio" name="check"></td>
                <td>5<input type="radio" name="check"></td>
            </tr>
            <tr>
                <td>E</td>
                <td>1<input type="radio" name="check"></td>
                <td>2<input type="radio" name="check"></td>
                <td>3<input type="radio" name="check"></td>
                <td>4<input type="radio" name="check"></td>
                <td>5<input type="radio" name="check"></td>
            </tr>
            </tbody>
        </table>

    </div>
    <div style="display: flex; justify-content: center;">
        <button   type="submit">선택</button>
    </div>
</form>
</body>
</html>
