<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/authorManage.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/head.jsp" %>

	<div class="admin_content_wrap">
	    <div class="admin_content_subject"><span>작가 관리</span></div>
	    
	    <div class="author_table_wrap">
		    <c:if test="${listCheck != 'empty' }">
				<table class="author_table">
					<thead>
						<tr>
							<td class="th_column_1">작가 번호</td>
							<td class="th_column_2">작가 이름</td>
							<td class="th_column_3">작가 국가</td>
							<td class="th_column_4">등록 날짜</td>
							<td class="th_column_5">수정 날짜</td>
						</tr>
					</thead>
					
					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.authorId}"></c:out></td>
							<td>
								<a class="move" href="/admin/authorDetail?authorId=<c:out value='${list.authorId }&pageNum=${pageMaker.cri.pageNum }&amount=${pageMaker.cri.amount}'/>">
									<c:out value="${list.authorName}"></c:out>
								</a>
							</td>
							<td><c:out value="${list.nationName}"></c:out> </td>
							<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
							<td><fmt:formatDate value="${list.updateDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
			
			<c:if test="${listCheck == 'empty'}">
	 			<div class="table_empty">
	 				등록된 작가가 없습니다.
	 			</div>
	 		</c:if>
		</div>
		
		<!-- 검색 영역 -->
        <div class="search_wrap">
			<form id="searchForm" action="/admin/authorManage" method="get">
        		<div class="search_input">
        			<input type="text" id="keyword" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
        			<input type="hidden" id="pageNum" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
        			<input type="hidden" id="amount" name="amount" value='${pageMaker.cri.amount}'>
        			<button class='btn search_btn'>검 색</button>
        		</div>
        	</form>
        </div>
		
		<!-- 페이지 이동 인터페이스 영역 -->
		<div class="pageMaker_wrap" >
			<ul class="pageMaker">
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev}">
					<li class="pageMaker_btn prev">
						<a href="authorManage?pageNum=${pageMaker.pageStart - 1}&amount=${pageMaker.cri.amount}">이전</a>
					</li>
				</c:if>
				
				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.pageStart}" end="${pageMaker.pageEnd}" var="num">
					<li class='pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}'>
						<a href="authorManage?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
					</li>
				</c:forEach>
				
				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next">
						<a href="authorManage?pageNum=${pageMaker.pageEnd + 1 }&amount=${pageMaker.cri.amount}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
		
		<form id="moveForm" action="/admin/authorManage" method="get">
			<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
var result = '<c:out value="${enroll_result}"/>';
var modify_result = '<c:out value="${modify_result}"/>';
var delete_result = '${delete_result}';
var moveForm = $("#moveForm");
var href = $(this).attr("href");
var searchForm = $("#searchForm");
var keyword = $("#keyword").val();
var pageNum = $("#pageNum").val(1);

	$(document).ready(function(){
		
		checkResult(result);
		checkmResult(modify_result);
		checkdResult(delete_result);
		
		$(".pageMaker_btn a").on("click", function(){
			moveForm.find("#pageNum").val(href);
			moveForm.submit();
		});
		
		$("#searchForm button").on("click", function(){
			if(!searchForm.find(keyword)) {
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.fin(pageNum);
			searchForm.submit();
		});
		
		$(".move").on("click", function(){
			moveForm.append("<input type='hidden' name='authorId' value='" + href + "'/>");
			moveForm.attr("action", "/admin/authorDetail");
			moveForm.submit();
		});
		
	});
	
	function checkResult(result) {
		if(result == "") {
			return;
		}
		
		alert("작가" + result + "을 등록하였습니다.");
	}
	
	function checkmResult(mresult){
		
		if(modify_result === '1'){
			alert("작가 정보 수정을 완료하였습니다.");
		} else if(mresult === '0') {
			alert("작가 정부 수정을 하지 못하였습니다.")	
		}
		
	}
	
	function checkdResult(result) {
		if(delete_result == 1){
			alert("삭제 완료");
		} else if(delete_result == 2){
			alert("해당 작가 데이터를 사용하고 있는 데이터가 있어서 삭제 할 수 없습니다.")
		}
	}

</script>
</body>
</html>