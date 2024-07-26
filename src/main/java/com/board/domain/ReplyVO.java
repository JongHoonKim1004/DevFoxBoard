package com.board.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ReplyVO {
	/**
	 * リプライの構造です。
	 */
	
	private int rno;
	private int bno;
	private String reply;
	private String writer;
	private String writerId;
	private Date regDate;
	private Date updateDate;
}
