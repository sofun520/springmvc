package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacCompany;
import cn.springmvc.model.JhacOut;
import cn.springmvc.model.JhacUser;
import cn.springmvc.model.Tongji;
import cn.springmvc.service.JhacCompanyService;
import cn.springmvc.service.JhacOutService;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONObject;

@Controller
public class OutinfoController {

	@Autowired
	private JhacOutService service;

	@Autowired
	private JhacCompanyService comService;

	@RequestMapping("/mvc/outinfo/query")
	public ModelAndView query(HttpServletRequest request, JhacOut out) {

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("networkCode", user.getuNetworkCode());
		List<JhacCompany> comList = comService.query(map);

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		out.setoNetwork(user.getuNetworkCode());
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("out", out);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacOut> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("out", out);
		context.put("comList", comList);
		context.put("page", page);

		return new ModelAndView("outinfo/query", context);
	}

	@RequestMapping(value = "/api/outinfo/companySale", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject companySale(HttpServletRequest request, JhacOut out) {
		JSONObject data = new JSONObject();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String network = request.getParameter("network");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("network", network);
		List<Tongji> list = service.companySale(map);
		data.put("data", list);
		return data;
	}

	@RequestMapping(value = "/api/outinfo/networkSale", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject networkSale(HttpServletRequest request, JhacOut out) {
		JSONObject data = new JSONObject();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		List<Tongji> list = service.networkSale(map);
		data.put("data", list);
		return data;
	}

	@RequestMapping(value = "/api/outinfo/carclassSale", method = RequestMethod.GET)
	@ResponseBody
	public JSONObject carclassSale(HttpServletRequest request, JhacOut out) {
		JSONObject data = new JSONObject();
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String network = request.getParameter("network");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startDate", startDate);
		map.put("endDate", endDate);
		map.put("network", network);
		List<Tongji> list = service.carclassSale(map);
		data.put("data", list);
		return data;
	}

}
