package cn.springmvc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacCarclass;
import cn.springmvc.model.JhacCompany;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacCarclassService;
import cn.springmvc.service.JhacCompanyService;
import cn.springmvc.util.SessionUtil;

@Controller
public class CarclassController {

	@Autowired
	private JhacCarclassService service;

	@Autowired
	private JhacCompanyService comService;

	@RequestMapping("/mvc/carclass/query")
	public ModelAndView query(HttpServletRequest request, JhacCarclass carclass) {
		Map<String, Object> map = new HashMap<String, Object>();

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		String comId = request.getParameter("comId");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("networkCode", user.getuNetworkCode());
		map.put("comId", comId);

		List<JhacCompany> comList = comService.query(map);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacCarclass> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("comList", comList);
		context.put("comId", comId);
		context.put("page", page);
		return new ModelAndView("carclass/query", context);
	}

	@RequestMapping("/mvc/carclass/save")
	public ModelAndView save(HttpServletRequest request, JhacCarclass carclass) {
		String page = request.getParameter("page");
		String comId = request.getParameter("comId");
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		/*
		 * if (!StringUtils.isEmpty(carclass.getCcComId())) {
		 * carclass.setCcUpdateId(user.getuId()); carclass.setCcUpdateTime(new
		 * Date()); service.update(carclass); } else {
		 * carclass.setCcCreateId(user.getuId()); carclass.setCcCreateTime(new
		 * Date()); carclass.setCcNetworkCode(user.getuNetworkCode());
		 * service.insert(carclass); }
		 */
		carclass.setCcCreateId(user.getuId());
		carclass.setCcCreateTime(new Date());
		carclass.setCcNetworkCode(user.getuNetworkCode());
		service.insert(carclass);
		return new ModelAndView("redirect:query.do?page=" + page + "&comId="
				+ comId);
	}

	@RequestMapping("/mvc/carclass/delete")
	public ModelAndView delete(HttpServletRequest request, JhacCarclass carclass) {
		String page = request.getParameter("page");
		String comId = request.getParameter("comId");
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		carclass.setCcUpdateId(user.getuId());
		carclass.setCcUpdateTime(new Date());
		service.delete(Integer.parseInt(request.getParameter("id")));
		return new ModelAndView("redirect:query.do?page=" + page + "&comId="
				+ comId);
	}

}
