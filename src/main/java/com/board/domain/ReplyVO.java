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
	
	private int rno; // リプライ番号
	private int bno; //　リプライを書いた書き込みの番号
	private String reply; // リプライ本文
	private String writer; // 作成者のニックネーム
	private String writerId; // 作成者のID
	private Date regDate; //　登録時間
	private Date updateDate; //　修正時間
}
