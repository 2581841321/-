package com.etoak.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.etoak.bean.Dict;

public interface DictMapper {

	public List<Dict> queryDictList(@Param("dictGroup") String dictGroup);

}
