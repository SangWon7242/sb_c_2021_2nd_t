package com.psw.exam.demo.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.psw.exam.demo.service.ArticleService;
import com.psw.exam.demo.util.Ut;
import com.psw.exam.demo.vo.Article;
import com.psw.exam.demo.vo.ResultData;

@Controller
public class UsrArticleController {
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/usr/article/doAdd")
	@ResponseBody
	public ResultData<Article> doAdd(HttpSession httpSession, String title, String body) {
		boolean isLogined = false;
		int loginedMemberId = 0; // 로그인 안한 상태를 0으로 둠

		// null이 아니라면 로그인한 상태
		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int)httpSession.getAttribute("loginedMemberId");
		}
		
		if( isLogined == false) {
			return ResultData.from("F-A", "로그인 후 이용해주세요.");
		}

		if (Ut.empty(title)) {
			return ResultData.from("F-1", "title(을)를 입력해주세요.");
		}

		if (Ut.empty(body)) {
			return ResultData.from("F-2", "body(을)를 입력해주세요.");
		}

		ResultData<Integer> writeArticleRd = articleService.writeArticle(loginedMemberId, title, body);
		int id = writeArticleRd.getData1();

		Article article = articleService.getArticle(id);

		return ResultData.newData(writeArticleRd, article);
	}

	@RequestMapping("/usr/article/getArticles")
	@ResponseBody
	public ResultData<List<Article>> getArticles() {
		List<Article> articles = articleService.getArticles();

		return ResultData.from("S-1", "게시물 리스트 입니다.", articles);
	}

	@RequestMapping("/usr/article/getArticle")
	@ResponseBody
	public ResultData<Article> getArticle(int id) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			return ResultData.from("F-1", Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		return ResultData.from("S-1", Ut.f("%d번 게시물입니다.", id));
	}

	@RequestMapping("/usr/article/doDelete")
	@ResponseBody
	public ResultData<Integer> doDelete(HttpSession httpSession, int id) {
		boolean isLogined = false;
		int loginedMemberId = 0; // 로그인 안한 상태를 0으로 둠

		// null이 아니라면 로그인한 상태
		if (httpSession.getAttribute("loginedMemberId") != null) {
			isLogined = true;
			loginedMemberId = (int)httpSession.getAttribute("loginedMemberId");
		}
		
		if( isLogined == false) {
			return ResultData.from("F-A", "로그인 후 이용해주세요.");
		}
		
		Article article = articleService.getArticle(id);
		
		if( article.getMemberId() != loginedMemberId) {
			return ResultData.from("F-2", "권한이 없습니다.");
		}

		if (article == null) {
			ResultData.from("F-1", Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		articleService.deleteArticle(id);

		return ResultData.from("S-1", Ut.f("%d번 게시물을 삭제하였습니다.", id), id);
	}

	@RequestMapping("/usr/article/doModify")
	@ResponseBody
	public ResultData<Integer> doModify(int id, String title, String body) {
		Article article = articleService.getArticle(id);

		if (article == null) {
			ResultData.from("F-1", Ut.f("%d번 게시물이 존재하지 않습니다.", id));
		}

		articleService.modifyArticle(id, title, body);

		return ResultData.from("S-1", Ut.f("%d번 게시물을 수정하였습니다.", id), id);
	}

}
