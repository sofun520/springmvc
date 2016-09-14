package cn.springmvc.service;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacEnum;

public interface JhacEnumService extends BaseService<JhacEnum> {

	List<JhacEnum> queryGroup(Map<String, Object> map);

}
