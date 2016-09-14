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
import org.springframework.web.servlet.ModelAndView;

import cn.springmvc.model.JhacEnum;
import cn.springmvc.model.JhacProduct;
import cn.springmvc.model.JhacProductClass;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacEnumService;
import cn.springmvc.service.JhacProductClassService;
import cn.springmvc.service.JhacProductService;
import cn.springmvc.util.SessionUtil;

@Controller
public class ProductController {

	@Autowired
	private JhacProductService service;

	@Autowired
	private JhacEnumService enumService;

	@Autowired
	private JhacProductClassService pcService;

	@RequestMapping("/mvc/productLocal/query")
	public ModelAndView query(HttpServletRequest request, JhacProduct product) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM004");
		List<JhacEnum> enumList = enumService.query(map);
		List<JhacProductClass> pcList = pcService.query(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("pNetwork", user.getuNetworkCode());
		map.put("pClass", product.getpClass());
		map.put("pName", product.getpName());
		map.put("pSerialno", product.getpSerialno());
		map.put("pUse", product.getpUse());

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacProduct> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("pcList", pcList);
		context.put("enumList", enumList);
		context.put("product", product);
		context.put("page", page);
		return new ModelAndView("product/local", context);
	}

	@RequestMapping("/mvc/productLocal/save")
	public ModelAndView save(HttpServletRequest request, JhacProduct product) {
		String page = request.getParameter("page");
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		if (StringUtils.isEmpty(product.getpId())) {
			product.setpCreateId(user.getuId());
			product.setpCreateTime(new Date());
			product.setpNetwork(user.getuNetworkCode());
			service.insert(product);
		} else {
			product.setpUpdateId(user.getuId());
			product.setpUpdateTime(new Date());
			service.update(product);
		}
		return new ModelAndView("redirect:query.do?page=" + page);

	}

	@RequestMapping("/mvc/productLocal/delete")
	public ModelAndView delete(HttpServletRequest request, JhacProduct product) {
		String page = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("id"));
		service.delete(id);
		return new ModelAndView("redirect:query.do?page=" + page);
	}

	@RequestMapping("/mvc/productCorporation/query")
	public ModelAndView corQuery(HttpServletRequest request, JhacProduct product) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("enumCode", "ENUM004");
		List<JhacEnum> enumList = enumService.query(map);
		List<JhacProductClass> pcList = pcService.query(map);

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("pNetwork", user.getuNetworkCode());
		map.put("pClass", product.getpClass());
		map.put("pName", product.getpName());
		map.put("pSerialno", product.getpSerialno());
		map.put("pUse", product.getpUse());

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacProduct> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("enumList", enumList);
		context.put("product", product);
		context.put("pcList", pcList);
		context.put("page", page);
		return new ModelAndView("product/corporation", context);
	}

	@RequestMapping("/mvc/productCorporation/save")
	public ModelAndView corSave(HttpServletRequest request, JhacProduct product) {
		String page = request.getParameter("page");
		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");
		if (StringUtils.isEmpty(product.getpId())) {
			product.setpCreateId(user.getuId());
			product.setpCreateTime(new Date());
			product.setpNetwork(user.getuNetworkCode());
			service.insert(product);
		} else {
			product.setpUpdateId(user.getuId());
			product.setpUpdateTime(new Date());
			service.update(product);
		}
		return new ModelAndView("redirect:query.do?page=" + page);

	}

	@RequestMapping("/mvc/productCorporation/delete")
	public ModelAndView corDelete(HttpServletRequest request,
			JhacProduct product) {
		String page = request.getParameter("page");
		int id = Integer.parseInt(request.getParameter("id"));
		service.delete(id);
		return new ModelAndView("redirect:query.do?page=" + page);
	}

}
