/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.wordbook.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 典型案例Entity
 * @author 吴亚东
 * @version 2016-05-31
 */
public class WordBook extends DataEntity<WordBook> {
	private static final long serialVersionUID = 1L;
	private String	WordBook_KEY;
	private  String WordBook_VALUE;

	public String getWordBook_KEY() {
		return WordBook_KEY;
	}

	public void setWordBook_KEY(String wordBook_KEY) {
		WordBook_KEY = wordBook_KEY;
	}

	public String getWordBook_VALUE() {
		return WordBook_VALUE;
	}

	public void setWordBook_VALUE(String wordBook_VALUE) {
		WordBook_VALUE = wordBook_VALUE;
	}

	@Override
	public String toString() {
		return "WordBook{" +
				"WordBook_KEY='" + WordBook_KEY + '\'' +
				", WordBook_VALUE='" + WordBook_VALUE + '\'' +
				'}';
	}
}