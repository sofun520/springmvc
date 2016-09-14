package cn.springmvc.dao;

import java.util.List;
import java.util.Map;

import cn.springmvc.model.JhacProduct;
import cn.springmvc.model.Kucunliang;

public interface JhacProductMapper extends BaseMapper<JhacProduct> {

	List<Kucunliang> kucunliang(Map<String, Object> map);

	void peihuoPc(Map<String, Object> map);

	void useByMap(Map<String, Object> map);

	List<JhacProduct> fahuodan(Map<String, Object> map);
}