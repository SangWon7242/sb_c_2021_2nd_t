package com.psw.exam.demo.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.psw.exam.demo.repository.ArticleRepository;
import com.psw.exam.demo.util.Ut;
import com.psw.exam.demo.vo.Article;
import com.psw.exam.demo.vo.ResultData;

@Service
public class ArticleService {
	private ArticleRepository articleRepository;

	public ArticleService(ArticleRepository articleRepository) {
		this.articleRepository = articleRepository;
	}

	public List<Article> getArticles() {
		return articleRepository.getArticles();
	}

	public ResultData<Integer> writeArticle(int memberId, String title, String body) {
		articleRepository.writeArticle(memberId, title, body);
		int id = articleRepository.getLastInsertId();
		
		return ResultData.from("S-1", Ut.f("%d번 게시물이 생성되었습니다.", id), "id", id);
	}

	public Article getArticle(int id) {
		return articleRepository.getArticle(id);
	}

	public void deleteArticle(int id) {
		articleRepository.deleteArticle(id);
	}

	public ResultData<Article> modifyArticle(int id, String title, String body) {
		
		articleRepository.modifyArticle(id, title, body);
		
		Article article = getArticle(id);
		
		return ResultData.from("S-1", Ut.f("%번 게시물이 수정되었습니다.", id), "article", article);
	}

	public ResultData actorCanModify(int actorId, Article article) {
		
		if (article == null) {
			return ResultData.from("F-1", "게시물이 존재하지 않습니다.");
		}
		
		if (article.getMemberId() != actorId) {
			return ResultData.from("F-2", "권한이 없습니다.");
		}
		
		return ResultData.from("S-1", "게시물이 가능합니다.");
	}


}
