package com.vam.model;

import java.util.Date;
import java.util.List;
import java.util.Objects;

public class BookVO {
	
	/* 상품 id */
	private int bookId;
	/* 상품 이름 */
	private String bookName;
	/* 작가 id */
	private int authorId;
	/* 작가 이름 */
	private String authorName;
	/* 출판일 */
	private String publeYear;
	/* 출판사 */
	private String publisher;
	/* 카테고리 코드 */
	private String cateCode;
	/* 카테고리 이름 */
	private String cateName;
	/* 상품 가격 */
	private int bookPrice;
	/* 상품 재고 */
	private int bookStock;
	/* 상품 할인률(백분율) */
	private double bookDiscount;
	/* 상품 소개 */
	private String bookIntro;
	/* 상품 목차 */
	private String bookContents;
	/* 등록 날짜 */
	private Date regDate;
	/* 수정 날짜 */
	private Date updateDate;
	/* 경로 */
	private String uploadPath;
	/* uuid */
	private String uuid;
	/* 이미지 정보 */
	private List<AttachImageVO> imageList;

	public List<AttachImageVO> getImageList() {
		return imageList;
	}

	public void setImageList(List<AttachImageVO> imageList) {
		this.imageList = imageList;
	}

	public String getUploadPath() {
		return uploadPath;
	}

	public void setUploadPath(String uploadPath) {
		this.uploadPath = uploadPath;
	}

	public String getUuid() {
		return uuid;
	}

	public void setUuid(String uuid) {
		this.uuid = uuid;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	/* 파일 이름 */
	private String fileName;
	
	public BookVO() {}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getAuthorId() {
		return authorId;
	}

	public void setAuthorId(int authorId) {
		this.authorId = authorId;
	}

	public String getAuthorName() {
		return authorName;
	}

	public void setAuthorName(String authorName) {
		this.authorName = authorName;
	}

	public String getPubleYear() {
		return publeYear;
	}

	public void setPubleYear(String publeYear) {
		this.publeYear = publeYear;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public String getCateCode() {
		return cateCode;
	}

	public void setCateCode(String cateCode) {
		this.cateCode = cateCode;
	}

	public String getCateName() {
		return cateName;
	}

	public void setCateName(String cateName) {
		this.cateName = cateName;
	}

	public int getBookPrice() {
		return bookPrice;
	}

	public void setBookPrice(int bookPrice) {
		this.bookPrice = bookPrice;
	}

	public int getBookStock() {
		return bookStock;
	}

	public void setBookStock(int bookStock) {
		this.bookStock = bookStock;
	}

	public double getBookDiscount() {
		return bookDiscount;
	}

	public void setBookDiscount(double bookDiscount) {
		this.bookDiscount = bookDiscount;
	}

	public String getBookIntro() {
		return bookIntro;
	}

	public void setBookIntro(String bookIntro) {
		this.bookIntro = bookIntro;
	}

	public String getBookContents() {
		return bookContents;
	}

	public void setBookContents(String bookContents) {
		this.bookContents = bookContents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public BookVO(int bookId, String bookName, int authorId, String authorName, String publeYear, String publisher,
			String cateCode, String cateName, int bookPrice, int bookStock, double bookDiscount, String bookIntro,
			String bookContents, Date regDate, Date updateDate, String uploadPath, String uuid,
			List<AttachImageVO> imageList, String fileName) {
		super();
		this.bookId = bookId;
		this.bookName = bookName;
		this.authorId = authorId;
		this.authorName = authorName;
		this.publeYear = publeYear;
		this.publisher = publisher;
		this.cateCode = cateCode;
		this.cateName = cateName;
		this.bookPrice = bookPrice;
		this.bookStock = bookStock;
		this.bookDiscount = bookDiscount;
		this.bookIntro = bookIntro;
		this.bookContents = bookContents;
		this.regDate = regDate;
		this.updateDate = updateDate;
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.imageList = imageList;
		this.fileName = fileName;
	}

	@Override
	public String toString() {
		return "BookVO [bookId=" + bookId + ", bookName=" + bookName + ", authorId=" + authorId + ", authorName="
				+ authorName + ", publeYear=" + publeYear + ", publisher=" + publisher + ", cateCode=" + cateCode
				+ ", cateName=" + cateName + ", bookPrice=" + bookPrice + ", bookStock=" + bookStock + ", bookDiscount="
				+ bookDiscount + ", bookIntro=" + bookIntro + ", bookContents=" + bookContents + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", uploadPath=" + uploadPath + ", uuid=" + uuid + ", imageList="
				+ imageList + ", fileName=" + fileName + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(authorId, authorName, bookContents, bookDiscount, bookId, bookIntro, bookName, bookPrice,
				bookStock, cateCode, cateName, fileName, imageList, publeYear, publisher, regDate, updateDate,
				uploadPath, uuid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BookVO other = (BookVO) obj;
		return authorId == other.authorId && Objects.equals(authorName, other.authorName)
				&& Objects.equals(bookContents, other.bookContents)
				&& Double.doubleToLongBits(bookDiscount) == Double.doubleToLongBits(other.bookDiscount)
				&& bookId == other.bookId && Objects.equals(bookIntro, other.bookIntro)
				&& Objects.equals(bookName, other.bookName) && bookPrice == other.bookPrice
				&& bookStock == other.bookStock && Objects.equals(cateCode, other.cateCode)
				&& Objects.equals(cateName, other.cateName) && Objects.equals(fileName, other.fileName)
				&& Objects.equals(imageList, other.imageList) && Objects.equals(publeYear, other.publeYear)
				&& Objects.equals(publisher, other.publisher) && Objects.equals(regDate, other.regDate)
				&& Objects.equals(updateDate, other.updateDate) && Objects.equals(uploadPath, other.uploadPath)
				&& Objects.equals(uuid, other.uuid);
	}

}
