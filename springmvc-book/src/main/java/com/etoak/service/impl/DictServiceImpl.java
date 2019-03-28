package com.etoak.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.etoak.bean.Dict;
import com.etoak.mapper.DictMapper;
import com.etoak.service.DictService;

@Service
public class DictServiceImpl implements DictService {

	@Autowired
	DictMapper dictMapper;

	@Override
	public List<Dict> queryDictList(String dictGroup) {
		return dictMapper.queryDictList(dictGroup);
	}

}
