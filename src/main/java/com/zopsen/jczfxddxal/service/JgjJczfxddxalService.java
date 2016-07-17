/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.jczfxddxal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zopsen.jczfxddxal.entity.JgjJczfxddxal;
import com.zopsen.jczfxddxal.dao.JgjJczfxddxalDao;

/**
 * 典型案例Service
 * @author 吴亚东
 * @version 2016-05-31
 */
@Service
@Transactional(readOnly = true)
public class JgjJczfxddxalService extends CrudService<JgjJczfxddxalDao, JgjJczfxddxal> {

	
	public JgjJczfxddxal get(String id) {
		JgjJczfxddxal jgjJczfxddxal = super.get(id);
		return jgjJczfxddxal;
	}
	
	public List<JgjJczfxddxal> findList(JgjJczfxddxal jgjJczfxddxal) {
		return super.findList(jgjJczfxddxal);
	}
	
	public Page<JgjJczfxddxal> findPage(Page<JgjJczfxddxal> page, JgjJczfxddxal jgjJczfxddxal) {
		return super.findPage(page, jgjJczfxddxal);
	}
	
	@Transactional(readOnly = false)
	public void save(JgjJczfxddxal jgjJczfxddxal) {
		super.save(jgjJczfxddxal);
	}
	
	@Transactional(readOnly = false)
	public void delete(JgjJczfxddxal jgjJczfxddxal) {
		super.delete(jgjJczfxddxal);
	}
	
}