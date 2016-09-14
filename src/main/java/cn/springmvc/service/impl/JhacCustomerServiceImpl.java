package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacCustomerMapper;
import cn.springmvc.model.JhacCustomer;
import cn.springmvc.service.JhacCustomerService;

@Service
public class JhacCustomerServiceImpl implements JhacCustomerService {

	@Autowired
	private JhacCustomerMapper dao;

	public void insert(JhacCustomer t) {
		dao.insert(t);
	}

	public void update(JhacCustomer t) {
		dao.update(t);
	}

	public List<JhacCustomer> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacCustomer find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
