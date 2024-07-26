package com.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.domain.PageDTO;
import com.board.domain.ReplyVO;
import com.board.domain.UsersVO;
import com.board.service.BoardService;
import com.board.service.ReplyService;
import com.board.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board")
/**
 * 
 * @author PC
 * クライアントがした掲示板に関する要請をBoardServiceを呼び出し処理します
 * 
 */
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private ReplyService replyService;
	@Autowired
	private UsersService usersService;
	
	
	@GetMapping("/list")
	public String getList(Model model, @ModelAttribute Criteria cri, SecurityContextHolder sec){
		/**
		 * 掲示板ページにアクセスする際、すべての書き込みを呼び出し
		 * 、VIEWから表示できるようにします 
		 */
		
		// ログインしたユーザーは情報を要請し、ページ内で使えるようにします
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if(username != "anonymousUser") {
			UsersVO user = usersService.read(username);
			model.addAttribute("users", user);
		}
		
		log.info(cri.toString());
		List<BoardVO> list = boardService.getListWithPaging(cri);
		
		int total = boardService.countTotalBoard();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("list", list);
		
		return "/board/list";
	}
	
	@GetMapping("/{bno}")
	public String getOneByBno(@PathVariable int bno, Model model, @ModelAttribute("cri") Criteria cri) {
		/**
		 * 　書き込みのタイトルをクリックすると書き込み番号の書き込みを呼び出し
		 * 　その内容をVIEWから表示できるようにします
		 */
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if(username != "anonymousUser") {
			UsersVO user = usersService.read(username);
			model.addAttribute("users", user);
		}
		
		// 書き込みの情報を要請する際にリプライも一緒に要請します。
		BoardVO board = boardService.viewBoard(bno);
		List<ReplyVO> replyList = replyService.getList(bno);
		model.addAttribute("replyList", replyList);
		
		int total = boardService.countTotalBoard();
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		model.addAttribute("board", board);
		
		return "/board/get";
	}
	
	@GetMapping("/create")
	public String createBoard(Model model) {
		/**
		 * 書き込みを作成するページへ移動します
		 */
		
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if(username != "anonymousUser") {
			UsersVO user = usersService.read(username);
			model.addAttribute("users", user);
		}
		
		
		return "/board/create";
	}
	
	@PostMapping("/create")
	public String postCreateBoard(@ModelAttribute BoardVO board, RedirectAttributes rttr) {
		/**
		 * 新しい書き込みを登録します。
		 * 登録を完了すると掲示板ページにリダイレクトするとともにメッセージを送ります
		 */
		
		
		log.info(board.toString());
		log.info("Create Board Start");
		boardService.create(board);
		log.info("Create Board End");
		
		
		rttr.addFlashAttribute("message", "新しい書き込みが登録されました。");
		
		return "redirect:/board/list";
	}
	
	@GetMapping("/update")
	public String updateBoard(@RequestParam("bno") int bno, Model model) {
		/**
		 * 見ている書き込みを修正するためのページへ移動します。
		 * bnoから書き込みを呼び出し、修正ページに映します。
		 */
		String username = SecurityContextHolder.getContext().getAuthentication().getName();
		if(username != "anonymousUser") {
			UsersVO user = usersService.read(username);
			model.addAttribute("users", user);
		}
		
		BoardVO board = boardService.getOneByBno(bno);
		
		model.addAttribute("board", board);
		
		return "/board/update";
	}
	
	@PostMapping("/update")
	public String postUpdateBoard(@ModelAttribute BoardVO board, RedirectAttributes rttr) {
		/**
		 * 修正した書き込みを適用するようにします。
		 * 適用のあと、掲示板ページにリダイレクトすると共にメッセージを送ります
		 */
		log.info(board.toString());
		log.info("Update Board Start");
		boardService.update(board);
		log.info("Update Board End");
		
		rttr.addFlashAttribute("message", "書き込みの修正が完了しました。");
		
		return "redirect:/board/" + board.bno;
	}
	
	@PostMapping("/delete")
	public String postDeleteBoard(@RequestParam("bno") int bno, RedirectAttributes rttr) {
		/**
		 * bnoで指定した書き込みを削除します。
		 * 削除の後、掲示板ページにリダイレクトすると共にメッセージを送ります
		 */
		log.info("Delete Board Start");
		boardService.delete(bno);
		log.info("Delete Board End");
		
		rttr.addFlashAttribute("message", "書き込みが削除されました。");
		
		return "redirect:/board/list";
	}
}
