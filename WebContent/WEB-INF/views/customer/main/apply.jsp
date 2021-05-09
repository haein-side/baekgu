<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>지원하기</title>
    <link rel="stylesheet" href="RESOURCES/CSS/CUSTOMER/YJCSS/style.css" type="text/css">

</head>
<body style="overflow-x: hidden; overflow-y: hidden;">

    <div style="margin-top: 50px;">
        <p>
            <h2 style="text-align: center; color: black;">회사명 : </h2>
            <h1 style="text-align: center;">김씨네 식당</h1>
        </p>
    </div>
    <br>
    <div style="margin-top: 10px;">
        <p style="text-align: center;">
            원하는 곳이 <b>김씨네 식당</b>이 맞으신가요?
        </p>
    </div>
    <div align="center">
        <button class="jione_button" onclick="checkNext();">
            <h2>이력서 넣기</h2>
            <script>

                function checkNext(){
                    window.open("checkNext.html", "a", "width=400, height=500, left=500, top=250");
                }
            </script>
        </button>
    </div>
</body>
</html>