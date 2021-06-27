<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>web-inf 안임</title>
</head>
<body>
	여기는 아이템 test 영역이다!!!!!!!!!!!!!
	      <form action="/item/insertItem.nds" method="post" enctype="multipart/form-data" frm.encoding = "application/x-www-form-urlencoded"  class="upload__shape">
        <div>
          파일: <input type="file" id="file__input" name="file" onchange="previewFile()"><br>
        </div>
        <div>
          파일: <input type="file" id="file__input" name="file" onchange="previewFile()"><br>
        </div>
        <div>
          파일: <input type="file" id="file__input" name="file" onchange="previewFile()"><br>
        </div>
        </div>
      </form>
</body>
</html>