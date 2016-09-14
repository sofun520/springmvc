package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacProductMapper;
import cn.springmvc.model.JhacProduct;
import cn.springmvc.model.Kucunliang;
import cn.springmvc.service.JhacProductService;

@Service
public class JhacProductServiceImpl implements JhacProductService {

	@Autowired
	private JhacProductMapper dao;

	public void insert(JhacProduct t) {
		dao.insert(t);
	}

	public void update(JhacProduct t) {
		dao.update(t);
	}

	public List<JhacProduct> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacProduct find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public List<Kucunliang> kucunliang(Map<String, Object> map) {
		return dao.kucunliang(map);
	}

	public void peihuoPc(Map<String, Object> map) {
		dao.peihuoPc(map);
	}

	public void useByMap(Map<String, Object> map) {
		dao.useByMap(map);
	}

	public List<JhacProduct> fahuodan(Map<String, Object> map) {
		return dao.fahuodan(map);
	}

}
