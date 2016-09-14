package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.springmvc.model.JhacCompany;
import cn.springmvc.model.JhacGroup;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacCompanyService;
import cn.springmvc.service.JhacGroupService;
import cn.springmvc.util.SessionUtil;

@Controller
public class CompanyController {

	@Autowired
	private JhacCompanyService service;

	@Autowired
	private JhacGroupService groupService;

	@RequestMapping("/mvc/company/query")
	public ModelAndView query(HttpServletRequest request, JhacCompany company) {
		Map<String, Object> map = new HashMap<String, Object>();
		List<JhacGroup> groupList = groupService.query(map);
		String groupId = request.getParameter("groupId");

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("groupId", groupId);
		map.put("networkCode", user.getuNetworkCode());

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacCompany> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		// context.put("company", company);
		context.put("groupList", groupList);
		context.put("groupId", groupId);
		context.put("page", page);
		return new ModelAndView("company/query", context);
	}

	@RequestMapping("/mvc/company/save")
	public ModelAndView save(HttpServletRequest request, JhacCompany company) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		if (!StringUtils.isEmpty(company.getComId())) {
			company.setComUpdateId(user.getuId());
			service.update(company);
		} else {
			company.setComNetworkCode(user.getuNetworkCode());
			company.setComAddId(user.getuId());
			company.setComUpdateId(user.getuId());
			service.insert(company);
		}
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/api/company/query")
	@ResponseBody
	public JSONObject apiQuery(HttpServletRequest request, JhacCompany company) {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("groupId", request.getParameter("groupId"));
		List<JhacCompany> list = service.query(map);
		data.put("data", list);
		return data;
	}

}
