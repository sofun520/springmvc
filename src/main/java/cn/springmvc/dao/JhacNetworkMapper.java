package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacNetwork;

public interface JhacNetworkMapper extends BaseMapper<JhacNetwork> {

	List<JhacNetwork> notCreateSaas(Map<String, Object> map);
}