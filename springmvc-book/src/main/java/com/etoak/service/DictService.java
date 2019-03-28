package com.etoak.service;

import java.util.List;

import com.etoak.bean.Dict;

public interface DictService {

	public List<Dict> queryDictList(String dictGroup);
	
}
