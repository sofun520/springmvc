package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacEnum;

public interface JhacEnumMapper extends BaseMapper<JhacEnum> {

	List<JhacEnum> queryGroup(Map<String, Object> map);
}