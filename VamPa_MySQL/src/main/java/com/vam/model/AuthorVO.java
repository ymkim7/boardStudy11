package com.vam.model;

import java.util.Date;
import java.util.Objects;

public class AuthorVO {
	
	/* 작가 아이디 */
    private int authorId;
    /* 작가 이름 */
    private String authorName;
    /* 국가 id */
    private String nationId;
    /* 작가 국가 */
    private String nationName;
    /* 작가 소개 */
    private String authorIntro;
    /*등록 날짜*/
    private Date regDate;
    /* 수정 날짜 */
    private Date updateDate;

    public AuthorVO() {}

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

	public String getNationId() {
		return nationId;
	}

	public void setNationId(String nationId) {
		this.nationId = nationId;
		
		if(nationId.equals("01")) {
			this.nationName = "국내";
		} else {
			this.nationName = "해외";
		}
	}

	public String getNationName() {
		return nationName;
	}

	public void setNationName(String nationName) {
		this.nationName = nationName;
	}

	public String getAuthorIntro() {
		return authorIntro;
	}

	public void setAuthorIntro(String authorIntro) {
		this.authorIntro = authorIntro;
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

	public AuthorVO(int authorId, String authorName, String nationId, String nationName, String authorIntro,
			Date regDate, Date updateDate) {
		super();
		this.authorId = authorId;
		this.authorName = authorName;
		this.nationId = nationId;
		this.nationName = nationName;
		this.authorIntro = authorIntro;
		this.regDate = regDate;
		this.updateDate = updateDate;
	}

	@Override
	public String toString() {
		return "AuthorVO [authorId=" + authorId + ", authorName=" + authorName + ", nationId=" + nationId
				+ ", nationName=" + nationName + ", authorIntro=" + authorIntro + ", regDate=" + regDate
				+ ", updateDate=" + updateDate + ", toString()=" + super.toString() + "]";
	}

	@Override
	public int hashCode() {
		return Objects.hash(authorId, authorIntro, authorName, nationId, nationName, regDate, updateDate);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		AuthorVO other = (AuthorVO) obj;
		return authorId == other.authorId && Objects.equals(authorIntro, other.authorIntro)
				&& Objects.equals(authorName, other.authorName) && Objects.equals(nationId, other.nationId)
				&& Objects.equals(nationName, other.nationName) && Objects.equals(regDate, other.regDate)
				&& Objects.equals(updateDate, other.updateDate);
	}
    
}
