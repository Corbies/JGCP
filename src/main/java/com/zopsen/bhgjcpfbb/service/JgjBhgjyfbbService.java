package com.zopsen.bhgjcpfbb.service;

import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.service.CrudService;
import com.zopsen.bhgjcpfbb.dao.JgjBhgjyfbbDao;
import com.zopsen.bhgjcpfbb.entity.JgjBhgjyfbb;
import com.zopsen.jczfxddxal.entity.JgjJczfxddxal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * Created by Corbie on 2016/6/1.
 */
@Service
@Transactional(readOnly = true)
public class JgjBhgjyfbbService extends CrudService<JgjBhgjyfbbDao,JgjBhgjyfbb>{

    public JgjBhgjyfbb get(String id) {
        JgjBhgjyfbb JgjBhgjyfbb = super.get(id);
        return JgjBhgjyfbb;
    }

    public List<JgjBhgjyfbb> findList(JgjBhgjyfbb JgjBhgjyfbb) {
        return super.findList(JgjBhgjyfbb);
    }

    public Page<JgjBhgjyfbb> findPage(Page<JgjBhgjyfbb> page, JgjBhgjyfbb JgjBhgjyfbb) {
        return super.findPage(page, JgjBhgjyfbb);
    }

    @Transactional(readOnly = false)
    public void save(JgjBhgjyfbb JgjBhgjyfbb) {
        super.save(JgjBhgjyfbb);
    }

    @Transactional(readOnly = false)
    public void delete(JgjBhgjyfbb JgjBhgjyfbb) {
        super.delete(JgjBhgjyfbb);
    }




}
