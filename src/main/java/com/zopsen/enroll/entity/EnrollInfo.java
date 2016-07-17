/**
 * Copyright &copy; 2012-2014 <a href="https://github.com/thinkgem/jeesite">JeeSite</a> All rights reserved.
 */
package com.zopsen.enroll.entity;

import org.hibernate.validator.constraints.Length;

import com.thinkgem.jeesite.common.persistence.DataEntity;

/**
 * 面试管理Entity
 * @author RebelZhang
 * @version 2016-05-12
 */
public class EnrollInfo extends DataEntity<EnrollInfo> {
	
	private static final long serialVersionUID = 1L;
	private String xingming;		// 姓名
	private String zhunkaozhenghao;		// 准考证号
	private String zhongkaochengji;		// 中考成绩
	private String shifoushengneikaosheng;		// 是否省内考生
	private String shenfenzhenghao;		// 身份证号
	private String hujisuozaidi;		// 户籍所在地
	private String hujileibie;		// 户籍类别
	private String jiachanglianxidianhua;		// 家长联系电话
	private String chuzhongbiyexuexiao;		// 初中毕业学校
	private String baokaozhuanye1;		// 报考专业1
	private String baokaozhuanye2;		// 报考专业2
	private String mianshijieguo;		// 面试结果
	private String zhaopian;		// zhaopian
	
	public EnrollInfo() {
		super();
	}

	public EnrollInfo(String id){
		super(id);
	}

	@Length(min=0, max=200, message="姓名长度必须介于 0 和 200 之间")
	public String getXingming() {
		return xingming;
	}

	public void setXingming(String xingming) {
		this.xingming = xingming;
	}
	
	@Length(min=0, max=200, message="准考证号长度必须介于 0 和 200 之间")
	public String getZhunkaozhenghao() {
		return zhunkaozhenghao;
	}

	public void setZhunkaozhenghao(String zhunkaozhenghao) {
		this.zhunkaozhenghao = zhunkaozhenghao;
	}
	
	@Length(min=0, max=200, message="中考成绩长度必须介于 0 和 200 之间")
	public String getZhongkaochengji() {
		return zhongkaochengji;
	}

	public void setZhongkaochengji(String zhongkaochengji) {
		this.zhongkaochengji = zhongkaochengji;
	}
	
	@Length(min=0, max=200, message="是否省内考生长度必须介于 0 和 200 之间")
	public String getShifoushengneikaosheng() {
		return shifoushengneikaosheng;
	}

	public void setShifoushengneikaosheng(String shifoushengneikaosheng) {
		this.shifoushengneikaosheng = shifoushengneikaosheng;
	}
	
	@Length(min=0, max=200, message="身份证号长度必须介于 0 和 200 之间")
	public String getShenfenzhenghao() {
		return shenfenzhenghao;
	}

	public void setShenfenzhenghao(String shenfenzhenghao) {
		this.shenfenzhenghao = shenfenzhenghao;
	}
	
	@Length(min=0, max=200, message="户籍所在地长度必须介于 0 和 200 之间")
	public String getHujisuozaidi() {
		return hujisuozaidi;
	}

	public void setHujisuozaidi(String hujisuozaidi) {
		this.hujisuozaidi = hujisuozaidi;
	}
	
	@Length(min=0, max=200, message="户籍类别长度必须介于 0 和 200 之间")
	public String getHujileibie() {
		return hujileibie;
	}

	public void setHujileibie(String hujileibie) {
		this.hujileibie = hujileibie;
	}
	
	@Length(min=0, max=200, message="家长联系电话长度必须介于 0 和 200 之间")
	public String getJiachanglianxidianhua() {
		return jiachanglianxidianhua;
	}

	public void setJiachanglianxidianhua(String jiachanglianxidianhua) {
		this.jiachanglianxidianhua = jiachanglianxidianhua;
	}
	
	@Length(min=0, max=200, message="初中毕业学校长度必须介于 0 和 200 之间")
	public String getChuzhongbiyexuexiao() {
		return chuzhongbiyexuexiao;
	}

	public void setChuzhongbiyexuexiao(String chuzhongbiyexuexiao) {
		this.chuzhongbiyexuexiao = chuzhongbiyexuexiao;
	}
	
	@Length(min=0, max=200, message="报考专业1长度必须介于 0 和 200 之间")
	public String getBaokaozhuanye1() {
		return baokaozhuanye1;
	}

	public void setBaokaozhuanye1(String baokaozhuanye1) {
		this.baokaozhuanye1 = baokaozhuanye1;
	}
	
	@Length(min=0, max=200, message="报考专业2长度必须介于 0 和 200 之间")
	public String getBaokaozhuanye2() {
		return baokaozhuanye2;
	}

	public void setBaokaozhuanye2(String baokaozhuanye2) {
		this.baokaozhuanye2 = baokaozhuanye2;
	}
	
	@Length(min=0, max=200, message="面试结果长度必须介于 0 和 200 之间")
	public String getMianshijieguo() {
		return mianshijieguo;
	}

	public void setMianshijieguo(String mianshijieguo) {
		this.mianshijieguo = mianshijieguo;
	}
	
	@Length(min=0, max=255, message="zhaopian长度必须介于 0 和 255 之间")
	public String getZhaopian() {
		return zhaopian;
	}

	public void setZhaopian(String zhaopian) {
		this.zhaopian = zhaopian;
	}
	
}