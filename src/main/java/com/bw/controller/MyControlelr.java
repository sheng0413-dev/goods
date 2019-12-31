package com.bw.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.pojo.Brand;
import com.bw.pojo.Good;
import com.bw.pojo.Kind;
import com.bw.pojo.QueryModel;
import com.bw.service.GoodService;
import com.bw.util.FileUtils;
import com.github.pagehelper.PageInfo;

@Controller
public class MyControlelr {
	@Resource
	private GoodService gs;
	
	@RequestMapping("all")
	public String allg(Model model,QueryModel m){
		List<Good> list = gs.allg(m);
		PageInfo<Good> page = new PageInfo<Good>(list);
		model.addAttribute("page", page);
		model.addAttribute("m", m);
		return "list";
	}
	
	@RequestMapping("looking")
	public void looking(String path,HttpServletResponse response,HttpServletRequest request) throws Exception{
		FileUtils.lookImg(path, request, response);
	}
	
	@RequestMapping("del")
	public String delI(String ids){
		gs.delete(ids);
		return "redirect:/all";
	}
	@RequestMapping("save")
	public String save(Good good,MultipartFile myfile) throws IllegalStateException, IOException{
		String address = FileUtils.upload(myfile);
		good.setAddress(address);
		good.setStatus(0);
		gs.save(good);
		return "redirect:/all";
	}
	@RequestMapping("update")
	public String update(Good good,MultipartFile myfile) throws IllegalStateException, IOException{
		String address = FileUtils.upload(myfile);
		good.setAddress(address);
		gs.update(good);
		return "redirect:/all";
	}
	
	@RequestMapping("allb")
	@ResponseBody
	public List<Brand> allb(){
		List<Brand> list = gs.allb();
		return list;
	}
	
	@RequestMapping("allk")
	@ResponseBody
	public List<Kind> allk(){
		List<Kind> list = gs.allk();
		return list;
	}
	
	@RequestMapping("getbyid")
	@ResponseBody
	public Good getbyid(int id){
		Good good = gs.getbyid(id);
		return good;
	}
	
}
