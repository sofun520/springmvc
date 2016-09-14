package cn.springmvc.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;

import cn.springmvc.model.JhacEnum;
import cn.springmvc.model.JhacNetwork;
import cn.springmvc.model.JhacOrder;
import cn.springmvc.model.JhacOrderDetail;
import cn.springmvc.model.JhacProduct;
import cn.springmvc.model.JhacProductClass;
import cn.springmvc.model.JhacUser;
import cn.springmvc.model.Kucunliang;
import cn.springmvc.service.JhacEnumService;
import cn.springmvc.service.JhacNetworkService;
import cn.springmvc.service.JhacOrderDetailService;
import cn.springmvc.service.JhacOrderService;
import cn.springmvc.service.JhacProductClassService;
import cn.springmvc.service.JhacProductService;
import cn.springmvc.service.SmsService;
import cn.springmvc.util.SessionUtil;

@Controller
public class OrderController {

	@Autowired
	private JhacOrderService service;

	@Autowired
	private JhacProductClassService pcService;

	@Autowired
	private JhacEnumService enumService;

	@RequestMapping("/mvc/orderLocal/query")
	public ModelAndView query(HttpServletRequest request, JhacOrder order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM005");
		List<JhacEnum> enumList = enumService.query(map);
		List<JhacProductClass> pcList = pcService.query(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		// order.setoStatus("0");
		order.setoNetwork(user.getuNetworkCode());
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("oNetwork", user.getuNetworkCode());
		map.put("order", order);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacOrder> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("order", order);
		context.put("pcList", pcList);
		context.put("enumList", enumList);
		context.put("page", page);
		return new ModelAndView("order/query", context);
	}

	@RequestMapping("/mvc/orderLocal/save")
	public ModelAndView save(HttpServletRequest request, JhacOrder order) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		order.setoCreateId(user.getuId());
		order.setoCreateTime(new Date());
		order.setoNetwork(user.getuNetworkCode());
		service.insert(order);
		return new ModelAndView("redirect:query.do");
	}

	@RequestMapping("/mvc/orderLocal/delete")
	public ModelAndView delete(HttpServletRequest request) {
		String page = request.getParameter("page");
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		int id = Integer.parseInt(request.getParameter("id"));
		JhacOrder order = new JhacOrder();
		order.setoId(id);
		order.setoStatus("4");
		order.setoUpdateId(user.getuId());
		order.setoUpdateTime(new Date());
		service.update(order);
		// service.delete(id);
		return new ModelAndView("redirect:query.do?page=" + page);
	}

	@RequestMapping("/mvc/orderCorporation/query")
	public ModelAndView corquery(HttpServletRequest request, JhacOrder order) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM005");
		List<JhacEnum> enumList = enumService.query(map);
		List<JhacProductClass> pcList = pcService.query(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		order.setoStatus(order.getoStatus() == null ? "0" : order.getoStatus());
		// order.setoNetwork(user.getuNetworkCode());
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		// map.put("oNetwork", user.getuNetworkCode());
		map.put("order", order);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacOrder> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("order", order);
		context.put("pcList", pcList);
		context.put("enumList", enumList);
		context.put("page", page);
		return new ModelAndView("order/corQuery", context);
	}

	@Autowired
	private SmsService smsService;

	@Autowired
	private JhacNetworkService networkService;

	@Autowired
	private JhacProductService pService;

	@Autowired
	private JhacOrderDetailService odService;

	@RequestMapping("/mvc/orderCorporation/review")
	public ModelAndView review(HttpServletRequest request, JhacOrder order) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		Map<String, Object> context = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String orderId = request.getParameter("orderId");
			String id = request.getParameter("id");
			map.put("pNetwork", user.getuNetworkCode());
			List<Kucunliang> kclist = pService.kucunliang(map);
			
			for(Kucunliang kc:kclist){
				System.out.println("==="+kc.toString());
			}

			map.put("odOrderId", orderId);
			List<JhacOrderDetail> odList = odService.query(map);

			JhacOrder od = service.unionQuery(map).get(0);

			context.put("orderId", orderId);
			context.put("kclist", kclist);
			context.put("odList", odList);
			context.put("id", id);
			context.put("od", od);

