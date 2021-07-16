<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">

	#result_card img {
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
</style>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/goodsDetail.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//cdn.ckeditor.com/ckeditor5/29.0.0/classic/ckeditor.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" />
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/head.jsp" %>
	
	<div class="admin_content_wrap">
	    <div class="admin_content_subject"><span>상품 상세</span></div>
	    <div class="admin_content_main">
			<div class="form_section">
       			<div class="form_section_title">
       				<label>책 제목</label>
       			</div>
       			<div class="form_section_content">
       				<input id="bookName" name="bookName" value="<c:out value="${goodsInfo.bookName}"/>" disabled>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>등록 날짜</label>
       			</div>
       			<div class="form_section_content">
       				<input value="<fmt:formatDate value='${goodsInfo.regDate}' pattern='yyyy-MM-dd'/>" disabled>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>최근 수정 날짜</label>
       			</div>
       			<div class="form_section_content">
       				<input value="<fmt:formatDate value='${goodsInfo.updateDate}' pattern='yyyy-MM-dd'/>" disabled>
       			</div>
       		</div>
       		                 		                    		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>작가</label>
       			</div>
       			<div class="form_section_content">
       				<input id="authorName_input" readonly="readonly" value="${goodsInfo.authorName }" disabled>
       				                    				
       			</div>
       		</div>
       		         
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>출판일</label>
       			</div>
       			<div class="form_section_content">
       				<input id="publeYear" name="publeYear" autocomplete="off" readonly="readonly" value="<c:out value="${goodsInfo.publeYear}"/>" disabled>                    				
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>출판사</label>
       			</div>
       			<div class="form_section_content">
       				<input id="publisher" name="publisher" value="<c:out value="${goodsInfo.publisher}"/>" disabled>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>책 카테고리</label>
       			</div>
       			<div class="form_section_content">
       				<div class="cate_wrap">
       					<span>대분류</span>
       					<select class="cate1" disabled>
       						<option  value="none">선택</option>
       					</select>
       				</div>
       				<div class="cate_wrap">
       					<span>중분류</span>
       					<select class="cate2" disabled>
       						<option  value="none">선택</option>
       					</select>
       				</div>
       				<div class="cate_wrap">
       					<span>소분류</span>
       					<select class="cate3" name="cateCode" disabled>
       						<option value="none">선택</option>
       					</select>
       				</div>                  				                    				
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>상품 가격</label>
       			</div>
       			<div class="form_section_content">
       				<input id="bookPrice" name="bookPrice" value="<c:out value="${goodsInfo.bookPrice}"/>" disabled>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>상품 재고</label>
       			</div>
       			<div class="form_section_content">
       				<input id="bookStock" name="bookStock" value="<c:out value="${goodsInfo.bookStock}"/>" disabled>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>상품 할인율</label>
       			</div>
       			<div class="form_section_content">
       				<input id="discount_interface" maxlength="2" disabled>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>책 소개</label>
       			</div>
       			<div class="form_section_content bit">
       				<textarea name="bookIntro" id="bookIntro_textarea" disabled>${goodsInfo.bookIntro}</textarea>
       			</div>
       		</div>
       		
       		<div class="form_section">
       			<div class="form_section_title">
       				<label>책 목차</label>
       			</div>
       			<div class="form_section_content bct">
 					<textarea name="bookContents" id="bookContents_textarea" disabled>${goodsInfo.bookContents}</textarea>
       			</div>
       		</div>
       		
       		<div class="form_section">
				<div class="form_section_title">
					<label>상품 이미지</label>
				</div>
				
				<div class="form_section_content">
					<div id="uploadResult">
					
					</div>
				</div>
			</div>

   			<div class="btn_section">
   				<button id="cancelBtn" class="btn">상품 목록</button>
         		<button id="modifyBtn" class="btn enroll_btn">수정 </button>
         	</div> 
		</div>

         	
		<form id="moveForm" action="/admin/goodsManage" method="get" >
			<input type="hidden" id="pageNum" name="pageNum" value="${cri.pageNum}">
			<input type="hidden" id="amount" name="amount" value="${cri.amount}">
			<input type="hidden" id="keyword" name="keyword" value="${cri.keyword}">
     	</form>
	</div>
	
	<%@ include file="/WEB-INF/views/include/footer.jsp" %>

