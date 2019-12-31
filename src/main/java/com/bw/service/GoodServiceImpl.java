package com.bw.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bw.mapper.GoodMapper;
import com.bw.pojo.Brand;
import com.bw.pojo.Good;
import com.bw.pojo.Kind;
import com.bw.pojo.QueryModel;
import com.github.pagehelper.PageHelper;
@Service
public class GoodServiceImpl implements GoodService {
	
	@Resource
	private GoodMapper gm;
	public List<Good> allg(QueryModel m) {
		PageHelper.startPage(m.getPageNum(), m.getPageSize());
		return gm.allg(m);
	}

	public List<Brand> allb() {
		// TODO Auto-generated method stub
		return gm.allb();
	}

	public List<Kind> allk() {
		// TODO Auto-generated method stub
		return gm.allk();
	}

	public void save(Good good) {
		// TODO Auto-generated method stub
		gm.save(good);
	}

	public void update(Good good) {
		// TODO Auto-generated method stub
		gm.update(good);
	}

	public void delete(String ids) {
		// TODO Auto-generated method stub
		gm.delete(ids);
	}

	public Good getbyid(int id) {
		// TODO Auto-generated method stub
		return gm.getbyid(id);
	}

}
