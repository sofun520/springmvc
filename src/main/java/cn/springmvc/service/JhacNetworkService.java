package cn.springmvc.service;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacNetwork;

public interface JhacNetworkService extends BaseService<JhacNetwork> {

	List<JhacNetwork> notCreateSaas(Map<String, Object> map);

}
