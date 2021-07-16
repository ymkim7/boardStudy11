<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
	#result_card img{
		max-width: 100%;
	    height: auto;
	    display: block;
	    padding: 5px;
	    margin-top: 10px;
	    margin: auto;	
	}
	#result_card {
		position: relative;
	}
	.imgDeleteBtn{
	    position: absolute;
	    top: 0;
	    right: 5%;
	    background-color: #ef7d7d;
	    color: wheat;
	    font-weight: 900;
	    width: 30px;
	    height: 30px;
	    border-radius: 50%;
	    line-height: 26px;
	    text-align: center;
	    border: none;
	    display: block;
	    cursor: pointer;	
	}
</style>

<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/admin/goodsEnroll.css">
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
	    <div class="admin_content_subject"><span>상품 등록</span></div>
	    <div class="admin_content_main">
        	<form action="/admin/goodsEnroll" method="post" id="enrollForm">
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>책 제목</label>
        			</div>
        			<div class="form_section_content">
        				<input id="bookName" name="bookName">
        				<span class="ck_warn bookName_warn">책 이름을 입력해주세요.</span>
        			</div>
        		</div>
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>작가</label>
        			</div>
        			<div class="form_section_content">
        				<input id="authorName_input" readonly="readonly">
						<input id="authorId_input" name="authorId" type="hidden">
						<button class="authorId_btn">작가 선택</button>
						<span class="ck_warn authorId_warn">작가를 선택해주세요</span>
        			</div>
        		</div>            
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>출판일</label>
        			</div>
        			<div class="form_section_content">
        				<input id="publeYear" name="publeYear" autocomplete="off" readonly="readonly">
        				<span class="ck_warn publeYear_warn">출판일을 선택해주세요.</span>
        			</div>
        		</div>            
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>출판사</label>
        			</div>
        			<div class="form_section_content">
        				<input id="publisher" name="publisher">
        				<span class="ck_warn publisher_warn">출판사를 입력해주세요.</span>
        			</div>
        		</div>             
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>책 카테고리</label>
        			</div>
        			<div class="form_section_content">
        				<div class="cate_wrap">
							<span>대분류</span>
							<select class="cate1">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>중분류</span>
							<select class="cate2">
								<option selected value="none">선택</option>
							</select>
						</div>
						<div class="cate_wrap">
							<span>소분류</span>
							<select class="cate3" id="cateCode" name="cateCode">
								<option selected value="none">선택</option>
							</select>
						</div>
						<span class="ck_warn cateCode_warn">카테고리를 선택해주세요.</span> 
        			</div>
        		</div>          
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>상품 가격</label>
        			</div>
        			<div class="form_section_content">
        				<input id="bookPrice" name="bookPrice" value="0">
        				<span class="ck_warn bookPrice_warn">상품 가격을 입력해주세요.</span>
        			</div>
        		</div>               
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>상품 재고</label>
        			</div>
        			<div class="form_section_content">
        				<input id="bookStock" name="bookStock" value="0">
        				<span class="ck_warn bookStock_warn">상품 재고를 입력해주세요.</span>
        			</div>
        		</div>          
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>상품 할인율</label>
        			</div>
        			<div class="form_section_content">
        				<input id="discount_interface" maxlength="2" value="0">
						<input id="bookDiscount" name="bookDiscount" type="hidden" value="0">
						<span class="step_val">할인 가격 :<span class="span_discount"></span></span>
        				<span class="ck_warn bookDiscount_warn">1~99 숫자를 입력해주세요.</span>
        			</div>
        		</div>          		
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>책 소개</label>
        			</div>
        			<div class="form_section_content">
        				<textarea name="bookIntro" id="bookIntro_textarea"></textarea>
        				<span class="ck_warn bookIntro_warn">책 소개를 입력해주세요.</span>
        			</div>
        		</div>        		
        		<div class="form_section">
        			<div class="form_section_title">
        				<label>책 목차</label>
        			</div>
        			<div class="form_section_content">
        				<textarea name="bookContents" id="bookContents_textarea"></textarea>
        				<span class="ck_warn bookContents_warn">책 목차를 입력해주세요.</span>
        			</div>
        		</div>
        		
        		<div class="form_section">
          			<div class="form_section_title">
          				<label>상품 이미지</label>
          			</div>
          			<div class="form_section_content">
						<input type="file" id ="fileItem" name='uploadFile' style="height: 30px;" multiple>
						
						<div id="uploadResult">
							
						</div>
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
var enrollForm = $("#enrollForm");
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

/* 체크 변수 */
var bookNameCk = false;
var authorIdCk = false;
var publeYearCk = false;
var publisherCk = false;
var cateCodeCk = false;
var priceCk = false;
var stockCk = false;
var discountCk = false;
var introCk = false;
var contentsCk = false;

