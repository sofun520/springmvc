package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacOrderMapper;
import cn.springmvc.model.JhacOrder;
import cn.springmvc.service.JhacOrderService;

@Service
public class JhacOrderServiceImpl implements JhacOrderService {

	@Autowired
	private JhacOrderMapper dao;

	public void insert(JhacOrder t) {
		dao.insert(t);
	}

	public void update(JhacOrder t) {
		dao.update(t);
	}

	public List<JhacOrder> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacOrder find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

	public List<JhacOrder> unionQuery(Map<String, Object> map) {
		return dao.unionQuery(map);
	}

}
