/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.jczfxddxal.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 典型案例Entity
 * @author 吴亚东
 * @version 2016-05-31
 */
public class JgjJczfxddxal extends DataEntity<JgjJczfxddxal> {
	
	private static final long serialVersionUID = 1L;
	private String syjbxx;		// 试样基本信息
	private String zlxx;		// 质量现象
	private String yyfxycl;		// 原因分析与处理
	private String idsIds;		// ids_ids
	
	public JgjJczfxddxal() {
		super();
	}

	public JgjJczfxddxal(String id){
		super(id);
	}

	@Length(min=0, max=255, message="试样基本信息长度必须介于 0 和 255 之间")
	public String getSyjbxx() {
		return syjbxx;
	}

	public void setSyjbxx(String syjbxx) {
		this.syjbxx = syjbxx;
	}
	
	@Length(min=0, max=255, message="质量现象长度必须介于 0 和 255 之间")
	public String getZlxx() {
		return zlxx;
	}

	public void setZlxx(String zlxx) {
		this.zlxx = zlxx;
	}
	
	@Length(min=0, max=255, message="原因分析与处理长度必须介于 0 和 255 之间")
	public String getYyfxycl() {
		return yyfxycl;
	}

	public void setYyfxycl(String yyfxycl) {
		this.yyfxycl = yyfxycl;
	}
	
	@Length(min=0, max=255, message="ids_ids长度必须介于 0 和 255 之间")
	public String getIdsIds() {
		return idsIds;
	}

	public void setIdsIds(String idsIds) {
		this.idsIds = idsIds;
	}
	
}