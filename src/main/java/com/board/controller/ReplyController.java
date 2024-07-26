package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.ReplyVO;
import com.board.service.ReplyService;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@AllArgsConstructor
@NoArgsConstructor
@RequestMapping("/reply")
public class ReplyController {
	/**
	 * AJAXを使った要請に関するコントローラーです。
	 */
	
	@Autowired
	private ReplyService service;
	
	@GetMapping(value="/bno/{bno}", produces = "application/json")
	public ResponseEntity<List<ReplyVO>> getReplyListByBno(@PathVariable("bno") int bno){
		/**
		 * 指定した書き込みのリプライを要請します。
		 */
		List<ReplyVO> list = service.getList(bno);
		
		return new ResponseEntity<List<ReplyVO>>(list, HttpStatus.OK);
	}
	
	@GetMapping(value="/rno/{rno}", produces = "application/json")
	public ResponseEntity<ReplyVO> getReplyByRno(@PathVariable("rno") int rno){
		/**
		 * 特定のリプライを要請します。
		 */
		
		ReplyVO reply = service.getOneByRno(rno);
		return new ResponseEntity<ReplyVO>(reply, HttpStatus.OK);
	}
	
    @PostMapping(value = "/register", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
    public ResponseEntity<String> postRegisterReply(@RequestBody ReplyVO reply){
    	/**
    	 * 新しいリプライを登録します 
    	 */
    	
        log.info("Create Reply Start");
        log.info("Received Reply: " + reply.toString());
        service.createReply(reply);
        log.info("Create Reply End");

        return new ResponseEntity<>("Success", HttpStatus.OK);
    }
	
	@PostMapping(value = "/modify", consumes = MediaType.APPLICATION_JSON_VALUE, produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> postModifyReply(@RequestBody ReplyVO reply){
		/**
		 * 登録したリプライを修正します。
		 */
		
		log.info("Modify Reply Start");
		service.updateReply(reply);
		log.info("Modify Reply End");
		
		return new ResponseEntity<>("Success", HttpStatus.OK);
	}
	
	@PostMapping(value = "/delete", produces = MediaType.TEXT_PLAIN_VALUE)
	public ResponseEntity<String> postDeleteReply(@RequestParam int rno){
		/**
		 * リプライを削除します。
		 */
		
		log.info("Delete Reply Start");
		service.deleteReply(rno);
		log.info("Delete Reply End");
		
		return new ResponseEntity<String>("Success", HttpStatus.OK);
	}
}
