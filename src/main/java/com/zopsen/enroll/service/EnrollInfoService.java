/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.enroll.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.zopsen.enroll.dao.EnrollInfoDao;
import com.zopsen.enroll.entity.EnrollInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * 面试管理Service
 * @author RebelZhang
 * @version 2016-05-12
 */
@Service
@Transactional(readOnly = true)
public class EnrollInfoService extends CrudService<EnrollInfoDao, EnrollInfo> {

	@Autowired
	private EnrollInfoDao enrollInfoDao;

	public EnrollInfo get(String id) {
		return super.get(id);
	}
	
	public List<EnrollInfo> findList(EnrollInfo enrollInfo) {
		return super.findList(enrollInfo);
	}
	
	public Page<EnrollInfo> findPage(Page<EnrollInfo> page, EnrollInfo enrollInfo) {
		return super.findPage(page, enrollInfo);
	}
	
	@Transactional(readOnly = false)
	public void save(EnrollInfo enrollInfo) {
		super.save(enrollInfo);
	}
	
	@Transactional(readOnly = false)
	public void delete(EnrollInfo enrollInfo) {
		super.delete(enrollInfo);
	}

	public List<EnrollInfo> findByMianshijieguo(EnrollInfo enrollInfo){
		return enrollInfoDao.findByMianshijieguo(enrollInfo);
	}


	
}