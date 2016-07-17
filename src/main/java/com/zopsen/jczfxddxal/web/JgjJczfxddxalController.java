/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.jczfxddxal.web;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.web.BaseController;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.zopsen.jczfxddxal.entity.JgjJczfxddxal;
import com.zopsen.jczfxddxal.service.JgjJczfxddxalService;

/**
 * 典型案例Controller
 * @author 吴亚东
 * @version 2016-05-31
 */
@Controller
@RequestMapping(value = "${adminPath}/jczfxddxal/jgjJczfxddxal")
public class JgjJczfxddxalController extends BaseController {

	@Autowired
	private JgjJczfxddxalService jgjJczfxddxalService;
	
	@ModelAttribute
	public JgjJczfxddxal get(@RequestParam(required=false) String id) {
		JgjJczfxddxal entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = jgjJczfxddxalService.get(id);
		}
		if (entity == null){
			entity = new JgjJczfxddxal();
		}
		return entity;
	}
	
	@RequiresPermissions("jczfxddxal:jgjJczfxddxal:view")
	@RequestMapping(value = {"list", ""})
	public String list(JgjJczfxddxal jgjJczfxddxal, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<JgjJczfxddxal> page = jgjJczfxddxalService.findPage(new Page<JgjJczfxddxal>(request, response), jgjJczfxddxal); 
		model.addAttribute("page", page);
		return "zopsen/jczfxddxal/jgjJczfxddxalList";
	}

	@RequiresPermissions("jczfxddxal:jgjJczfxddxal:view")
	@RequestMapping(value = "form")
	public String form(JgjJczfxddxal jgjJczfxddxal, Model model) {
		model.addAttribute("jgjJczfxddxal", jgjJczfxddxal);
		return "zopsen/jczfxddxal/jgjJczfxddxalForm";
	}

	@RequiresPermissions("jczfxddxal:jgjJczfxddxal:edit")
	@RequestMapping(value = "save")
	public String save(JgjJczfxddxal jgjJczfxddxal, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, jgjJczfxddxal)){
			return form(jgjJczfxddxal, model);
		}
		jgjJczfxddxalService.save(jgjJczfxddxal);
		addMessage(redirectAttributes, "保存检测中发现的典型案例成功");
		return "redirect:"+Global.getAdminPath()+"/jczfxddxal/jgjJczfxddxal/?repage";
	}
	
	@RequiresPermissions("jczfxddxal:jgjJczfxddxal:edit")
	@RequestMapping(value = "delete")
	public String delete(JgjJczfxddxal jgjJczfxddxal, RedirectAttributes redirectAttributes) {
		jgjJczfxddxalService.delete(jgjJczfxddxal);
		addMessage(redirectAttributes, "删除检测中发现的典型案例成功");
		return "redirect:"+Global.getAdminPath()+"/jczfxddxal/jgjJczfxddxal/?repage";
	}

}