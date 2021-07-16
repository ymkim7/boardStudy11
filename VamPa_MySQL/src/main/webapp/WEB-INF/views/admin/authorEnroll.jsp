<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/authorEnroll.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	
	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	
	<div class="admin_content_wrap">
		<div class="admin_content_subject"><span>작가 등록</span></div>
		<div class="admin_content_main">
           	<form action="/admin/authorEnroll" method="post" id="enrollForm">
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>작가 이름</label>
           			</div>
           			<div class="form_section_content">
           				<input id="authorName" name="authorName">
           				<span id="warn_authorName">작가 이름을 입력 해주세요.</span>
           			</div>
           		</div>
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>소속 국가</label>
           			</div>
           			<div class="form_section_content">
           				<select id="nationId" name="nationId">
           					<option value="none" selected>=== 선택 ===</option>
           					<option value="01">국내</option>
           					<option value="02">국외</option>
           				</select>
           				<span id="warn_nationId">소속 국가를 선택해주세요.</span>
           			</div>
           		</div>
           		<div class="form_section">
           			<div class="form_section_title">
           				<label>작가소개</label>
           			</div>
           			<div class="form_section_content">
           				<input id="authorIntro" name="authorIntro" type="text">
           				<span id="warn_authorIntro">작가 소개를 입력 해주세요.</span>
           			</div>
           		</div>
          		</form>
            		
			<div class="btn_section">
				<button id="cancelBtn" class="btn">취 소</button>
         		<button id="enrollBtn" class="btn enroll_btn">등 록</button>
           	</div> 
		</div>
	</div>
        
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">

	$(document).ready(function(){
		
		$("#enrollBtn").on("click", function(){
			
			var nameCheck = false;
			var nationCheck = false;
			var introCheck = false;
			var authorName = $("#authorName").val();
			var authorIntro = $("#authorIntro").val();
			var nationId = $("#nationId").val();
			var wAuthorName = $('#warn_authorName');
			var wNationId = $('#warn_nationId');
			var wAuthorIntro = $('#warn_authorIntro');
			
			if(authorName ===''){
		        wAuthorName.css('display', 'block');
		        nameCheck = false;
		    } else{
		        wAuthorName.css('display', 'none');
		        nameCheck = true;
		    }
		    
		    /* 소속 국가 공란 체크 */
		    if(nationId ==='none'){
		        wNationId.css('display', 'block');
		        nationCheck = false;
		    } else{
		        wNationId.css('display', 'none');
		        nationCheck = true;
		    }    
		    
		    /* 작가 소개 공란 체크 */
		    if(authorIntro ===''){
		        wAuthorIntro.css('display', 'block');
		        introCheck = false;
		    } else{
		        wAuthorIntro.css('display', 'none');
		        introCheck = true;
		    }
			
		    /* 최종 검사 */
		    if(nameCheck && nationCheck && introCheck){
		        $("#enrollForm").submit();    
		    } else{
		        return;
		    }
		});
		
		$("#cancelBtn").on("click", function(){
			location.href = "/admin/authorManage";
		});
	});

</script>
</body>
</html>