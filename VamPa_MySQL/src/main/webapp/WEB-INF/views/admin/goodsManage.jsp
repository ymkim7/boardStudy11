<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/goodsManage.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/head.jsp" %>

	<div class="admin_content_wrap">
	    <div class="admin_content_subject"><span>상품 관리</span></div>
	    <div class="goods_table_wrap">
			<!-- 상품 리스트 O -->
			<c:if test="${listcheck != 'empty'}">
				<table class="goods_table">
					<thead>
						<tr>
							<td class="th_column_1">상품 번호</td>
	           				<td class="th_column_2">상품 이름</td>
	           				<td class="th_column_3">작가 이름</td>
	           				<td class="th_column_4">카테고리</td>
	           				<td class="th_column_5">재고</td>
	           				<td class="th_column_6">등록날짜</td>
	           			</tr>
	           		</thead>
		       		<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.bookId}"></c:out></td>
							<td>
								<a class="move" href='/admin/goodsDetail?bookId=<c:out value="${list.bookId}&pageNum=${pageMaker.cri.pageNum }&amount=${pageMaker.cri.amount}"/>'>
									<c:out value="${list.bookName}"></c:out>
								</a>
							</td>
							<td><c:out value="${list.authorName}"></c:out></td>
							<td><c:out value="${list.cateName}"></c:out></td>
							<td><c:out value="${list.bookStock}"></c:out></td>
							<td><fmt:formatDate value="${list.regDate}" pattern="yyyy-MM-dd"/></td>
						</tr>
					</c:forEach>
				</table>
			</c:if>
		
			<!-- 상품 리스트 X -->
			<c:if test="${listCheck == 'empty'}">
				<div class="table_empty">
					등록된 작가가 없습니다.
				</div>
			</c:if>
		</div>

		<!-- 검색 영역 -->
		<div class="search_wrap">
			<form id="searchForm" action="/admin/goodsManage" method="get">
				<div class="search_input">
		   			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
					<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
					<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
		   			<input type="hidden" name="type" value="G">
		   			
		   			<button class='btn search_btn'>검 색</button>                				
				</div>
			</form>
		</div>

		<!-- 페이지 이름 인터페이스 영역 -->
		<div class="pageMaker_wrap">
			<ul class="pageMaker">
				<!-- 이전 버튼 -->
				<c:if test="${pageMaker.prev }">
					<li class="pageMaker_btn prev">
						<a href="goodsManage?pageNum=${pageMaker.pageStart -1}&amount=${pageMaker.cri.amount}">이전</a>
					</li>
				</c:if>
		
				<!-- 페이지 번호 -->
				<c:forEach begin="${pageMaker.pageStart }" end="${pageMaker.pageEnd }" var="num">
					<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? 'active':''}">
						<a href="goodsManage?pageNum=${num}&amount=${pageMaker.cri.amount}">${num}</a>
					</li>	
				</c:forEach>
		
				<!-- 다음 버튼 -->
				<c:if test="${pageMaker.next}">
					<li class="pageMaker_btn next">
						<a href="goodsManage?pageNum=${pageMaker.pageEnd + 1 }&amount=${pageMaker.cri.amount}">다음</a>
					</li>
				</c:if>
			</ul>
		</div>
         	
		<form id="moveForm" action="/admin/goodsManage" method="get" >
			<input type="hidden" id="pageNum" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" id="amount" name="amount" value="${pageMaker.cri.amount}">
			<input type="hidden" id="keyword" name="keyword" value="${pageMaker.cri.keyword}">
		</form>
	</div>
                
    <%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
var eResult = "<c:out value='${enroll_result}'/>";
var searchForm = $("#searchForm");
var moveForm = $("#moveForm");
var keyword = $("#keyword").val();
var href = $(this).attr("href");
var pageNum = $("#pageNum").val(1);
var hpageNum = $("#pageNum").val(href);
var modify_result = '${modify_result}';
var delete_result = '${delete_result}';

	$(document).ready(function(){
		
		checkResult(eResult);
		
		$("#searchForm button").on("click", function(){
			if(!searchForm.find(keyword)) {
				alert("키워드를 입력하십시오");
				return false;
			}
			
			searchForm.find(pageNum);
			searchForm.submit();
		});
		
		$(".pageMaker_btn a").on("click", function(){
			moveForm.find(hpageNum);
			moveForm.submit();
		});
		
		$(".move").on("click", function(){
			moveForm.append("<input type='hidden' name='bookId' value='"+ href + "'>");
			moveForm.attr("action", "/admin/goodsDetail");
			moveForm.submit();
		});
		
	});
	
	function checkResult(result) {
		
		if(result === '') {
			return;
		}
		
		if(modify_result == 1){
			alert("수정 완료");
		}
		
		if(delete_result == 1){
			alert("삭제 완료");
		}
		
		alert("상품" + eResult + "을 등록하였습니다.");
	}

</script>
</body>
</html>