/* 체크 대상 변수 */
var bookName = $("#bookName").val();
var authorId = $("#authorId").val();
var publeYear = $("#publeYear").val();
var publisher = $("#publisher").val();
var cateCode = $("#cateCode").val();
var bookPrice = $("#bookPrice").val();
var bookStock = $("#bookStock").val();
var bookDiscount = $("#bookDiscount").val();
var bookDiscount = $("#discount_interface").val();
var bookIntro = $(".bit p").html();
var bookContents = $(".bct p").html();

	$(document).ready(function(){
		
		cartegory();
		effectiveness();
		
		$("#cancelBtn").on("click", function(){
			location.href = "/admin/goodsManage";
		});
		
		$("#enrollBtn").on("click", function(){
			enrollForm.submit();
		});
		
		/* 작가 선택 버튼 */
		$('.authorId_btn').on("click",function(e){
			
			e.preventDefault();
			
			var popUrl = "/admin/authorPop";
			var popOption = "width = 650px, height=550px, top=300px, left=300px, scrollbars=yes";
			
			window.open(popUrl,"작가 찾기",popOption);
			
		});
		
		/* 설정 */
		const config = {
			dateFormat: 'yy-mm-dd'
			, showOn : "button"
			, buttonText:"날짜 선택"
			, prevText: '이전 달'
		    , nextText: '다음 달'
		    , monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			, monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
			, dayNames: ['일','월','화','수','목','금','토']
			, dayNamesShort: ['일','월','화','수','목','금','토']
			, dayNamesMin: ['일','월','화','수','목','금','토']
			, yearSuffix: '년'
		    , changeMonth: true
	        , changeYear: true
		}
		
		$("#publeYear").datepicker(config);
		
		/* 위지윅 적용 */
		/* 책 소개 */
		ClassicEditor
			.create(document.querySelector('#bookIntro_textarea'))
			.catch(error=>{
				console.error(error);
			});
		/* 책 목차 */	
		ClassicEditor
			.create(document.querySelector('#bookContents_textarea'))
			.catch(error=>{
				console.error(error);
			});

		/* 할인율 Input 설정 */
		$("#discount_interface").on("propertychange change keyup paste input", function(){
			
			var userInput = $("#discount_interface");
			var discountInput = $("#bookDiscount");
			
			// 사용자가 입력할 할인값
			var discountRate = userInput.val();
			// 서버에 전송할 할인값
			var sendDiscountRate = discountRate / 100;
			// 원가
			var goodsPrice = $("#bookPrice").val();
			// 할인가격
			var discountPrice = goodsPrice * (1 - sendDiscountRate);
			
			if(!isNaN(discountRate)){
				
				$(".span_discount").html(discountPrice);
				discountInput.val(sendDiscountRate);
			}
			
		});
		
		$("#bookPrice").on("change", function(){
			
			var userInput = $("#discount_interface");
			var discountInput = $("#bookDiscount");
			
			// 사용자가 입력한 할인값
			var discountRate = userInput.val();
			// 서버에 전송할 할인값
			var sendDiscountRate = discountRate / 100;
			// 원가
			var goodsPrice = $("#bookPrice").val();
			// 할인가격
			var discountPrice = goodsPrice * (1 - sendDiscountRate);
			
			$(".span_discount").html(discountPrice);
			
		});
		
		/* 이미지 업로드 */
		$("#fileItem").on("change", function(){
			
			/* 이미지 존재시 삭제 */
			if($(".imgDeleteBtn").length > 0){
				deleteFile();
			}
			
			var fileInput = $('input[name="uploadFile"]');
			var fileList = fileInput[0].files;
			var fileObj = fileList[0];
			var formData = new FormData();
			
			if(!fileCheck(fileObj.name, fileObj.size)){
				return false;
			}
			
			for(var i = 0; i < fileList.length; i++){
				formData.append("uploadFile", fileList[i]);
			}
			
			$.ajax({
				url: '/admin/uploadAjaxAction'
				, processData : false
		    	, contentType : false
		    	, data : formData
		    	, type : 'POST'
		    	, dataType : 'json'
		    	, success : function(result){
		    		console.log("result :", result);
		    		showUploadImage(result);
		    	}
				, error : function(result){
					alert("이미지 파일이 아닙니다.");
		    	}
			});
		});
		
		var regex = new RegExp("(.*?)\.(jpg|png)$");
		var maxSize = 1048576; //1MB
		
		function fileCheck(fileName, fileSize){

			if(fileSize >= maxSize){
				alert("파일 사이즈 초과");
				return false;
			}
				  
			if(!regex.test(fileName)){
				alert("해당 종류의 파일은 업로드할 수 없습니다.");
				return false;
			}
			
			return true;		
			
		}
		
		/* 이미지 삭제 버튼 동작 */
		$("#uploadResult").on("click", ".imgDeleteBtn", function(){
			deleteFile();
		});
		
	});
	
	/* 카테고리 배열 초기화 메서드 */
	function makeCateArray(obj, array, cateList, tier){
		for(var i = 0; i < cateList.length; i++){
			if(cateList[i].tier === tier){
				obj = new Object();
				
				obj.cateName = cateList[i].cateName;
				obj.cateCode = cateList[i].cateCode;
				obj.cateParent = cateList[i].cateParent;
				
				array.push(obj);				
				
			}
		}
	}
	
	function cartegory () {
		
		/* 배열 초기화 */
		makeCateArray(cate1Obj,cate1Array,cateList,1);
		makeCateArray(cate2Obj,cate2Array,cateList,2);
		makeCateArray(cate3Obj,cate3Array,cateList,3);
		
		/* 대분류 */
		for(var i = 0; i < cate1Array.length; i++){
			cateSelect1.append("<option value='"+cate1Array[i].cateCode+"'>" + cate1Array[i].cateName + "</option>");
		}
		
		/* 중분류 <option> 태그 */
		$(cateSelect1).on("change",function(){
			
			var selectVal1 = $(this).find("option:selected").val();
			
			cateSelect2.children().remove();
			cateSelect3.children().remove();
			cateSelect2.append("<option value='none'>선택</option>");
			cateSelect3.append("<option value='none'>선택</option>");
			
			for(var i = 0; i < cate2Array.length; i++){
				if(selectVal1 === cate2Array[i].cateParent){
					cateSelect2.append("<option value='"+cate2Array[i].cateCode+"'>" + cate2Array[i].cateName + "</option>");	
				}
			}
		});
		
		/* 소분류 <option>태그 */
		$(cateSelect2).on("change",function(){
			
			var selectVal2 = $(this).find("option:selected").val();
			
			cateSelect3.children().remove();
			cateSelect3.append("<option value='none'>선택</option>");		
			
			for(var i = 0; i < cate3Array.length; i++){
				if(selectVal2 === cate3Array[i].cateParent){
					cateSelect3.append("<option value='"+cate3Array[i].cateCode+"'>" + cate3Array[i].cateName + "</option>");	
				}
			}	
			
		});	
	}
	
	function effectiveness() {
		
		if(bookName){
			$(".bookName_warn").css('display','none');
			bookNameCk = true;
		} else {
			$(".bookName_warn").css('display','block');
			bookNameCk = false;
		}
		
		if(authorId){
			$(".authorId_warn").css('display','none');
			authorIdCk = true;
		} else {
			$(".authorId_warn").css('display','block');
			authorIdCk = false;
		}
		
		if(publeYear){
			$(".publeYear_warn").css('display','none');
			publeYearCk = true;
		} else {
			$(".publeYear_warn").css('display','block');
			publeYearCk = false;
		}	
		
		if(publisher){
			$(".publisher_warn").css('display','none');
			publisherCk = true;
		} else {
			$(".publisher_warn").css('display','block');
			publisherCk = false;
		}
		
		if(cateCode != 'none'){
			$(".cateCode_warn").css('display','none');
			cateCodeCk = true;
		} else {
			$(".cateCode_warn").css('display','block');
			cateCodeCk = false;
		}	
		
		if(bookPrice != 0){
			$(".bookPrice_warn").css('display','none');
			priceCk = true;
		} else {
			$(".bookPrice_warn").css('display','block');
			priceCk = false;
		}	
		
		if(bookStock != 0){
			$(".bookStock_warn").css('display','none');
			stockCk = true;
		} else {
			$(".bookStock_warn").css('display','block');
			stockCk = false;
		}		
		
		if(!isNaN(bookDiscount)){
			$(".bookDiscount_warn").css('display','none');
			discountCk = true;
		} else {
			$(".bookDiscount_warn").css('display','block');
			discountCk = false;
		}	
		
		if(bookIntro != '<br data-cke-filler="true">'){
			$(".bookIntro_warn").css('display','none');
			introCk = true;
		} else {
			$(".bookIntro_warn").css('display','block');
			introCk = false;
		}	
		
		if(bookContents != '<br data-cke-filler="true">'){
			$(".bookContents_warn").css('display','none');
			contentsCk = true;
		} else {
			$(".bookContents_warn").css('display','block');
			contentsCk = false;
		}
		
		if(bookNameCk && authorIdCk && publeYearCk && publisherCk
			&& cateCodeCk && priceCk && stockCk
			&& discountCk && introCk && contentsCk ){
			
			//alert('통과');
			enrollForm.submit();
			
		} else {
			return false;
		}
	}
	
	/* 이미지 출력 */
	function showUploadImage(uploadResultArr){
		/* 전달받은 데이터 검증 */
		if(!uploadResultArr || uploadResultArr.length == 0){
			
			return;
		}
		
		var uploadResult = $("#uploadResult");
		var obj = uploadResultArr[0];
		var str = "";
		var fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);
		
		str += "<div id='result_card'>";
		str += "<img src='/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='" + fileCallPath + "'>x</div>";
		str += "</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		
		uploadResult.append(str);
	}
	
	/* 파일 삭제 메서드 */
	function deleteFile(){
		
		var targetFile = $(".imgDeleteBtn").data("file");
		var targetDiv = $("#result_card");
		
		$.ajax({
			url: '/admin/deleteFile',
			data : {fileName : targetFile},
			dataType : 'text',
			type : 'POST',
			success : function(result){
				console.log(result);
				
				targetDiv.remove();
				$("input[type='file']").val("");
				
			},
			error : function(result){
				console.log(result);
				
				alert("파일을 삭제하지 못하였습니다.")
			}
		});
		
	}

</script>
</body>
</html>