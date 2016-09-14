package cn.springmvc.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.springmvc.dao.JhacCompanyMapper;
import cn.springmvc.model.JhacCompany;
import cn.springmvc.service.JhacCompanyService;

@Service
public class JhacCompanyServiceImpl implements JhacCompanyService {

	@Autowired
	private JhacCompanyMapper dao;

	public void insert(JhacCompany t) {
		dao.insert(t);
	}

	public void update(JhacCompany t) {
		dao.update(t);
	}

	public List<JhacCompany> query(Map<String, Object> map) {
		return dao.query(map);
	}

	public void delete(Integer id) {
		dao.delete(id);
	}

	public JhacCompany find(Integer id) {
		return dao.find(id);
	}

	public int count(Map<String, Object> map) {
		return dao.count(map);
	}

}
