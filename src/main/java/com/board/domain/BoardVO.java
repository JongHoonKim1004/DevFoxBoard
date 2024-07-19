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
/**
 * 
 * @author PC
 * 掲示板の書き込みの構造です。
 *
 */
public class BoardVO {
	public int bno; // 書き込み番号
	public String title; //　タイトル
	public String writer; //　作成者
	public String content; //　本文
	public Date regDate; //　登録時間
	public Date updateDate; //　修正時間
	public int readCount; //　クリック数
}
