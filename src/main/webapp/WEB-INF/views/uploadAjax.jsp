<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div class="uploadDiv">
<input type="file" name="uploadFile" multiple>
</div>
<button id="uploadBtn">Upload</button>
</body>
<!-- jQuery -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
<script>
$(document).ready(function(){
	//파일의 확장자나 크기 사전처리 - 정규식을 이용해서 파일 확장자 체크
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880;
	function checkExtension(fileName, fileSize){
		if(fileSize>=maxSize){
			alert("파일 크기 초과");
			return false;
		}
		if(regex.test(fileName)){//zip파일 업로드시 (test는 javascript의 if문 문법임)
		//regex랑 fileName이 일치하면
			alert("해당 종류의 파일은 업로드 할 수 없음");
			return false;
		}
		return true;
	}
	
	$("#uploadBtn").on("click", function(e){
		var formData = new FormData();
		var inputFile=$("input[name='uploadFile']");
		var files = inputFile[0].files;
		console.log(files);
		
		//add filedata to formdata
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){//파일 확장자 체크
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		console.log("files.length : "+files.length);
		$.ajax({
			url: '/uploadAjaxAction',
			processData: false, //전달할 데이터를 query string을 만들지 말 것
			contentType: false,
			data: formData, //전달할 데이터
			type : 'POST',
			success: function(result){
				alert('Uploaded');
			}
		}); //$.ajax
	});
	
	
})
</script>
</html>