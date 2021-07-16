<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/authorDetail.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	
	<div class="admin_content_wrap">
		<div class="admin_content_subject"><span>작가 상세</span></div>
		<div class="admin_content_main">
			<div class="form_section">
				<div class="form_section_title">
					<label>작가 번호</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" id="authorId" name="authorId" readonly="readonly" value="<c:out value='${authorInfo.authorId }'></c:out>">
				
				</div>
			</div>                    
			<div class="form_section">
				<div class="form_section_title">
					<label>작가 이름</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" id="authorName" name="authorName" readonly="readonly" value="<c:out value='${authorInfo.authorName }'></c:out>" >
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>소속 국가</label>
				</div>
				<div class="form_section_content">
					<select class="input_block" name="nationId" >
						<option value="none" selected disabled="disabled">=== 선택 ===</option>
						<option value="01" disabled="disabled" <c:out value=" ${authorInfo.nationId eq '01' ?'selected':''}"/>>국내</option>
						<option value="02" disabled="disabled" <c:out value=" ${authorInfo.nationId eq '02' ?'selected':''}"/>>국외</option>
					</select>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>작가소개</label>
				</div>
				<div class="form_section_content">
					<textarea class="input_block" id="authorIntro" name="authorIntro" readonly="readonly"><c:out value='${authorInfo.authorIntro }'/></textarea>
				</div>
			</div>
			<div class="form_section">
				<div class="form_section_title">
					<label>등록 날짜</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${authorInfo.regDate}" pattern="yyyy-MM-dd"/>">
				</div>
			</div>
	   		<div class="form_section">
				<div class="form_section_title">
					<label>수정 날짜</label>
				</div>
				<div class="form_section_content">
					<input class="input_block" type="text" readonly="readonly" value="<fmt:formatDate value="${authorInfo.updateDate}" pattern="yyyy-MM-dd"/>">
				</div>
	   		</div>
			<div class="btn_section">
				<button id="cancelBtn" class="btn">작가 목록</button>
	     		<button id="modifyBtn" class="btn modify_btn">수 정</button>
	     	</div>
	    </div>
	</div>
	
	<form id="moveForm" method="get">
		<input type="hidden" name="authorId" value='<c:out value="${authorInfo.authorId }"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum }"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount }"/>' >
		<input type="hidden" name="keyword" value='<c:out value="${cri.keyword }"/>'>
	</form>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">

	$(document).ready(function(){
		var moveForm = $("#moveForm");
		
		$("#cancelBtn").on("click", function(){
			$("#authorId").remove();
			moveForm.attr("action", "/admin/authorManage");
			moveForm.submit();
		});
		
		$("#modifyBtn").on("click", function(){
			moveForm.attr("action", "/admin/authorModify");
			moveForm.submit();
		});
	});

</script>
</body>
</html>