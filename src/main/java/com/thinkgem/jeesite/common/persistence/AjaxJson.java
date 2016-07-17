package com.thinkgem.jeesite.common.persistence;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.SimplePropertyPreFilter;

import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

/**
 * 返回前台的JSON
 *
 * @author RebelZhang
 */
public class AjaxJson {

    private boolean success = true;// 是否成功
    private String msg = "";// 提示信息
    private Object obj = null;// 其他信息
    private String returnFields; //返回属性
    private Map<String, Object> attributes;// 其他参数

    public Map<String, Object> getAttributes() {
        return attributes;
    }

    public void setAttributes(Map<String, Object> attributes) {
        this.attributes = attributes;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Object getObj() {
        return obj;
    }

    public void setObj(Object obj) {
        this.obj = obj;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public String getReturnFields() {
        return returnFields;
    }

    public void setReturnFields(String returnFields) {
        this.returnFields = returnFields;
    }

    public String getJsonStr(boolean useSpp,SimplePropertyPreFilter spp) {
        JSONObject obj = new JSONObject();
        obj.put("success", this.isSuccess());
        obj.put("msg", this.getMsg());
        if(useSpp) {
            String objStr = JSON.toJSONString(this.obj, spp);
            Object newObj = JSON.parse(objStr);
            obj.put("obj", newObj);
        } else {
            obj.put("obj", this.obj);
        }
        obj.put("attributes", this.attributes);
        return obj.toJSONString();
    }

    /**
     * 直接输出为application/json
     *
     * @param httpServletResponse
     */
    public void outFlushJson(HttpServletResponse httpServletResponse) throws IOException {
        String jsonStr = null;
        if (returnFields != null) {
            String[] args = returnFields.split(",");
            SimplePropertyPreFilter spp = new SimplePropertyPreFilter(args);
            jsonStr = getJsonStr(true,spp);
        } else {
            jsonStr = getJsonStr(false,null);
        }
        httpServletResponse.setContentType("application/json");
        PrintWriter out = null;
        out = httpServletResponse.getWriter();
        out.println(jsonStr);
        out.flush();
        out.close();
    }

}
