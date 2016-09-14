package cn.springmvc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacNetwork;
import cn.springmvc.model.JhacSaas;
import cn.springmvc.model.JhacSaasLog;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacNetworkService;
import cn.springmvc.service.JhacSaasLogService;
import cn.springmvc.service.JhacSaasService;
import cn.springmvc.service.MaxCodeService;
import cn.springmvc.util.DateUtils;
import cn.springmvc.util.SessionUtil;

import com.alibaba.fastjson.JSONObject;

@Controller
public class NetworkController {

	@Autowired
	private JhacNetworkService service;

	@Autowired
	private MaxCodeService maxCodeService;

	@Autowired
	private JhacSaasService saasService;

	@Autowired
	private JhacSaasLogService slService;

	@RequestMapping("/mvc/network/query")
	public ModelAndView query(HttpServletRequest request, JhacNetwork network) {
		Map<String, Object> map = new HashMap<String, Object>();

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("nCode", network.getnCode());
		map.put("nLeader", network.getnLeader());
		map.put("nLeaderTelphone", network.getnLeaderTelphone());
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacNetwork> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("network", network);
		context.put("page", page);

		return new ModelAndView("network/query", context);
	}

	@RequestMapping("/mvc/network/save")
	public ModelAndView save(HttpServletRequest request, JhacNetwork network) {
		if (!StringUtils.isEmpty(network.getnId())) {
			service.update(network);
		} else {
			/* 开通saas服务 */
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("prefix", "SA");
			map.put("xcode", "");
			maxCodeService.queryCode(map);
			String orderCode = (String) map.get("xcode");

			SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
			JhacUser user = su.getSession(request, "user");

			Date now = new Date();
			JhacSaasLog saaslog = new JhacSaasLog();
			saaslog.setSlTimeType("2");
			saaslog.setSlTimeNum(1);
			Date expireDate = DateUtils.calcDate(now, saaslog.getSlTimeType(),
					saaslog.getSlTimeNum());

			saaslog.setSlNewBegindate(now);
			saaslog.setSlNewExpiredate(expireDate);
			saaslog.setSlOldExpiredate(expireDate);
			saaslog.setSlOrder(orderCode);
			saaslog.setSlCreateId(user.getuId());
			saaslog.setSlCreateTime(new Date());
			saaslog.setSlReviewId(user.getuId());
			saaslog.setSlReviewResult("1");
			saaslog.setSlNetwork(network.getnCode());

			JhacSaas saas = new JhacSaas();
			saas.setsNetwork(network.getnCode());
			saas.setsBeginDate(now);
			saas.setsExpireDate(expireDate);
			saas.setsCreateId(user.getuId());
			saas.setsCreateTime(now);

			saasService.insert(saas);
			slService.insert(saaslog);

			service.insert(network);
		}
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping(value = "/api/network/query", method = RequestMethod.GET, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public JSONObject apiquery() {
		JSONObject data = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		List<JhacNetwork> list = service.query(map);
		data.put("data", list);
		return data;
	}

}
