package com.board.domain;

import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@Log4j
public class Criteria {
	/**
	 * ページングと検索に関するセッティングをします。
	 * 
	 */
	
	private int pageNum;
	private int size;
	
	private String type;
	private String keyword;
	
	public Criteria() {
		this(1,10);
	}
	
	public Criteria(int pageNum, int size) {
		this.size = size;
		this.pageNum = pageNum;
	}
	
	public int getOffset() {
		return (pageNum - 1) * size; 
	}
	
	public String[] getTypeArr() {
		String[] list = type == null ? new String[] {} : type.split("");
		log.info(list.toString());
		
		return list;
	}
	
}
