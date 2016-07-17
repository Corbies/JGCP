/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.enroll.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zopsen.enroll.entity.EnrollInfo;

import java.util.List;

/**
 * 面试管理DAO接口
 * @author RebelZhang
 * @version 2016-05-12
 */
@MyBatisDao
public interface EnrollInfoDao extends CrudDao<EnrollInfo> {

    List<EnrollInfo> findByMianshijieguo(EnrollInfo enrollInfo);
}