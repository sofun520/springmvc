package cn.springmvc.service;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacOrder;

public interface JhacOrderService extends BaseService<JhacOrder> {

	List<JhacOrder> unionQuery(Map<String, Object> map);

}
