package com.etoak.mapper;

import org.apache.ibatis.annotations.Param;

import com.etoak.bean.User;

public interface UserMapper {
	
	/**
	 * 根据用户名和密码查询用户
	 * 
	 * @param name
	 * @param password
	 * @return
	 */
	User queryUser(@Param("name") String name, 
			@Param("password") String password);

}
