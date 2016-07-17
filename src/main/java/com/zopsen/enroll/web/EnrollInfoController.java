/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.enroll.web;

import com.thinkgem.jeesite.common.config.Global;
import com.thinkgem.jeesite.common.persistence.Page;
import com.thinkgem.jeesite.common.utils.StringUtils;
import com.thinkgem.jeesite.common.web.BaseController;
import com.zopsen.enroll.entity.EnrollInfo;
import com.zopsen.enroll.service.EnrollInfoService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 面试管理Controller
 * @author RebelZhang
 * @version 2016-05-12
 */
@Controller
@RequestMapping(value = "${adminPath}/enroll/enrollInfo")
public class EnrollInfoController extends BaseController {

	@Autowired
	private EnrollInfoService enrollInfoService;

	@ModelAttribute
	public EnrollInfo get(@RequestParam(required=false) String id) {
		EnrollInfo entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = enrollInfoService.get(id);
		}
		if (entity == null){
			entity = new EnrollInfo();
		}
		return entity;
	}
	
	@RequiresPermissions("enroll:enrollInfo:view")
	@RequestMapping(value = {"list", ""})
	public String list(EnrollInfo enrollInfo, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<EnrollInfo> page = enrollInfoService.findPage(new Page<EnrollInfo>(request, response), enrollInfo); 
		model.addAttribute("page", page);
		return "zopsen/enroll/enrollInfoList";
	}

	@RequiresPermissions("enroll:enrollInfo:view")
	@RequestMapping(value = "form")
	public String form(EnrollInfo enrollInfo, Model model) {
		model.addAttribute("enrollInfo", enrollInfo);
		return "zopsen/enroll/enrollInfoForm";
	}

	@RequiresPermissions("enroll:enrollInfo:edit")
	@RequestMapping(value = "save")
	public String save(EnrollInfo enrollInfo, Model model, RedirectAttributes redirectAttributes) {
		if (!beanValidator(model, enrollInfo)){
			return form(enrollInfo, model);
		}
		enrollInfoService.save(enrollInfo);
		addMessage(redirectAttributes, "保存面试信息成功");
		return "redirect:"+Global.getAdminPath()+"/enroll/enrollInfo/?repage";
	}
	
	@RequiresPermissions("enroll:enrollInfo:edit")
	@RequestMapping(value = "delete")
	public String delete(EnrollInfo enrollInfo, RedirectAttributes redirectAttributes) {
		enrollInfoService.delete(enrollInfo);
		addMessage(redirectAttributes, "删除面试信息成功");
		return "redirect:"+Global.getAdminPath()+"/enroll/enrollInfo/?repage";
	}

}