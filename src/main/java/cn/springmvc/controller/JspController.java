package cn.springmvc.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.springmvc.model.JhacOut;
import cn.springmvc.service.JhacOutService;

@Controller
@RequestMapping("/jasper")
public class JspController {

	@Autowired
	private JhacOutService outService;

	@RequestMapping("/query")
	public String query(Model model) {
		List<JhacOut> list = new ArrayList<JhacOut>();
		for (int i = 1; i < 50; i++) {
			JhacOut out1 = outService.find(i);
			list.add(out1);
		}

		JRDataSource jrDataSource = new JRBeanCollectionDataSource(list);
		// 动态指定报表模板url
		model.addAttribute("url", "/WEB-INF/jasper/report5.jasper");
		model.addAttribute("format", "pdf"); // 报表格式
		model.addAttribute("jrMainDataSource", jrDataSource);
		model.addAttribute("title", "月装车报表");
		return "reportView";
	}
}
