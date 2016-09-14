package cn.springmvc.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacEnum;
import cn.springmvc.model.JhacNetwork;
import cn.springmvc.model.JhacSaas;
import cn.springmvc.model.JhacSaasLog;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacEnumService;
import cn.springmvc.service.JhacNetworkService;
import cn.springmvc.service.JhacSaasLogService;
import cn.springmvc.service.JhacSaasService;
import cn.springmvc.service.MaxCodeService;
import cn.springmvc.service.SmsService;
import cn.springmvc.util.DateUtils;
import cn.springmvc.util.SessionUtil;

@Controller
public class SaasController {

	@Autowired
	private JhacSaasService service;

	@Autowired
	private JhacSaasLogService slService;

	@Autowired
	private JhacEnumService enumService;

	@Autowired
	private MaxCodeService maxCodeService;

	@Autowired
	private JhacNetworkService networkService;

	@RequestMapping("/mvc/saasLocal/query")
	public ModelAndView query(HttpServletRequest request, JhacSaasLog saaslog) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM006");
		List<JhacEnum> enumList = enumService.query(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		JhacSaas saas = new JhacSaas();
		saas.setsNetwork(user.getuNetworkCode());
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("saas", saas);

		saaslog.setSlNetwork(user.getuNetworkCode());
		map.put("saaslog", saaslog);

		int count = slService.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		JhacSaas jhacsaas = null;
		List<JhacSaasLog> saasLogList = null;
		if (service.query(map).size() > 0) {
			jhacsaas = service.query(map).get(0);
			JhacSaasLog saasLog = new JhacSaasLog();
			saasLog.setSlSaasId(jhacsaas.getsId());
			saasLogList = slService.query(map);
		} else {
			jhacsaas = new JhacSaas();
			saasLogList = new ArrayList<JhacSaasLog>();
		}

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("jhacsaas", jhacsaas);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("saas", saas);
		context.put("saasLogList", saasLogList);
		context.put("enumList", enumList);
		context.put("pageCount", pageCount);
		context.put("page", page);
		return new ModelAndView("saasLocal/query", context);
	}

	@RequestMapping("/mvc/saasLocal/save")
	public ModelAndView save(HttpServletRequest request, JhacSaasLog saaslog) {
		String page = request.getParameter("page");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", "SA");
		map.put("xcode", "");
		maxCodeService.queryCode(map);
		String orderCode = (String) map.get("xcode");

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		saaslog.setSlNetwork(user.getuNetworkCode());
		saaslog.setSlOrder(orderCode);
		saaslog.setSlCreateId(user.getuId());
		saaslog.setSlCreateTime(new Date());
		slService.insert(saaslog);
		return new ModelAndView("redirect:query.do?page=" + page);
	}

	@RequestMapping("/mvc/saasLocal/delete")
	public ModelAndView localDelete(HttpServletRequest request,
			JhacSaasLog saaslog) {

		int id = Integer.parseInt(request.getParameter("id"));
		slService.delete(id);
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/mvc/saasCorporation/query")
	public ModelAndView corquery(HttpServletRequest request, JhacSaas saas) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM006");
		List<JhacEnum> enumList = enumService.query(map);

		List<JhacNetwork> networkList = networkService.notCreateSaas(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("saas", saas);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacSaas> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("saas", saas);
		context.put("pageCount", pageCount);
		context.put("networkList", networkList);
		context.put("enumList", enumList);
		context.put("page", page);
		return new ModelAndView("saasCorporation/query", context);
	}

	@RequestMapping("/mvc/saasCorporation/recored")
	public ModelAndView recored(HttpServletRequest request, JhacSaasLog saaslog) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM006");
		List<JhacEnum> enumList = enumService.query(map);
		map.put("enumCode", "ENUM007");
		List<JhacEnum> enumList1 = enumService.query(map);

		List<JhacNetwork> networkList = networkService.notCreateSaas(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("saaslog", saaslog);

		int count = slService.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacSaasLog> list = slService.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("saaslog", saaslog);
		context.put("networkList", networkList);
		context.put("enumList", enumList);
		context.put("enumList1", enumList);
		context.put("page", page);
		return new ModelAndView("saasCorporation/recored", context);
	}

	@RequestMapping("/mvc/saasCorporation/createSaas")
	public ModelAndView createSaas(HttpServletRequest request,
			JhacSaasLog saaslog) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("prefix", "SA");
		map.put("xcode", "");
		maxCodeService.queryCode(map);
		String orderCode = (String) map.get("xcode");

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		Date now = new Date();
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

		JhacSaas saas = new JhacSaas();
		saas.setsNetwork(saaslog.getSlNetwork());
		saas.setsBeginDate(now);
		saas.setsExpireDate(expireDate);
		saas.setsCreateId(user.getuId());
		saas.setsCreateTime(now);

		service.insert(saas);
		slService.insert(saaslog);

		return new ModelAndView("redirect:query.do");
	}

	@Autowired
	private SmsService smsService;

	@RequestMapping("/mvc/saasCorporation/review")
	public ModelAndView review(HttpServletRequest request, JhacSaasLog saaslog) {
		String page = request.getParameter("page");
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		if ("1".equals(saaslog.getSlReviewResult())) {
			Map<String, Object> map = new HashMap<String, Object>();
			JhacSaas saas = new JhacSaas();
			saas.setsNetwork(saaslog.getSlNetwork());
			map.put("saas", saas);
			saas = service.query(map).get(0);

			map.put("nCode", saas.getsNetwork());
			JhacNetwork network = networkService.query(map).get(0);

			JhacSaasLog saaslog2 = slService.find(saaslog.getSlId());

			Date newBeginDate = saas.getsExpireDate();
			Date newExpireDate = DateUtils.calcDate(newBeginDate,
					saaslog2.getSlTimeType(), saaslog2.getSlTimeNum());
			saaslog2.setSlId(saaslog.getSlId());
			saaslog2.setSlNewBegindate(saas.getsExpireDate());
			saaslog2.setSlOldExpiredate(saas.getsExpireDate());
			saaslog2.setSlNewExpiredate(newExpireDate);
			saaslog2.setSlReviewReason(saaslog.getSlReviewReason());
			saaslog2.setSlReviewResult(saaslog.getSlReviewResult());
			saaslog2.setSlReviewId(user.getuId());
			saaslog2.setSlUpdateId(user.getuId());
			saaslog2.setSlUpdateTime(new Date());

			saas.setsExpireDate(newExpireDate);
			saas.setsUpdateId(user.getuId());
			saas.setsUpdateTime(new Date());
			service.update(saas);
			slService.update(saaslog2);

			smsService.sendOrderRemin(network.getnLeader(), "SAAS服务续费已审核通过",
					network.getnLeaderTelphone(), saaslog.getSlOrder(),
					"");

		} else if ("0".equals(saaslog.getSlReviewResult())) {
			saaslog.setSlReviewId(user.getuId());
			saaslog.setSlUpdateId(user.getuId());
			saaslog.setSlUpdateTime(new Date());
			slService.update(saaslog);
		}

		return new ModelAndView("redirect:recored.do?page=" + page);
	}

}
