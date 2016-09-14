package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacOrder;

public interface JhacOrderMapper extends BaseMapper<JhacOrder> {

	List<JhacOrder> unionQuery(Map<String, Object> map);
}