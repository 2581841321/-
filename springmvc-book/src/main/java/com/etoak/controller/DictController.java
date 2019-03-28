package com.etoak.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.etoak.bean.Dict;
import com.etoak.service.DictService;

@RestController
public class DictController {

	@Autowired
	DictService dictService;

	@RequestMapping(value = "/dict/{dictGroup}", method = RequestMethod.GET)
	public List<Dict> queryDict(@PathVariable("dictGroup") String dictGroup) {
		return dictService.queryDictList(dictGroup);
	}

}
