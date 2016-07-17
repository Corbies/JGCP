/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.wordbook.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.zopsen.wordbook.dao.WordBookDao;
import com.zopsen.wordbook.entity.WordBook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 典型案例Service
 * @author 吴亚东
 * @version 2016-05-31
 */
@Service
@Transactional(readOnly = true)
public class WordBookService {

	@Autowired
	private  WordBookDao dao;

	public WordBook get(String key) {
		return dao.get(key);
	}
	public List<WordBook> getList(String key){
		return dao.getlist(key);
	}
	public List<WordBook> getbhgjcxm(String key){
		return dao.getlist(key+"bhgjcxm");
	}

	

	
}