			// order.setoUpdateTime(new Date());
			// service.update(order);
			/* 审核通过，发送短信提示 */
			/*
			 * if ("2".equals(order.getoStatus())) { JhacOrder od =
			 * service.find(order.getoId()); map.put("nCode", od.getoNetwork());
			 * JhacNetwork network = networkService.query(map).get(0);
			 * smsService.sendOrderRemin(network.getnLeader(), "订货申请审核通过，已发货",
			 * network.getnLeaderTelphone(), od.getoCode(), ""); }
			 */

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return new ModelAndView("order/review", context);
	}

	@RequestMapping("/mvc/orderCorporation/peihuo")
	public ModelAndView peihuo(HttpServletRequest request, JhacOrder order) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		ModelAndView model = null;

		Map<String, Object> context = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String orderId = request.getParameter("orderId");
			String status = request.getParameter("status");
			String id = request.getParameter("id");
			map.put("pNetwork", user.getuNetworkCode());
			List<JhacProduct> kclist = pService.query(map);
			

			map.put("odOrderId", orderId);
			List<JhacOrderDetail> odList = odService.query(map);

			JhacOrder od = service.unionQuery(map).get(0);

			context.put("orderId", orderId);
			context.put("kclist", kclist);
			context.put("odList", odList);
			context.put("id", id);
			context.put("od", od);

			order.setoId(Integer.parseInt(id));
			order.setoStatus(status);
			order.setoUpdateTime(new Date());
			order.setoUpdateId(user.getuId());
			service.update(order);
			if ("5".equals(status)) {
				model = new ModelAndView("redirect:query.do", context);
			} else if ("1".equals(status)) {
				model = new ModelAndView("order/peihuo", context);
			}

		} catch (Exception ex) {
			ex.printStackTrace();
		}
		return model;
	}

	@RequestMapping("/mvc/orderCorporation/peihuoPc")
	@ResponseBody
	public JSONObject peihuoPc(HttpServletRequest request) {
		JSONObject data = new JSONObject();
		try {
			String pcId = request.getParameter("pcId");
			String orderId = request.getParameter("orderId");
			String network = request.getParameter("network");
			String id = request.getParameter("id");
			String[] pcIds = pcId.split(",");
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("pcIds", pcIds);
			map.put("orderId", orderId);
			map.put("network", network);

			pService.peihuoPc(map);

			pService.useByMap(map);

			JhacOrder order = new JhacOrder();
			order.setoId(Integer.parseInt(id));
			order.setoStatus("2");
			service.update(order);

			data.put("success", "0");
			data.put("message", "配货成功");
		} catch (Exception ex) {
			data.put("success", "1");
			data.put("message", "配货失败");
		}
		return data;
	}

	@RequestMapping("/mvc/orderCorporation/fahuo")
	public ModelAndView fahuo(HttpServletRequest request, JhacOrder order) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		ModelAndView model = null;

		Map<String, Object> context = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String orderId = request.getParameter("orderId");
			String status = request.getParameter("status");
			String id = request.getParameter("id");
			map.put("pNetwork", user.getuNetworkCode());
			List<Kucunliang> kclist = pService.kucunliang(map);

			map.put("odOrderId", orderId);
			List<JhacOrderDetail> odList = odService.query(map);

			List<JhacProduct> pList = pService.fahuodan(map);

			JhacOrder od = service.unionQuery(map).get(0);

			context.put("orderId", orderId);
			context.put("kclist", kclist);
			context.put("odList", odList);
			context.put("pList", pList);
			context.put("id", id);
			context.put("od", od);

			order.setoId(Integer.parseInt(id));
			order.setoStatus(status);
			order.setoUpdateTime(new Date());
			service.update(order);

			model = new ModelAndView("order/fahuo", context);

			/* 审核通过，发送短信提示 */
			/*
			 * if ("2".equals(order.getoStatus())) { JhacOrder odr =
			 * service.find(order.getoId()); map.put("nCode",
			 * odr.getoNetwork()); JhacNetwork network =
			 * networkService.query(map).get(0);
			 * smsService.sendOrderRemin(network.getnLeader(), "订货申请审核通过，已发货",
			 * network.getnLeaderTelphone(), odr.getoCode(), ""); }
			 */

		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return model;
	}

	@RequestMapping("/mvc/orderCorporation/print")
	public ModelAndView print(HttpServletRequest request) {
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		ModelAndView model = null;

		Map<String, Object> context = new HashMap<String, Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String orderId = request.getParameter("orderId");
			String id = request.getParameter("id");
			map.put("pNetwork", user.getuNetworkCode());
			map.put("odOrderId", orderId);
			List<JhacProduct> pList = pService.fahuodan(map);

			JhacOrder od = service.unionQuery(map).get(0);

			context.put("orderId", orderId);
			context.put("pList", pList);
			context.put("id", id);
			context.put("od", od);

			model = new ModelAndView("order/print", context);
		} catch (Exception ex) {
			ex.printStackTrace();
		}

		return model;
	}

}
