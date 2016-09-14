package cn.springmvc.controller;

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
import cn.springmvc.model.JhacOut;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacCompanyService;
import cn.springmvc.service.JhacOutService;
import cn.springmvc.util.SessionUtil;

@Controller
public class ReportController {

	@Autowired
	private JhacOutService service;

	@Autowired
	private JhacCompanyService comService;

	@RequestMapping("/mvc/reportLocal/query")
	public ModelAndView query(HttpServletRequest request, JhacCarclass carclass) {
		return new ModelAndView("report/local");
	}

	@RequestMapping("/mvc/reportLocal/statistics")
	public ModelAndView statistics(HttpServletRequest request,
			JhacCarclass carclass) {
		Map<String, Object> context = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		map.put("networkCode", user.getuNetworkCode());
		List<JhacCompany> list = comService.query(map);

		context.put("comList", list);

		return new ModelAndView("report/statistics", context);
	}

	@RequestMapping("/mvc/reportLocal/monthSale")
	public ModelAndView monthSale(HttpServletRequest request,
			JhacCarclass carclass) {
		Map<String, Object> context = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		String year = request.getParameter("year");
		String month = request.getParameter("month");
		String address = request.getParameter("address");

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		map.put("networkCode", user.getuNetworkCode());
		map.put("year", year);
		map.put("month", month);
		map.put("address", address);

		List<JhacOut> list = service.monthSale(map);
		context.put("list", list);
		context.put("networkCode", user.getuNetworkCode());
		context.put("networkName", user.getNetwork());
		context.put("year", year);
		context.put("month", month);
		context.put("user", user);

		return new ModelAndView("report/monthSale", context);
	}

	@RequestMapping("/mvc/reportCorporation/query")
	public ModelAndView reportCorporation(HttpServletRequest request,
			JhacCarclass carclass) {
		return new ModelAndView("report/corporation");
	}

}
