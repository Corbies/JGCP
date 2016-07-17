package com.zopsen.jgj.ids.dao;

import com.thinkgem.jeesite.common.persistence.annotation.MyBatisDao;
import com.zopsen.jgj.ids.entity.Ids;

import java.util.List;

/**
 * Created by Corbie on 2016/6/17.
 */
@MyBatisDao
public interface jgjIdsDao {

        Ids getIdsById(Ids ids);
         Ids getIdsById(int id);
        List<Ids> getListAll();
        void delete(int id);
        void insert(Ids ids);

}
