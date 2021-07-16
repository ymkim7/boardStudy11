<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/resources/css/main.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body>
	<div class="wrapper">
		<div class="wrap">
			<div class="top_gnb_area">
				<ul class="list">
					<c:if test="${member == nulll }">
		                <li >
		                    <a href="/member/login">로그인</a>
		                </li>
		                <li>
		                    <a href="/member/join">회원가입</a>
		                </li>
		                <li>
		                    고객센터
		                </li>
	                </c:if>
	                
	                <c:if test="${member != null }">
	                	<c:if test="${member.adminCk == 1 }">
	                        <li><a href="/admin/main">관리자 페이지</a></li>
	                    </c:if>
	                    
	                    <li>
	                        <a class="gnb_logout_button">로그아웃</a>
	                    </li>
	                    <li>
	                        마이룸
	                    </li>
	                    <li>
	                        장바구니
	                    </li>
	                </c:if>
	            </ul>
			</div>
			<div class="top_area">
				<div class="logo_area">
					<a href="/main"><img src="/resources/img/mLogo.png"></a>
				</div>
				<div class="search_area">
					<h1>search_area</h1>
				</div>
				
				<div class="login_area">
					<c:if test="${member == nulll }">
						<div class="login_button"><a href="/member/login">로그인</a></div>
						<span><a href="/member/join">회원가입</a></span>
					</c:if>
					
					<c:if test="${member != null }">
						<div class="login_success_area">
	                        <span>회원 : ${member.memberName}</span>
	                        <span>충전금액 : <fmt:formatNumber value="${member.money }" pattern="\#,###.##"/></span>
	                        <span>포인트 : <fmt:formatNumber value="${member.point }" pattern="#,###" /></span>
	                    	<a class="gnb_logout_button">로그아웃</a>
	                    </div>
					</c:if>
				</div>

				<div class="clearfix"></div>			
			</div>
			<div class="navi_bar_area">
				<h1>navi area</h1>
			</div>
			<div class="content_area">
				<h1>content area</h1>
			</div>
			
			<div>
				<%@ include file="/WEB-INF/views/include/footer.jsp" %>
			</div>
		</div>
	</div>
	
<script type="text/javascript">

	$(document).ready(function(){
		
		$(".gnb_logout_button").on("click", function(){
			$.ajax({
				type : "POST"
				, url : "/member/logout.do"
				, success : function(data) {
					alert("로그아웃");
					location.reload();
				}
			});
		});
		
	});

</script>
</body>
</html>