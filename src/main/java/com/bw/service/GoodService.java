package com.bw.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.bw.pojo.Brand;
import com.bw.pojo.Good;
import com.bw.pojo.Kind;
import com.bw.pojo.QueryModel;

public interface GoodService {
	List<Good> allg(QueryModel m);
	List<Brand> allb();
	List<Kind> allk();
	void save(Good good);
	void update(Good good);
	void delete(@Param("ids")String ids);
	Good getbyid(int id);
}
