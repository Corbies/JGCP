package com.zopsen.bhgjcpfbb.entity;

import com.thinkgem.jeesite.common.persistence.DataEntity;
import org.hibernate.validator.constraints.Length;

/**
 * 典型案例Entity
 * @author 吴亚东
 * @version 2016-05-31
 */
public class JgjBhgjyfbb extends DataEntity<JgjBhgjyfbb> {

    private static final long serialVersionUID = 1L;
    private String cpmc;		// 产品名称
    private String lb;		// 产品类别
    private String cpbz;		// 产品标准
    private String ggxh;		// 规格型号
    private String clxndj;		// 材料性能等级
    private String ph;		// 批号
    private String jcbz;		// 检测标准
    private String scqylb;		// 生产企业类别
    private String bhgjcxm;		// 不合格检测项目
    private String bhgjb;		// 不合格级别
    private String bz;		// 备注
    private String ids;		// ids_ids

    public JgjBhgjyfbb() {
        super();
    }

    public JgjBhgjyfbb(String id){
        super(id);
    }

    public String getLb() {
        return lb;
    }

    public void setLb(String lb) {
        this.lb = lb;
    }

    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getCpmc() {
        return cpmc;
    }

    public void setCpmc(String cpmc) {
        this.cpmc = cpmc;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getCpbz() {
        return cpbz;
    }

    public void setCpbz(String cpbz) {
        this.cpbz = cpbz;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getGgxh() {
        return ggxh;
    }

    public void setGgxh(String ggxh) {
        this.ggxh = ggxh;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getClxndj() {
        return clxndj;
    }

    public void setClxndj(String clxndj) {
        this.clxndj = clxndj;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getPh() {
        return ph;
    }

    public void setPh(String ph) {
        this.ph = ph;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getJcbz() {
        return jcbz;
    }

    public void setJcbz(String jcbz) {
        this.jcbz = jcbz;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getScqylb() {
        return scqylb;
    }

    public void setScqylb(String scqylb) {
        this.scqylb = scqylb;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getBhgjcxm() {
        return bhgjcxm;
    }

    public void setBhgjcxm(String bhgjcxm) {
        this.bhgjcxm = bhgjcxm;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getBhgjb() {
        return bhgjb;
    }

    public void setBhgjb(String bhgjb) {
        this.bhgjb = bhgjb;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getBz() {
        return bz;
    }

    public void setBz(String bz) {
        this.bz = bz;
    }
    @Length(min=0, max=255, message="长度必须介于 0 和 255 之间")
    public String getIds() {
        return ids;
    }

    public void setIds(String ids) {
        this.ids = ids;
    }
}
