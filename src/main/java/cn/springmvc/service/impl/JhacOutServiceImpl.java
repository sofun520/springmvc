package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacOutMapper;
import cn.springmvc.model.JhacOut;
import cn.springmvc.model.Tongji;
import cn.springmvc.service.JhacOutService;

@Service
public class JhacOutServiceImpl implements JhacOutService {

	@Autowired
	private JhacOutMapper dao;

	public void insert(JhacOut t) {
		dao.insert(t);
	}

	public void update(JhacOut t) {
		dao.update(t);
	}

	public List<JhacOut> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacOut find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public List<Tongji> companySale(Map<String, Object> map) {
		return dao.companySale(map);
	}

	public List<Tongji> networkSale(Map<String, Object> map) {
		return dao.networkSale(map);
	}

	public List<Tongji> carclassSale(Map<String, Object> map) {
		return dao.carclassSale(map);
	}

	public List<JhacOut> monthSale(Map<String, Object> map) {
		return dao.monthSale(map);
	}

}
