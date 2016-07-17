/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.jgj_tree.dao;

import com.thinkgem.jeesite.common.persistence.CrudDao;
import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zopsen.jgj_tree.entity.JgjTree;

/**
 * treeDAO接口
 * @author 吴亚东
 * @version 2016-06-21
 */
@MyBatisDao
public interface JgjTreeDao extends CrudDao<JgjTree> {
	
}