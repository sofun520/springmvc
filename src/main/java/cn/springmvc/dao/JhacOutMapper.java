package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacOut;
import cn.springmvc.model.Tongji;

public interface JhacOutMapper extends BaseMapper<JhacOut> {

	List<Tongji> companySale(Map<String, Object> map);

	List<Tongji> networkSale(Map<String, Object> map);

	List<Tongji> carclassSale(Map<String, Object> map);

	List<JhacOut> monthSale(Map<String, Object> map);
}