<script type="text/javascript">
var bookDiscount = '<c:out value="${goodsInfo.bookDiscount}"/>' * 100;
var addInput = '<input type="hidden" name="bookId" value="${goodsInfo.bookId}">';
var publeYear = '${goodsInfo.publeYear}';
var length = publeYear.indexOf(" ");
var cateList = JSON.parse('${cateList}');
var cate1Array = new Array();
var cate2Array = new Array();
var cate3Array = new Array();
var cate1Obj = new Object();
var cate2Obj = new Object();
var cate3Obj = new Object();
var cateSelect1 = $(".cate1");
var cateSelect2 = $(".cate2");
var cateSelect3 = $(".cate3");
var targetCate2 = '';
var targetCate3 = '${goodsInfo.cateCode}';
var moveForm = $("#moveForm");

	$(document).ready(function(){
		
		cartegory();
		
		publeYear = publeYear.substring(0, length);
		$("#publeYear").attr("value", publeYear);
		
		$("#discount_interface").attr("value", bookDiscount);
		
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#bookIntro_textarea'))
			.then(editor => {
				console.log(editor);
				editor.isReadOnly = true;
			})
			.catch(error=>{
				console.error(error);
			});
			
		/* 책 목차 */	
		ClassicEditor
		.create(document.querySelector('#bookContents_textarea'))
		.then(editor => {
			console.log(editor);
			editor.isReadOnly = true;
		})
		.catch(error=>{
			console.error(error);
		});
		
		$("#cancelBtn").on("click", function(){
			moveForm.submit();
		});
		
		$("#modifyBtn").on("click", function(){
			moveForm.append(addInput);
			moveForm.attr("action", "/admin/goodsModify");
			moveForm.submit();
		});
		
		/* 이미지 정보 호출 */
		var bookId = '<c:out value="${goodsInfo.bookId}"/>';
		var uploadResult = $("#uploadResult");
		
		$.getJSON("/getAttachList", {bookId : bookId}, function(arr){	
			
			if(arr.length === 0){
				
				var str = "";
				
				str += "<div id='result_card'>";
				str += "<img src='/resources/img/goodsNoImage.png'>";
				str += "</div>";
				
				uploadResult.html(str);	
				
				return;
			}
			
			var str = "";
			var obj = arr[0];
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			
			str += "<div id='result_card'";
			str += "data-path='" + obj.uploadPath + "' data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'";
			str += ">";
			str += "<img src='/display?fileName=" + fileCallPath +"'>";
			str += "</div>";
			
			uploadResult.html(str);	
			
		});
		
	});
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj,array,cateList, tier){
		for(let i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);
				
			}
		}
	}
	
	function cartegory() {
		
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
		
		for(var i = 0; i < cate3Array.length; i++){
			if(targetCate3 === cate3Array[i].cateCode){
				targetCate3 = cate3Array[i];
			}
		}
		
		for(var i = 0; i < cate3Array.length; i++){
			if(targetCate3.cateParent === cate3Array[i].cateParent){
				cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");
			}
		}
		
		$(".cate3 option").each(function(i,obj){
			if(targetCate3.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		for(var i = 0; i < cate2Array.length; i++){
			if(targetCate3.cateParent === cate2Array[i].cateCode){
				targetCate2 = cate2Array[i];	
			}
		}
		
		for(var i = 0; i < cate2Array.length; i++){
			if(targetCate2.cateParent === cate2Array[i].cateParent){
				cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");
			}
		}		
		
		$(".cate2 option").each(function(i,obj){
			if(targetCate2.cateCode === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
		for(var i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		$(".cate1 option").each(function(i,obj){
			if(targetCate2.cateParent === obj.value){
				$(obj).attr("selected", "selected");
			}
		});
		
	}

</script>
</body>
</html>