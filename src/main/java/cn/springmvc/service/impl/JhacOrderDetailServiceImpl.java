package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacOrderDetailMapper;
import cn.springmvc.model.JhacOrderDetail;
import cn.springmvc.service.JhacOrderDetailService;

@Service
public class JhacOrderDetailServiceImpl implements JhacOrderDetailService {

	@Autowired
	private JhacOrderDetailMapper dao;

	public void insert(JhacOrderDetail t) {
		dao.insert(t);
	}

	public void update(JhacOrderDetail t) {
		dao.update(t);
	}

	public List<JhacOrderDetail> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacOrderDetail find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
