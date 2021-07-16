package com.vam.model;

import java.util.Objects;

public class AttachImageVO {
	
	/* 경로 */
	private String uploadPath;
	/* uuid */
	private String uuid;
	/* 파일 이름 */
	private String fileName;
	/* 상품 id */
	private int bookId;
	
	public AttachImageVO() {}

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

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public AttachImageVO(String uploadPath, String uuid, String fileName, int bookId) {
		super();
		this.uploadPath = uploadPath;
		this.uuid = uuid;
		this.fileName = fileName;
		this.bookId = bookId;
	}

	@Override
	public String toString() {
		return "AttachImageVO [uploadPath=" + uploadPath + ", uuid=" + uuid + ", fileName=" + fileName + ", bookId="
				+ bookId + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(bookId, fileName, uploadPath, uuid);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AttachImageVO other = (AttachImageVO) obj;
		return bookId == other.bookId && Objects.equals(fileName, other.fileName)
				&& Objects.equals(uploadPath, other.uploadPath) && Objects.equals(uuid, other.uuid);
	}

}
