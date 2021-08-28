package com.psw.exam.demo.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Article {
	private int id;
	private String regDate;
	private String updateDate;
	private int memberId;
	private String title;
	private String body;
	private int hitCount;
	
	private int extra__sumReactionPoint;
	private int extra__goodReactionPoint; // 좋아요
	private int extra__badReactionPoint; // 싫어요
	
	private String extra__writerName;
	private boolean extra__actorCanModify;
	private boolean extra__actorCanDelete;
	
	public String getForPrintType1RegDate() {
		return regDate.substring(2, 16).replace(" ", "<br>");
	}
	
	public String getForPrintType1UpdateDate() {
		return updateDate.substring(2, 16).replace(" ", "<br>");
	}

	public String getForPrintType2RegDate() {
		return regDate.substring(2, 16).replace(" ", "<br>");
	}
	
	public String getForPrintType2UpdateDate() {
		return updateDate.substring(2, 16).replace(" ", "<br>");
	}
	
}
