/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.wordbook.dao;


import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zopsen.wordbook.entity.WordBook;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * 典型案例DAO接口
 * @author 吴亚东
 * @version 2016-05-31
 */
@MyBatisDao
public interface WordBookDao {

    WordBook get( @Param(value="key") String key);
    List<WordBook> getlist(@Param(value="key") String key);

}