package com.zopsen.bhgjcpfbb.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.zopsen.bhgjcpfbb.service.JgjBhgjyfbbService;
import com.zopsen.bhgjcpfbb.entity.JgjBhgjyfbb;


import com.zopsen.wordbook.entity.WordBook;
import com.zopsen.wordbook.service.WordBookService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by Corbie on 2016/6/1.
 */
@Controller
@RequestMapping(value = "${adminPath}/bhgjyfbb/jgjbhgjyfbb")
public class JgjBhgjyfbbController extends BaseController {

    @Autowired
    private JgjBhgjyfbbService jgjBhgjyfbbService;

    @Autowired
    private WordBookService wordBookService;

    public JgjBhgjyfbb get(@RequestParam(required=false) String id ,@RequestParam(required=false) String lb) {
        JgjBhgjyfbb entity = null;
        if (StringUtils.isNotBlank(id)){
            entity = jgjBhgjyfbbService.get(id);
        }
        if (entity == null){
            entity = new JgjBhgjyfbb();
            if (StringUtils.isNotBlank(lb)){
                entity.setLb(lb);
            }

        }
        return entity;
    }
  //  @RequiresPermissions("bhgjyfbb:jgjJczfxddxal:view")
    @RequestMapping(value = {"list", ""})
    public String list(JgjBhgjyfbb jgjbhgjyfbb, HttpServletRequest request, HttpServletResponse response, Model model) {
        jgjbhgjyfbb.setLb("ld");
        jgjbhgjyfbb.setIds("jsoli");
        Page<JgjBhgjyfbb> page= jgjBhgjyfbbService.findPage(new Page<JgjBhgjyfbb>(request, response),jgjbhgjyfbb);
        model.addAttribute("page", page);
        model.addAttribute("lb",jgjbhgjyfbb.getLb());
//        List<JgjBhgjyfbb> list=jgjBhgjyfbbService.findList(jgjbhgjyfbb);
//        model.addAttribute("list", list);
        return "zopsen/bhgjypfbb/jgjbhgjypfbbList";//E:\idea\zopsenFramework-dev\src\main\webapp\WEB-INF\views\zopsen\bhgjypfbb\jgjbhgjypfbbList.jsp
    }

    @RequiresPermissions("bhgjyfbb:jgjbhgjyfbb:view")
    @RequestMapping(value = "form")
    public String form(JgjBhgjyfbb jgjbhgjyfbb, Model model) {
        System.out.println(jgjbhgjyfbb.getLb());
        List<WordBook> wordBooks=wordBookService.getbhgjcxm(jgjbhgjyfbb.getLb());
        model.addAttribute("wordbooks",wordBooks);
        model.addAttribute("jgjbhgjyfbb", jgjbhgjyfbb);
        return "zopsen/bhgjypfbb/jgjbhgjypfbbForm";
    }

    @RequiresPermissions("bhgjyfbb:jgjbhgjyfbb:edit")
    @RequestMapping(value = "save")
    public String save(JgjBhgjyfbb jgjbhgjyfbb, Model model, RedirectAttributes redirectAttributes) {
        if (!beanValidator(model, jgjbhgjyfbb)){
            return form(jgjbhgjyfbb, model);
        }
        jgjBhgjyfbbService.save(jgjbhgjyfbb);
        addMessage(redirectAttributes, "保存不合格检验分布成功");
        return "redirect:"+ Global.getAdminPath()+"/bhgjyfbb/jgjbhgjyfbb/list?lb="+jgjbhgjyfbb.getLb()+"";
    }

    @RequiresPermissions("bhgjyfbb:jgjbhgjyfbb:edit")
    @RequestMapping(value = "delete")
    public String delete(JgjBhgjyfbb jgjbhgjyfbb, RedirectAttributes redirectAttributes) {
        jgjBhgjyfbbService.delete(jgjbhgjyfbb);
        addMessage(redirectAttributes, "删除不合格检验分布成功");
        return "redirect:"+Global.getAdminPath()+"/bhgjypfbb/jgjbhgjypfbb/?repage";
    }

}
