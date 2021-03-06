package cn.springmvc.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import cn.springmvc.model.JhacCustomer;
import cn.springmvc.model.JhacUser;
import cn.springmvc.service.JhacCustomerService;
import cn.springmvc.util.SessionUtil;

@Controller
public class CustomerController {

	@Autowired
	private JhacCustomerService service;

	@RequestMapping("/mvc/customer/query")
	public ModelAndView query(HttpServletRequest request, JhacCustomer customer) {
		Map<String, Object> map = new HashMap<String, Object>();

		SessionUtil<JhacUser> su = new SessionUtil<JhacUser>();
		JhacUser user = su.getSession(request, "user");

		int page = request.getParameter("page") == null ? 1 : Integer
				.parseInt(request.getParameter("page"));
		int pageSize = 15;
		int startIndex = (page - 1) * pageSize;

		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		map.put("customer", customer);

		int count = service.count(map);
		int pageCount = (count + pageSize - 1) / pageSize;
		List<JhacCustomer> list = service.query(map);

		Map<String, Object> context = new HashMap<String, Object>();
		context.put("list", list);
		context.put("user", user);
		context.put("pageCount", pageCount);
		context.put("customer", customer);
		context.put("page", page);
		return new ModelAndView("customer/query", context);
	}

}
